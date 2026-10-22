"""Manage the local xmake documentation cache and file discovery."""

import fnmatch
import io
import os
import shutil
import subprocess
import zipfile

from .constants import (
    DEFAULT_EXCLUDE,
    DEFAULT_INCLUDE,
    DEFAULT_REPO_DIR,
    DEFAULT_REPO_URL,
    DEFAULT_ZIP_URL,
)


class RepoManager:
    """Clone or download the xmake documentation repository on demand."""

    def __init__(
        self,
        repo_dir: str = DEFAULT_REPO_DIR,
        repo_url: str = DEFAULT_REPO_URL,
        zip_url: str = DEFAULT_ZIP_URL,
    ):
        self.repo_dir = repo_dir
        self.repo_url = repo_url
        self.zip_url = zip_url

    def ensure_repository(self) -> str:
        """Return a populated docs checkout, fetching it if necessary."""
        if self._is_populated():
            return self.repo_dir

        os.makedirs(self.repo_dir, exist_ok=True)
        if self._clone_with_git():
            return self.repo_dir

        self._download_archive()
        return self.repo_dir

    def get_commit_hash(self) -> str | None:
        """Return the checked-out docs commit hash, if it is available."""
        if not os.path.exists(os.path.join(self.repo_dir, ".git")):
            return None

        git_path = shutil.which("git")
        if git_path is None:
            return None

        try:
            result = subprocess.run(
                [git_path, "-C", self.repo_dir, "rev-parse", "HEAD"],
                check=True,
                capture_output=True,
                text=True,
                timeout=30,
            )
        except (subprocess.SubprocessError, OSError):
            return None

        commit_hash = result.stdout.strip()
        return commit_hash or None

    def get_api_files(
        self,
        whitelist: list[str] | None = None,
        blacklist: list[str] | None = None,
    ) -> list[str]:
        """Discover markdown files allowed by the include/exclude patterns."""
        include = DEFAULT_INCLUDE if whitelist is None else whitelist
        exclude = DEFAULT_EXCLUDE if blacklist is None else blacklist

        matched: list[str] = []
        for path in self._iter_markdown_files():
            relative_path = os.path.relpath(path, self.repo_dir).replace("\\", "/")
            if self._matches_any(relative_path, exclude):
                continue
            if self._matches_any(relative_path, include):
                matched.append(path)
        return sorted(matched)

    def _is_populated(self) -> bool:
        return os.path.isdir(self.repo_dir) and bool(os.listdir(self.repo_dir))

    def _iter_markdown_files(self) -> list[str]:
        files: list[str] = []
        for root, _, filenames in os.walk(self.repo_dir):
            files.extend(
                os.path.join(root, filename)
                for filename in filenames
                if filename.endswith(".md")
            )
        return files

    @staticmethod
    def _matches_any(path: str, patterns: list[str]) -> bool:
        return any(fnmatch.fnmatch(path, pattern) for pattern in patterns)

    def _clone_with_git(self) -> bool:
        """Shallow-clone the docs repository, returning ``False`` on failure."""
        git_path = shutil.which("git")
        if git_path is None:
            return False

        try:
            subprocess.run(
                [git_path, "clone", "--depth", "1", self.repo_url, self.repo_dir],
                check=True,
                capture_output=True,
                timeout=300,
            )
        except (subprocess.SubprocessError, OSError):
            return False
        return True

    def _download_archive(self) -> None:
        """Download and extract the repository archive as a git fallback."""
        try:
            import requests
        except ImportError as exc:  # pragma: no cover - dependency is declared
            raise RuntimeError(
                "The 'requests' package is required to download the docs archive."
            ) from exc

        response = requests.get(self.zip_url, timeout=60)
        response.raise_for_status()
        with zipfile.ZipFile(io.BytesIO(response.content)) as archive:
            self._extract_archive(archive)

    def _extract_archive(self, archive: zipfile.ZipFile) -> None:
        """Extract the repository, stripping the GitHub top-level folder."""
        members = archive.infolist()
        if not members:
            return

        root_prefix = members[0].filename.split("/", 1)[0] + "/"
        for member in members:
            if not member.filename.startswith(root_prefix):
                continue
            relative_path = member.filename[len(root_prefix) :]
            if not relative_path:
                continue

            destination = self._safe_destination(relative_path)
            if member.is_dir():
                os.makedirs(destination, exist_ok=True)
                continue

            os.makedirs(os.path.dirname(destination), exist_ok=True)
            with archive.open(member) as source, open(destination, "wb") as target:
                shutil.copyfileobj(source, target)

    def _safe_destination(self, relative_path: str) -> str:
        """Resolve an archive member path and reject path traversal."""
        root = os.path.realpath(self.repo_dir)
        destination = os.path.realpath(os.path.join(root, relative_path))
        if os.path.commonpath((root, destination)) != root:
            raise ValueError(f"Archive member escapes repository: {relative_path}")
        return destination
