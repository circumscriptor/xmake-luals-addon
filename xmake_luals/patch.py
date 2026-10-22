"""Custom override and patching engine for LuaLS annotations."""

import json
import os
from typing import Any, ClassVar

from .parser import DocFile, DocFunction, DocParam


class DocPatcher:
    """Applies schema mappings and custom manual patches."""

    # Parameter name to schema type mapping
    TYPE_MAPPINGS: ClassVar[dict[str, str]] = {
        "kind": "TargetKind",
        "plat": "Platform",
        "platform": "Platform",
        "arch": "Architecture",
        "mode": "StripMode",
        "level": "WarningLevel",
        "optimize": "OptimizationLevel",
        "runtime": "Runtime",
        "languages": "LanguageStandard",
        "fpmodels": "FloatPointModel",
        "policy": "BuildPolicy",
    }

    def __init__(self, overrides_path: str = "overrides.json"):
        self.overrides = self._load_overrides(overrides_path)

    def _load_overrides(self, path: str) -> dict[str, Any]:
        if os.path.isfile(path):
            with open(path, "r", encoding="utf-8") as f:
                return json.load(f)
        return {}

    def patch_file(self, doc_file: DocFile) -> None:
        """Enrich and patch all functions inside a DocFile."""
        for fn in doc_file.functions:
            self._patch_function(fn, doc_file.is_instance)

    def _patch_function(self, fn: DocFunction, is_instance: bool) -> None:
        # 1. Map parameter types
        for p in fn.params:
            if p.name in self.TYPE_MAPPINGS:
                p.type_name = self.TYPE_MAPPINGS[p.name]
            elif "<string|array>" in p.type_name:
                p.type_name = "string|string[]"
            elif "<boolean>" in p.type_name:
                p.type_name = "boolean"
            elif "<number>" in p.type_name:
                p.type_name = "number"
            elif p.type_name.startswith("<function"):
                p.type_name = "fun(target: any, ...: any)"
            else:
                p.type_name = p.type_name.replace("<", "").replace(">", "") or "any"

        # 2. Infer return types
        if not is_instance:
            fn.return_type = "nil"
        else:
            fn.return_type = self._infer_instance_return(fn.api_id, fn.description)

        # 3. Apply manual overrides
        override_entry = self.overrides.get(fn.api_id)
        if override_entry:
            if "return_type" in override_entry:
                fn.return_type = override_entry["return_type"]
            if "params" in override_entry:
                fn.params = [
                    DocParam(p["name"], p["type"], p.get("desc", ""))
                    for p in override_entry["params"]
                ]
                fn.fn_args = [p.name for p in fn.params]

    @staticmethod
    def _infer_instance_return(api_id: str, desc: str) -> str:
        m_name = api_id.split(":")[-1].lower()
        if m_name in ("set", "add", "del", "remove") or m_name.startswith(
            ("set_", "add_", "remove_")
        ):
            return "nil"
        if m_name.startswith(("is_", "has_")):
            return "boolean"
        if m_name.startswith("check_"):
            return "number|nil" if m_name == "check_sizeof" else "boolean"
        if m_name in (
            "name",
            "kind",
            "basename",
            "filename",
            "version",
            "plat",
            "arch",
        ) or m_name.endswith(("file", "dir")):
            return "string"
        if m_name.endswith(("files", "dirs")):
            return "string[]"
        if m_name.endswith("batches") or m_name in ("sourcebatches", "deps"):
            return "table"
        if m_name in ("get", "values"):
            return "any"
        return "any"
