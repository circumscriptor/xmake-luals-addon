"""Interrogate a local xmake executable for built-in configurations."""

import json
import shutil
import subprocess
from typing import Any


class XmakeInspector:
    """Query the xmake CLI for platforms, architectures, and other lists."""

    def __init__(self, xmake_path: str | None = None, *, enabled: bool = True):
        if enabled:
            self.xmake_path = xmake_path or shutil.which("xmake")
        else:
            self.xmake_path = None
        self._cache: dict[str, list[str]] = {}

    @classmethod
    def disabled(cls) -> "XmakeInspector":
        """Create an inspector that never invokes the xmake CLI."""
        return cls(enabled=False)

    @property
    def is_available(self) -> bool:
        return self.xmake_path is not None

    def query_list(self, list_name: str) -> list[str]:
        """Return the values of ``xmake show -l <list_name> --json``."""
        if not self.is_available:
            return []
        if list_name not in self._cache:
            self._cache[list_name] = self._fetch_list(list_name)
        return list(self._cache[list_name])

    def _fetch_list(self, list_name: str) -> list[str]:
        if self.xmake_path is None:
            return []
        try:
            result = subprocess.run(
                [self.xmake_path, "show", "-l", list_name, "--json"],
                capture_output=True,
                text=True,
                check=True,
                timeout=60,
            )
            data = self._parse_json(result.stdout)
        except (
            subprocess.SubprocessError,
            json.JSONDecodeError,
            FileNotFoundError,
            OSError,
        ):
            return []
        return self._extract_names(data)

    @staticmethod
    def _parse_json(output: str) -> Any:
        """Parse xmake JSON output, tolerating non-JSON preamble text."""
        text = output.strip()
        try:
            return json.loads(text)
        except json.JSONDecodeError:
            pass

        for opening, closing in (("[", "]"), ("{", "}")):
            start = text.find(opening)
            end = text.rfind(closing)
            if start != -1 and end > start:
                try:
                    return json.loads(text[start : end + 1])
                except json.JSONDecodeError:
                    continue
        raise json.JSONDecodeError("No JSON value found", text, 0)

    @staticmethod
    def _extract_names(data: Any) -> list[str]:
        if isinstance(data, list):
            return sorted(
                str(item["name"])
                if isinstance(item, dict) and "name" in item
                else str(item)
                for item in data
            )
        if isinstance(data, dict):
            return sorted(str(key) for key in data)
        return []

    def get_platforms(self) -> list[str]:
        return self.query_list("platforms")

    def get_architectures(self) -> list[str]:
        return self.query_list("architectures")

    def get_buildmodes(self) -> list[str]:
        return self.query_list("buildmodes")

    def get_toolchains(self) -> list[str]:
        return self.query_list("toolchains")

    def get_policies(self) -> list[str]:
        return self.query_list("policies")
