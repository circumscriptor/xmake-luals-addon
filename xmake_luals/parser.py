"""Parser for VitePress-style xmake documentation files."""

import os
import re
from collections.abc import Sequence

from .constants import DOCS_SITE_BASE_URL
from .markdown import (
    clean_heading,
    extract_arguments,
    section_heading,
    split_arguments,
    split_prototypes,
    split_sections,
)
from .models import DocFile, DocFunction, DocParam

IDENTIFIER_RE = re.compile(
    r"^([a-zA-Z_][a-zA-Z0-9_]*(?:(?::|\.)[a-zA-Z_][a-zA-Z0-9_]*)?)$"
)
STOP_SECTIONS_RE = re.compile(
    r"^#+\s+(Function Prototype|Parameter Description|Usage|Return Value|Example)",
    re.IGNORECASE,
)

SCOPE_PREFIXES = (
    "project-",
    "project_",
    "configuration-",
    "configuration_",
    "custom-",
    "custom_",
)

# Documentation pages use level-two headings for both API entries and prose
# sections. These titles are never API names, even though some of them (such as
# ``Usage``) happen to look like valid Lua identifiers.
NON_API_SECTION_TITLES = frozenset(
    {
        "api",
        "configuration",
        "constants",
        "example",
        "examples",
        "faq",
        "function prototype",
        "installation",
        "introduction",
        "note",
        "notes",
        "options",
        "overview",
        "parameter description",
        "parameters",
        "references",
        "remarks",
        "return value",
        "return values",
        "returns",
        "see also",
        "types",
        "usage",
    }
)

NO_PARAMS_MARKER = "__no_params__"


