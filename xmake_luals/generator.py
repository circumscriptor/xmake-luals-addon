"""LuaLS annotation file generator."""

import os

from .constants import (
    LUA_CLASS_HEADER_TEMPLATE,
    LUA_FILE_HEADER_TEMPLATE,
    LUA_FUNCTION_TEMPLATE,
)
from .parser import DocFile, DocFunction


class LuaLSGenerator:
    """Generates Lua annotation code from domain objects."""

    def __init__(self, output_dir: str):
        self.output_dir = output_dir

    def generate(self, doc_file: DocFile) -> str:
        """Write out Lua definition file and return output path."""
        target_path = os.path.join(self.output_dir, f"{doc_file.file_base}.lua")
        os.makedirs(os.path.dirname(target_path), exist_ok=True)

        content = []
        content.append(
            LUA_FILE_HEADER_TEMPLATE.format(
                file_base=doc_file.file_base,
                doc_link=doc_file.doc_link,
            ).strip()
        )

        if doc_file.is_instance and doc_file.class_name:
            content.append(
                LUA_CLASS_HEADER_TEMPLATE.format(
                    class_name=doc_file.class_name,
                ).strip()
            )

        for fn in doc_file.functions:
            content.append(
                self._render_function(fn, doc_file.is_instance, doc_file.class_name)
            )

        with open(target_path, "w", encoding="utf-8") as f:
            f.write("\n\n".join(content).strip() + "\n")

        return target_path

    @staticmethod
    def _render_function(
        fn: DocFunction, is_instance: bool, class_name: str | None
    ) -> str:
        scope_doc = (
            f"---**Scoped: {fn.scope}**\n---\n" if fn.is_scoped and fn.scope else ""
        )
        desc_doc = f"---{fn.description}\n---\n" if fn.description else ""

        params_doc = ""
        for p in fn.params:
            params_doc += (
                f"---@param {p.name} {p.type_name} {p.description}".rstrip() + "\n"
            )

        if is_instance and class_name:
            m_name = fn.api_id.split(":")[-1]
            func_sig = f"{class_name}:{m_name}({', '.join(fn.fn_args)})"
        else:
            func_name = fn.api_id.split(":")[-1] if ":" in fn.api_id else fn.api_id
            func_sig = f"{func_name}({', '.join(fn.fn_args)})"

        return LUA_FUNCTION_TEMPLATE.format(
            scope_doc=scope_doc,
            description_doc=desc_doc,
            link=fn.link,
            params_doc=params_doc,
            return_type=fn.return_type,
            function_signature=func_sig,
        ).strip()
