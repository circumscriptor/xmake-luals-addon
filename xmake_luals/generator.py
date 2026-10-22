"""LuaLS annotation file generator."""

from pathlib import Path

from .models import DocFile, DocFunction

FILE_HEADER_TEMPLATE = """---@meta
---[{file_base}]({doc_link})"""

CLASS_HEADER_TEMPLATE = """---@class {class_name}
local {class_name} = {{}}"""

FUNCTION_TEMPLATE = """
---
{scope_doc}{description_doc}---[Open in browser]({link})
---
{params_doc}---@return {return_type}
function {function_signature} end
"""

EMPTY_RETURN_TYPES = frozenset({"any", "nil", ""})


class LuaLSGenerator:
    """Render domain objects as LuaLS annotation files."""

    def __init__(self, output_dir: str | Path):
        self.output_dir = Path(output_dir)

    def generate(self, doc_file: DocFile) -> str:
        """Write the definition file for ``doc_file`` and return its path."""
        target_path = self.output_path(doc_file)
        target_path.parent.mkdir(parents=True, exist_ok=True)
        target_path.write_text(self.render(doc_file), encoding="utf-8")
        return str(target_path)

    def output_path(self, doc_file: DocFile) -> Path:
        """Return the Lua file path that corresponds to ``doc_file``."""
        return self.output_dir / f"{doc_file.file_base}.lua"

    def render(self, doc_file: DocFile) -> str:
        """Render a :class:`DocFile` into LuaLS annotation source."""
        parts = [
            FILE_HEADER_TEMPLATE.format(
                file_base=doc_file.file_base,
                doc_link=doc_file.doc_link,
            )
        ]

        if doc_file.is_instance and doc_file.class_name:
            parts.append(CLASS_HEADER_TEMPLATE.format(class_name=doc_file.class_name))

        parts.extend(
            self._render_function(function, doc_file) for function in doc_file.functions
        )
        return "\n\n".join(parts).strip() + "\n"

    @classmethod
    def _render_function(cls, function: DocFunction, doc_file: DocFile) -> str:
        args = cls._clean_arguments(function)
        signature, return_type = cls._build_signature(function, doc_file, args)
        params_doc = cls._render_parameters(function, args)

        return FUNCTION_TEMPLATE.format(
            scope_doc=cls._render_scope(function),
            description_doc=cls._render_description(function),
            link=function.link,
            params_doc=params_doc,
            return_type=return_type,
            function_signature=signature,
        ).strip()

    @staticmethod
    def _clean_arguments(function: DocFunction) -> list[str]:
        """Return unique, valid argument names with the vararg last."""
        arguments: list[str] = []
        for argument in function.fn_args:
            cleaned = argument.rstrip("?").strip()
            if cleaned and cleaned not in arguments:
                arguments.append(cleaned)

        if "..." in arguments:
            arguments.remove("...")
            arguments.append("...")
        return arguments

    @classmethod
    def _build_signature(
        cls,
        function: DocFunction,
        doc_file: DocFile,
        arguments: list[str],
    ) -> tuple[str, str]:
        """Build the Lua function signature and resolve its return type."""
        argument_list = ", ".join(arguments)

        if doc_file.is_instance and doc_file.class_name:
            return cls._build_instance_signature(
                function,
                doc_file.class_name,
                argument_list,
            )

        return f"{function.short_name}({argument_list})", function.return_type

    @classmethod
    def _build_instance_signature(
        cls,
        function: DocFunction,
        class_name: str,
        argument_list: str,
    ) -> tuple[str, str]:
        """Build a signature for a class method, static method, or constructor."""
        return_type = function.return_type

        if function.is_method:
            name = function.method_name
            if name == "new" and return_type in EMPTY_RETURN_TYPES:
                return_type = class_name
            return f"{class_name}:{name}({argument_list})", return_type

        if function.is_static:
            name = function.static_name
            if name == "new" and return_type in EMPTY_RETURN_TYPES:
                return_type = class_name
            return f"{class_name}.{name}({argument_list})", return_type

        # Free-standing module function (e.g. ``bytes(...)``).
        if (
            return_type in EMPTY_RETURN_TYPES
            and function.api_id.lower() == class_name.lower()
        ):
            return_type = class_name
        return f"{function.api_id}({argument_list})", return_type

    @staticmethod
    def _render_parameters(function: DocFunction, arguments: list[str]) -> str:
        """Render ``---@param`` tags, skipping parameters absent from the signature."""
        allowed = set(arguments)
        lines: list[str] = []

        for param in function.params:
            name = param.clean_name
            if name not in allowed and not param.is_vararg:
                continue

            tag = f"{name}?" if param.is_optional and not param.is_vararg else name
            type_name = param.type_name.rstrip("?")
            lines.append(f"---@param {tag} {type_name} {param.description}".rstrip())

        return "".join(f"{line}\n" for line in lines)

    @staticmethod
    def _render_scope(function: DocFunction) -> str:
        if function.is_scoped and function.scope:
            return f"---**Scoped: {function.scope}**\n---\n"
        return ""

    @staticmethod
    def _render_description(function: DocFunction) -> str:
        if function.description:
            return f"---{function.description}\n---\n"
        return ""
