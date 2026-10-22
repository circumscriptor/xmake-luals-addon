"""Tests for documentation repository management."""

import zipfile
from pathlib import Path

import pytest

from xmake_luals.repo import RepoManager


def _write(path: Path, content: str = "content") -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(content, encoding="utf-8")


def test_finds_real_api_files_and_excludes_guides(cached_repo: Path):
    files = RepoManager(str(cached_repo)).get_api_files()
    relative_paths = {Path(path).relative_to(cached_repo).as_posix() for path in files}

    assert "docs/api/description/project-target.md" in relative_paths
    assert "docs/api/scripts/extension-modules/core/base/bytes.md" in relative_paths
    assert "docs/api/scripts/builtin-modules/os.md" in relative_paths
    assert not any("/guide/" in path for path in relative_paths)
    assert not any(path.endswith("/README.md") for path in relative_paths)
    assert files == sorted(files)


def test_reads_docs_commit_hash_from_git_checkout(tmp_path: Path, monkeypatch):
    repo = tmp_path / "repo"
    (repo / ".git").mkdir(parents=True)
    calls: list[list[str]] = []

    class _Result:
        stdout = "abc123\n"

    def fake_run(command, **kwargs):
        calls.append(command)
        return _Result()

    monkeypatch.setattr("xmake_luals.repo.shutil.which", lambda _: "/usr/bin/git")
    monkeypatch.setattr("xmake_luals.repo.subprocess.run", fake_run)

    assert RepoManager(str(repo)).get_commit_hash() == "abc123"
    assert calls == [["/usr/bin/git", "-C", str(repo), "rev-parse", "HEAD"]]


def test_commit_hash_is_optional_for_archive_checkouts(tmp_path: Path):
    assert RepoManager(str(tmp_path / "repo")).get_commit_hash() is None


def test_filters_synthetic_repository(tmp_path: Path):
    repo = tmp_path / "repo"
    _write(repo / "docs/api/description/target.md")
    _write(repo / "docs/api/scripts/foo.md")
    _write(repo / "docs/guide/getting-started.md")
    _write(repo / "docs/index.md")
    _write(repo / "docs/README.md")

    files = RepoManager(str(repo)).get_api_files()
    relative_paths = {Path(path).relative_to(repo).as_posix() for path in files}

    assert relative_paths == {
        "docs/api/description/target.md",
        "docs/api/scripts/foo.md",
    }


def test_custom_include_and_exclude_patterns(tmp_path: Path):
    repo = tmp_path / "repo"
    _write(repo / "docs/api/description/target.md")
    _write(repo / "docs/api/description/other.md")
    _write(repo / "docs/api/scripts/foo.md")

    files = RepoManager(str(repo)).get_api_files(
        whitelist=["docs/api/description/*.md"],
        blacklist=["**/other.md"],
    )

    assert [Path(path).name for path in files] == ["target.md"]


def test_safe_destination_rejects_path_traversal(tmp_path: Path):
    manager = RepoManager(str(tmp_path / "repo"))

    with pytest.raises(ValueError):
        manager._safe_destination("../outside.txt")


def test_extracts_archive_without_top_level_folder(tmp_path: Path):
    archive_path = tmp_path / "docs.zip"
    with zipfile.ZipFile(archive_path, "w") as archive:
        archive.writestr("xmake-docs-master/", "")
        archive.writestr(
            "xmake-docs-master/docs/api/description/target.md", "target docs"
        )
        archive.writestr("xmake-docs-master/docs/api/scripts/foo.md", "foo docs")
        archive.writestr("other-root/ignored.md", "ignored")

    repo = tmp_path / "repo"
    manager = RepoManager(str(repo))
    with zipfile.ZipFile(archive_path) as archive:
        manager._extract_archive(archive)

    assert (repo / "docs/api/description/target.md").read_text() == "target docs"
    assert (repo / "docs/api/scripts/foo.md").read_text() == "foo docs"
    assert not (repo / "other-root").exists()


def test_extract_archive_rejects_path_traversal(tmp_path: Path):
    archive_path = tmp_path / "evil.zip"
    with zipfile.ZipFile(archive_path, "w") as archive:
        archive.writestr("root/", "")
        archive.writestr("root/../../evil.txt", "evil")

    manager = RepoManager(str(tmp_path / "repo"))
    with zipfile.ZipFile(archive_path) as archive, pytest.raises(ValueError):
        manager._extract_archive(archive)


def test_ensure_repository_reuses_populated_directory(tmp_path: Path, monkeypatch):
    repo = tmp_path / "repo"
    _write(repo / "docs/api/description/target.md")
    manager = RepoManager(str(repo))
    monkeypatch.setattr(
        manager,
        "_clone_with_git",
        lambda: pytest.fail("should not clone an existing checkout"),
    )

    assert manager.ensure_repository() == str(repo)


def test_ensure_repository_clones_when_missing(tmp_path: Path, monkeypatch):
    repo = tmp_path / "repo"
    manager = RepoManager(str(repo))
    monkeypatch.setattr(manager, "_clone_with_git", lambda: True)

    assert manager.ensure_repository() == str(repo)


def test_ensure_repository_falls_back_to_archive(tmp_path: Path, monkeypatch):
    repo = tmp_path / "repo"
    manager = RepoManager(str(repo))
    monkeypatch.setattr(manager, "_clone_with_git", lambda: False)
    monkeypatch.setattr(
        manager,
        "_download_archive",
        lambda: _write(repo / "downloaded.txt"),
    )

    assert manager.ensure_repository() == str(repo)
    assert (repo / "downloaded.txt").is_file()