class MarkdownParser:
    """Parse markdown pages into structured :class:`DocFile` objects."""

    def parse_file(self, file_path: str, repo_root: str) -> DocFile:
        """Parse a single documentation file relative to ``repo_root``."""
        with open(file_path, "r", encoding="utf-8") as handle:
            lines = handle.read().splitlines()

        doc_file, default_scope = self._build_doc_file(file_path, repo_root)

        for section in split_sections(lines):
            function = self._parse_section(
                section,
                doc_file=doc_file,
                default_scope=default_scope,
            )
            if function is not None:
                doc_file.functions.append(function)

        if not doc_file.functions:
            function = self._parse_title_section(lines, doc_file, default_scope)
            if function is not None:
                doc_file.functions.append(function)

        return doc_file

    def _parse_title_section(
        self,
        lines: Sequence[str],
        doc_file: DocFile,
        default_scope: str,
    ) -> DocFunction | None:
        """Parse pages whose API is documented directly under the page title.

        Builtin modules such as ``import`` and ``print`` use the level-one
        heading as the function name instead of repeating it under ``##``.
        """
        if doc_file.module_name is None:
            return None

        for index, raw_line in enumerate(lines):
            if not raw_line.startswith("# "):
                continue

            title = clean_heading(raw_line[2:].strip())
            if IDENTIFIER_RE.match(title) is None:
                return None
            if not any("Function Prototype" in line for line in lines):
                return None

            section = [f"## {title}", *lines[index + 1 :]]
            return self._parse_section(section, doc_file, default_scope)

        return None

    @staticmethod
    def _build_doc_file(file_path: str, repo_root: str) -> tuple[DocFile, str]:
        """Derive file-level metadata and the default scope from its path."""
        rel_path = (
            os.path.relpath(file_path, repo_root).replace("\\", "/").replace(".md", "")
        )
        rel_path = rel_path.removeprefix("docs/")

        is_builtin_module = rel_path.startswith("api/scripts/builtin-modules/")
        is_instance = (
            "api/scripts" in rel_path or "instance" in rel_path
        ) and not is_builtin_module
        raw_base = os.path.basename(rel_path)
        default_scope = MarkdownParser._default_scope(raw_base)
        class_name = (
            default_scope.replace("-instance", "").replace("_instance", "").capitalize()
            if is_instance
            else None
        )

        doc_file = DocFile(
            file_base=raw_base.replace("-", "_"),
            doc_link=f"{DOCS_SITE_BASE_URL}/{rel_path}",
            is_instance=is_instance,
            class_name=class_name,
            module_name=raw_base if is_builtin_module else None,
        )
        return doc_file, default_scope

    @staticmethod
    def _default_scope(raw_base: str) -> str:
        """Infer the implicit scope (e.g. ``target``) from a page filename."""
        scope = raw_base
        for prefix in SCOPE_PREFIXES:
            scope = scope.removeprefix(prefix)
        return scope.replace("-dependencies", "").replace("_dependencies", "")

    def _parse_section(
        self,
        section: Sequence[str],
        doc_file: DocFile,
        default_scope: str,
    ) -> DocFunction | None:
        """Parse one level-two section into a function definition."""
        heading = clean_heading(section_heading(section))
        if heading.casefold() in NON_API_SECTION_TITLES:
            return None

        api_id = IDENTIFIER_RE.match(heading)
        if api_id is None:
            return None

        api_id_value = api_id.group(1)
        if doc_file.module_name is None and "." in api_id_value:
            # Outside builtin module pages, dotted headings are names of
            # policies, rules, or imported extension module APIs rather than
            # functions belonging to the current page.
            return None

        parameter_table = self._parse_parameter_table(section)
        params, fn_args = self._parse_arguments(
            self._parse_prototype_lines(section),
            parameter_table,
        )
        is_scoped, scope = self._resolve_scope(
            api_id_value, doc_file.is_instance, default_scope
        )

        return DocFunction(
            api_id=api_id_value,
            description=self._parse_description(section),
            link=f"{doc_file.doc_link}#{self._anchor(api_id_value)}",
            params=params,
            is_scoped=is_scoped,
            scope=scope,
            class_name=doc_file.class_name,
            fn_args=fn_args,
        )

    @staticmethod
    def _parse_description(section: Sequence[str]) -> str:
        """Read the short description that precedes the API details."""
        for raw_line in section[1:]:
            line = raw_line.strip()
            if not line:
                continue
            if STOP_SECTIONS_RE.match(line) or line.startswith((":::", "```")):
                break
            return line.lstrip("#").strip()
        return ""

    @staticmethod
    def _parse_prototype_lines(section: Sequence[str]) -> list[str]:
        """Collect the lines inside the ``Function Prototype`` code block."""
        prototype_lines: list[str] = []
        in_prototype = False

        for raw_line in section:
            line = raw_line.strip()
            if "Function Prototype" in line and line.startswith("#"):
                in_prototype = True
                continue
            if not in_prototype:
                continue
            if line.startswith("```"):
                if prototype_lines:
                    break
                continue
            if line.startswith(":::"):
                continue
            if line:
                prototype_lines.append(line)

        return prototype_lines

    @staticmethod
    def _parse_parameter_table(section: Sequence[str]) -> dict[str, str]:
        """Parse the ``Parameter Description`` markdown table."""
        parameters: dict[str, str] = {}
        in_parameters = False

        for raw_line in section:
            line = raw_line.strip()
            if "Parameter Description" in line and line.startswith("#"):
                in_parameters = True
                continue
            if not in_parameters:
                continue
            if line.startswith("##") or "Usage" in line or "Return Value" in line:
                break

            if "no parameters" in line.lower():
                parameters[NO_PARAMS_MARKER] = "true"
                continue
            if not line.startswith("|"):
                continue

            parts = [part.strip() for part in line.split("|")]
            if len(parts) < 3:
                continue

            name = parts[1].replace("`", "")
            description = parts[2]
            if name.lower() in ("parameter", "---", ":---", ":---:", "---:"):
                continue
            if name.lower() == "no parameters":
                parameters[NO_PARAMS_MARKER] = "true"
                continue
            parameters[name] = description

        return parameters

    @staticmethod
    def _parse_arguments(
        prototype_lines: Sequence[str],
        parameter_table: dict[str, str],
    ) -> tuple[list[DocParam], list[str]]:
        """Turn prototype arguments and table descriptions into parameters."""
        if parameter_table.get(NO_PARAMS_MARKER) or not prototype_lines:
            return [], []

        params: list[DocParam] = []
        fn_args: list[str] = []
        seen_args: set[str] = set()

        for prototype in split_prototypes(prototype_lines):
            arguments = extract_arguments(prototype)
            if arguments is None or not arguments.strip():
                continue

            for argument in split_arguments(arguments):
                param, name = MarkdownParser._parse_argument(argument, parameter_table)
                if param is None or name in seen_args:
                    continue
                params.append(param)
                seen_args.add(name)

                # Lua does not allow anything after a variadic argument, so a
                # trailing config table is kept in ``params`` for type
                # information but must not become a positional argument.
                if not param.is_config or "..." not in fn_args:
                    fn_args.append(name)

        return params, fn_args

    @staticmethod
    def _parse_argument(
        argument: str, parameter_table: dict[str, str]
    ) -> tuple[DocParam | None, str]:
        """Parse one prototype argument such as ``name: <string>``."""
        argument = argument.strip()
        if not argument:
            return None, ""

        if argument.startswith("{") or "=" in argument:
            description = parameter_table.get(
                "public|interface|private", "Configuration options"
            )
            return (
                DocParam(
                    "opt",
                    "table",
                    description,
                    is_optional=True,
                    is_config=True,
                ),
                "opt",
            )

        if ":" in argument:
            name_part, type_part = (part.strip() for part in argument.split(":", 1))
            clean_name = name_part.rstrip("?").strip()
            description = parameter_table.get(clean_name, f"{clean_name} parameter")
            is_optional = (
                name_part.endswith("?")
                or type_part.endswith("?")
                or MarkdownParser._description_marks_optional(description)
            )
            return (
                DocParam(
                    clean_name,
                    type_part.rstrip("?"),
                    description,
                    is_optional=is_optional,
                ),
                clean_name,
            )

        clean_name = argument.rstrip("?").strip()
        description = parameter_table.get(clean_name, f"{clean_name} parameter")
        return (
            DocParam(
                clean_name,
                "any",
                description,
                is_optional=MarkdownParser._description_marks_optional(description),
            ),
            clean_name,
        )

    @staticmethod
    def _description_marks_optional(description: str) -> bool:
        """Whether a parameter description explicitly says it is optional."""
        normalized = description.casefold().strip()
        if normalized.startswith("optional"):
            return True
        if "(optional" in normalized:
            return True
        return normalized.rstrip(" .").endswith(", optional")

    @staticmethod
    def _resolve_scope(
        api_id: str, is_instance: bool, default_scope: str
    ) -> tuple[bool, str | None]:
        """Determine the annotation scope for a function."""
        if is_instance:
            return False, None
        if ":" in api_id:
            return True, api_id.split(":", 1)[0]
        return True, default_scope

    @staticmethod
    def _anchor(api_id: str) -> str:
        """Convert an API id into the corresponding markdown anchor."""
        return api_id.replace(":", "-").replace("_", "-")
