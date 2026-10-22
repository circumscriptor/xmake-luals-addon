"""Schema manager and generator for ``common.lua``."""

import json
import os
from pathlib import Path
from typing import Any

from .xmake import XmakeInspector

CLI_ALIAS_QUERIES: dict[str, str] = {
    "Platform": "get_platforms",
    "Architecture": "get_architectures",
    "CompilationMode": "get_buildmodes",
    "Toolchain": "get_toolchains",
    "BuildPolicy": "get_policies",
}


class SchemaManager:
    """Manage LSP type aliases/classes and generate ``library/common.lua``."""

    def __init__(self, schema_path: str, inspector: XmakeInspector):
        self.schema_path = schema_path
        self.inspector = inspector
        self.data: dict[str, Any] = self._load_schema()

    def _load_schema(self) -> dict[str, Any]:
        if not os.path.isfile(self.schema_path):
            return {"aliases": {}, "classes": {}}
        with open(self.schema_path, "r", encoding="utf-8") as handle:
            data = json.load(handle)
        if not isinstance(data, dict):
            raise TypeError(
                f"Schema file must contain a JSON object: {self.schema_path}"
            )
        return data

    def enrich_from_cli(self) -> None:
        """Merge live values from ``xmake show -l ... --json`` into aliases."""
        if not self.inspector.is_available:
            return

        aliases = self.data.setdefault("aliases", {})
        for alias_name, query_name in CLI_ALIAS_QUERIES.items():
            values = getattr(self.inspector, query_name)()
            if not values:
                continue
            aliases[alias_name] = sorted(set(aliases.get(alias_name, []) + values))

    def generate_common_lua(self, output_path: str) -> str:
        """Write the common definitions file and return its path."""
        target_path = Path(output_path)
        target_path.parent.mkdir(parents=True, exist_ok=True)
        target_path.write_text(self.render_common_lua(), encoding="utf-8")
        return str(target_path)

    def render_common_lua(self) -> str:
        """Render aliases and classes as LuaLS annotations."""
        lines = [
            "---@meta",
            "---Automatically generated xmake type definitions schema",
            "",
        ]

        for alias_name, values in self.data.get("aliases", {}).items():
            lines.append(self._render_alias(alias_name, values))
        for class_name, metadata in self.data.get("classes", {}).items():
            lines.append(self._render_class(class_name, metadata))

        return "\n".join(lines).strip() + "\n"

    @staticmethod
    def _render_alias(alias_name: str, values: list[str]) -> str:
        supported = f"---Supported {alias_name}"
        if not values:
            return f"{supported}\n---@alias {alias_name} string\n"
        joined_values = "|".join(f'"{value}"' for value in values)
        return f"{supported}\n---@alias {alias_name} string|{joined_values}\n"

    @staticmethod
    def _render_class(class_name: str, metadata: dict[str, Any]) -> str:
        lines = [f"---@class {class_name}"]
        for field_name, field_type in metadata.get("fields", {}).items():
            lines.append(f"---@field {field_name} {field_type}")
        lines.append("")
        return "\n".join(lines)
