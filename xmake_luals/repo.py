"""Manages local documentation cache and file filtering."""

import fnmatch
import io
import os
import shutil
import subprocess
import zipfile

import requests

from .constants import DEFAULT_EXCLUDE, DEFAULT_INCLUDE, DEFAULT_ZIP_URL


class RepoManager:
    """Manages cloning or downloading the documentation repository."""

    def __init__(self, repo_dir: str = ".cache/xmake-docs"):
        self.repo_dir = repo_dir

    def ensure_repository(self) -> str:
        """Ensure local documentation exists, cloning or downloading archive if necessary."""
        if os.path.isdir(self.repo_dir) and os.listdir(self.repo_dir):
            return self.repo_dir

        os.makedirs(self.repo_dir, exist_ok=True)
        git_path = shutil.which("git")

        if git_path:
            try:
                subprocess.run(
                    [
                        git_path,
                        "clone",
                        "--depth",
                        "1",
                        "https://github.com/xmake-io/xmake-docs.git",
                        self.repo_dir,
                    ],
                    check=True,
                    capture_output=True,
                )
                return self.repo_dir
            except subprocess.SubprocessError:
                pass

        # Fallback to downloading zip archive
        response = requests.get(DEFAULT_ZIP_URL, timeout=30)
        response.raise_for_status()
        with zipfile.ZipFile(io.BytesIO(response.content)) as z:
            # Extract root folder without extra prefix
            prefix = z.namelist()[0]
            for member in z.infolist():
                if member.filename.startswith(prefix):
                    rel_path = member.filename[len(prefix) :]
                    if not rel_path:
                        continue
                    target_path = os.path.join(self.repo_dir, rel_path)
                    if member.is_dir():
                        os.makedirs(target_path, exist_ok=True)
                    else:
                        os.makedirs(os.path.dirname(target_path), exist_ok=True)
                        with z.open(member) as src, open(target_path, "wb") as dst:
                            dst.write(src.read())

        return self.repo_dir

    def get_api_files(
        self,
        whitelist: list[str] = DEFAULT_INCLUDE,
        blacklist: list[str] = DEFAULT_EXCLUDE,
    ) -> list[str]:
        """Discover markdown files according to whitelist and blacklist patterns."""
        matched_files = []
        for root, _, filenames in os.walk(self.repo_dir):
            for file in filenames:
                if not file.endswith(".md"):
                    continue
                abs_path = os.path.join(root, file)
                rel_path = os.path.relpath(abs_path, self.repo_dir).replace("\\", "/")

                # Check blacklist first
                if any(fnmatch.fnmatch(rel_path, pattern) for pattern in blacklist):
                    continue

                # Check whitelist
                if any(fnmatch.fnmatch(rel_path, pattern) for pattern in whitelist):
                    matched_files.append(abs_path)

        return sorted(matched_files)
