"""Parser for VitePress documentation files."""

import os
import re
from dataclasses import dataclass, field

from .constants import (
    REGEX_CUSTOM_ANCHOR,
    REGEX_HTML_TAGS,
    REGEX_IDENTIFIER,
    REGEX_STOP_SECTIONS,
)


@dataclass
class DocParam:
    name: str
    type_name: str
    description: str


@dataclass
class DocFunction:
    api_id: str
    description: str
    link: str
    params: list[DocParam] = field(default_factory=list)
    return_type: str = "nil"
    is_scoped: bool = False
    scope: str | None = None
    class_name: str | None = None
    fn_args: list[str] = field(default_factory=list)


@dataclass
class DocFile:
    file_base: str
    doc_link: str
    is_instance: bool
    class_name: str | None
    functions: list[DocFunction] = field(default_factory=list)


class MarkdownParser:
    """Parses markdown into structured DocFile representations."""

    @staticmethod
    def _clean_heading(heading: str) -> str:
        heading = REGEX_CUSTOM_ANCHOR.sub("", heading)
        return REGEX_HTML_TAGS.sub("", heading).strip()

    @staticmethod
    def _split_args(arg_str: str) -> list[str]:
        args, current = [], []
        depth_brace, depth_paren, depth_angle = 0, 0, 0
        for ch in arg_str:
            if ch in ("{", "["):
                depth_brace += 1
            elif ch in ("}", "]"):
                depth_brace -= 1
            elif ch == "(":
                depth_paren += 1
            elif ch == ")":
                depth_paren -= 1
            elif ch == "<":
                depth_angle += 1
            elif ch == ">":
                depth_angle -= 1
            elif (
                ch == "," and depth_brace == 0 and depth_paren == 0 and depth_angle == 0
            ):
                args.append("".join(current).strip())
                current = []
                continue
            current.append(ch)
        if current:
            val = "".join(current).strip()
            if val:
                args.append(val)
        return args

    def parse_file(self, file_path: str, repo_root: str) -> DocFile | None:
        with open(file_path, "r", encoding="utf-8") as f:
            lines = f.read().splitlines()

        rel_path = (
            os.path.relpath(file_path, repo_root).replace("\\", "/").replace(".md", "")
        )
        rel_path = rel_path.removeprefix("docs/")

        is_instance = "api/scripts" in rel_path or "instance" in rel_path
        file_base = os.path.basename(rel_path)

        scope_candidate = file_base
        for pfx in [
            "project-",
            "project_",
            "configuration-",
            "configuration_",
            "custom-",
            "custom_",
        ]:
            scope_candidate = scope_candidate.removeprefix(pfx)
        default_scope = scope_candidate.replace("-dependencies", "").replace(
            "_dependencies", ""
        )
        class_name = (
            default_scope.replace("-instance", "").replace("_instance", "").capitalize()
            if is_instance
            else None
        )

        doc_link = f"https://xmake.io/{rel_path}"
        doc_file = DocFile(
            file_base=file_base,
            doc_link=doc_link,
            is_instance=is_instance,
            class_name=class_name,
        )

        # Split markdown by sections (## headings)
        sections: list[list[str]] = []
        current_section: list[str] = []
        for line in lines:
            if line.strip().startswith("## "):
                if current_section:
                    sections.append(current_section)
                current_section = [line]
            elif current_section:
                current_section.append(line)
        if current_section:
            sections.append(current_section)

        for section in sections:
            raw_heading = section[0][len("## ") :].strip()
            clean_heading = self._clean_heading(raw_heading)
            match = REGEX_IDENTIFIER.match(clean_heading)
            if not match:
                continue

            api_id = match.group(1)

            # 1. Description
            description = ""
            for line in section[1:]:
                line_s = line.strip()
                if not line_s:
                    continue
                if REGEX_STOP_SECTIONS.match(line_s) or line_s.startswith(
                    (":::", "```")
                ):
                    break
                description = line_s.lstrip("#").strip()
                break

            # 2. Prototype
            prototype_str = ""
            in_proto = False
            for line in section:
                line_s = line.strip()
                if "Function Prototype" in line_s and line_s.startswith("#"):
                    in_proto = True
                    continue
                if in_proto:
                    if line_s.startswith("```"):
                        if prototype_str:
                            break
                        continue
                    if line_s.startswith(":::"):
                        continue
                    if line_s:
                        prototype_str += (" " if prototype_str else "") + line_s

            # 3. Parameter table
            table_params: dict[str, str] = {}
            in_params = False
            for line in section:
                line_s = line.strip()
                if "Parameter Description" in line_s and line_s.startswith("#"):
                    in_params = True
                    continue
                if in_params:
                    if (
                        line_s.startswith("##")
                        or "Usage" in line_s
                        or "Return Value" in line_s
                    ):
                        break
                    if line_s.startswith("|"):
                        parts = [p.strip() for p in line_s.split("|")]
                        if len(parts) >= 3:
                            p_name = parts[1].replace("`", "")
                            p_desc = parts[2]
                            if p_name.lower() in (
                                "parameter",
                                "---",
                                ":---",
                                ":---:",
                                "---:",
                            ):
                                continue
                            if p_name.lower() == "no parameters":
                                table_params["__no_params__"] = "true"
                                continue
                            table_params[p_name] = p_desc

            # 4. Parse parameters and function arguments
            params: list[DocParam] = []
            fn_args: list[str] = []

            if not table_params.get("__no_params__") and prototype_str:
                m = re.search(r"\((.*)\)", prototype_str, re.DOTALL)
                if m and m.group(1).strip():
                    raw_args = self._split_args(m.group(1).strip())
                    has_vararg = False
                    for arg in raw_args:
                        if arg == "...":
                            has_vararg = True
                            desc = table_params.get("...", "Variable parameters")
                            params.append(DocParam("...", "any", desc))
                        elif arg.startswith("{") or "=" in arg:
                            desc = table_params.get(
                                "public|interface|private", "Configuration options"
                            )
                            params.append(DocParam("opt", "table?", desc))
                            if not has_vararg:
                                fn_args.append("opt")
                        elif ":" in arg:
                            name_part, type_part = [
                                part.strip() for part in arg.split(":", 1)
                            ]
                            desc = table_params.get(name_part, f"{name_part} parameter")
                            params.append(DocParam(name_part, type_part, desc))
                            if not has_vararg:
                                fn_args.append(name_part)
                        else:
                            name_part = arg.strip()
                            desc = table_params.get(name_part, f"{name_part} parameter")
                            params.append(DocParam(name_part, "any", desc))
                            if not has_vararg:
                                fn_args.append(name_part)
                    if has_vararg:
                        fn_args.append("...")

            anchor = api_id.replace(":", "-").replace("_", "-")
            link = f"{doc_link}#{anchor}"

            is_scoped = False
            scope = None
            if not is_instance:
                if ":" in api_id:
                    scope = api_id.split(":", 1)[0]
                    is_scoped = True
                elif api_id != default_scope and api_id != f"{default_scope}_end":
                    scope = default_scope
                    is_scoped = True

            doc_fn = DocFunction(
                api_id=api_id,
                description=description,
                link=link,
                params=params,
                is_scoped=is_scoped,
                scope=scope,
                class_name=class_name,
                fn_args=fn_args,
            )
            doc_file.functions.append(doc_fn)

        return doc_file
