"""Custom override and patching engine for LuaLS annotations."""

import json
import os
from typing import Any

from .models import DocFile, DocFunction, DocParam
from .return_inference import infer_instance_return
from .type_mapping import map_parameter_types


class DocPatcher:
    """Enrich parsed documentation and apply user-provided overrides."""

    def __init__(self, overrides_path: str = "overrides.json"):
        self.overrides = self._load_overrides(overrides_path)

    @staticmethod
    def _load_overrides(path: str) -> dict[str, Any]:
        """Load the optional overrides file, ignoring a missing file."""
        if not os.path.isfile(path):
            return {}
        with open(path, "r", encoding="utf-8") as handle:
            data = json.load(handle)
        if not isinstance(data, dict):
            raise TypeError(f"Overrides file must contain a JSON object: {path}")
        return data

    def patch_file(self, doc_file: DocFile) -> None:
        """Enrich and patch every function in ``doc_file``."""
        for function in doc_file.functions:
            self.patch_function(function, doc_file.is_instance)

    def patch_function(self, function: DocFunction, is_instance: bool) -> None:
        """Apply all transformations to a single function."""
        map_parameter_types(function.params)
        function.fn_args = [arg.rstrip("?").strip() for arg in function.fn_args]
        function.return_type = (
            infer_instance_return(function.api_id) if is_instance else "nil"
        )
        self._apply_override(function)

    def _apply_override(self, function: DocFunction) -> None:
        """Apply a manual override, if one exists for the API id."""
        override = self.overrides.get(function.api_id)
        if not isinstance(override, dict):
            return

        if "return_type" in override:
            function.return_type = str(override["return_type"])
        if "params" in override:
            function.params = self._parse_override_params(
                function.api_id, override["params"]
            )
            function.fn_args = [param.clean_name for param in function.params]

    @staticmethod
    def _parse_override_params(api_id: str, entries: Any) -> list[DocParam]:
        """Convert override JSON entries into :class:`DocParam` objects."""
        if not isinstance(entries, list):
            raise TypeError(f"Override 'params' must be a list for API id: {api_id}")

        params: list[DocParam] = []
        for entry in entries:
            if (
                not isinstance(entry, dict)
                or "name" not in entry
                or "type" not in entry
            ):
                raise ValueError(
                    f"Override parameters require 'name' and 'type': {api_id}"
                )
            name = str(entry["name"])
            params.append(
                DocParam(
                    name=name.rstrip("?"),
                    type_name=str(entry["type"]),
                    description=str(entry.get("desc", "")),
                    is_optional=name.endswith("?")
                    or bool(entry.get("optional", False)),
                )
            )
        return params
