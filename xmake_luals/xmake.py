import json
import shutil
import subprocess


class XmakeInspector:
    """Interrogates local xmake executable for built-in configurations."""

    def __init__(self, xmake_path: str | None = None):
        self.xmake_path = xmake_path or shutil.which("xmake")

    @property
    def is_available(self) -> bool:
        return self.xmake_path is not None

    def query_list(self, list_name: str) -> list[str]:
        """Query `xmake show -l <list_name> --json` and return a clean list of keys."""
        if not self.is_available:
            return []

        try:
            cmd = [self.xmake_path, "show", "-l", list_name, "--json"]
            result = subprocess.run(cmd, capture_output=True, text=True, check=True)
            data = json.loads(result.stdout)

            if isinstance(data, list):
                clean_names = []
                for item in data:
                    # If it's an object/dict with a "name" key (like toolchains)
                    if isinstance(item, dict) and "name" in item:
                        clean_names.append(str(item["name"]))
                    # If it's already a plain name string (like architectures/platforms)
                    else:
                        clean_names.append(str(item))
                return sorted(clean_names)

            if isinstance(data, dict):
                return sorted(str(key) for key in data)
        except (subprocess.SubprocessError, json.JSONDecodeError, FileNotFoundError):
            pass
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
