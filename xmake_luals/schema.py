"""Schema manager and generator for common.lua."""

import json
import os
from typing import Any

from .xmake import XmakeInspector


class SchemaManager:
    """Manages LSP types schema and generates library/common.lua."""

    def __init__(self, schema_path: str, inspector: XmakeInspector):
        self.schema_path = schema_path
        self.inspector = inspector
        self.data: dict[str, Any] = self._load_schema()

    def _load_schema(self) -> dict[str, Any]:
        if os.path.isfile(self.schema_path):
            with open(self.schema_path, "r", encoding="utf-8") as f:
                return json.load(f)
        return {"aliases": {}, "classes": {}}

    def enrich_from_cli(self) -> None:
        """Enrich schema aliases with live values from `xmake show -l ... --json`."""
        if not self.inspector.is_available:
            return

        aliases = self.data.setdefault("aliases", {})
        cli_mappings = {
            "Platform": self.inspector.get_platforms(),
            "Architecture": self.inspector.get_architectures(),
            "CompilationMode": self.inspector.get_buildmodes(),
            "Toolchain": self.inspector.get_toolchains(),
            "BuildPolicy": self.inspector.get_policies(),
        }

        for alias_name, items in cli_mappings.items():
            if items:
                aliases[alias_name] = sorted(set(aliases.get(alias_name, []) + items))

    def generate_common_lua(self, output_path: str) -> None:
        """Write common.lua definition file for Lua Language Server."""
        lines = [
            "---@meta",
            "---Automatically generated xmake type definitions schema",
            "",
        ]

        # Generate @alias entries
        for alias_name, values in self.data.get("aliases", {}).items():
            lines.append(f"---Supported {alias_name}")
            if values:
                joined_vals = "|".join(f'"{v}"' for v in values)
                lines.append(f"---@alias {alias_name} string|{joined_vals}\n")
            else:
                lines.append(f"---@alias {alias_name} string\n")

        # Generate @class entries
        for class_name, meta in self.data.get("classes", {}).items():
            lines.append(f"---@class {class_name}")
            for field_name, field_type in meta.get("fields", {}).items():
                lines.append(f"---@field {field_name} {field_type}")
            lines.append("")

        os.makedirs(os.path.dirname(output_path), exist_ok=True)
        with open(output_path, "w", encoding="utf-8") as f:
            f.write("\n".join(lines).strip() + "\n")
