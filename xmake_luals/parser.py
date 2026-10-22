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
    is_optional: bool = False

    @property
    def clean_name(self) -> str:
        """Name guaranteed to be valid Lua syntax (no trailing ?)."""
        return self.name.rstrip("?").strip()


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

    @staticmethod
    def _extract_base_type(type_str: str) -> str:
        """Extract scalar element type from arrays or unions (e.g. string|string[] -> string)."""
        t = type_str.replace("<", "").replace(">", "").rstrip("?").strip()
        parts = [p.replace("[]", "").strip() for p in t.split("|")]
        return parts[0] if parts else "string"

    def parse_file(self, file_path: str, repo_root: str) -> DocFile | None:
        with open(file_path, "r", encoding="utf-8") as f:
            lines = f.read().splitlines()

        rel_path = (
            os.path.relpath(file_path, repo_root).replace("\\", "/").replace(".md", "")
        )
        rel_path = rel_path.removeprefix("docs/")

        is_instance = "api/scripts" in rel_path or "instance" in rel_path

        raw_base = os.path.basename(rel_path)
        file_base = raw_base.replace("-", "_")

        scope_candidate = raw_base
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

            # 2. Prototype - collect each line independently to support overloads
            prototype_lines: list[str] = []
            in_proto = False
            for line in section:
                line_s = line.strip()
                if "Function Prototype" in line_s and line_s.startswith("#"):
                    in_proto = True
                    continue
                if in_proto:
                    if line_s.startswith("```"):
                        if prototype_lines:
                            break
                        continue
                    if line_s.startswith(":::"):
                        continue
                    if line_s:
                        prototype_lines.append(line_s)

            # 3. Parameter table & text detection
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
                    # Detect prose "no parameters"
                    if "no parameters" in line_s.lower():
                        table_params["__no_params__"] = "true"
                        continue
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

            # 4. Parse parameters and function arguments across prototype lines
            params: list[DocParam] = []
            fn_args: list[str] = []

            if not table_params.get("__no_params__") and prototype_lines:
                seen_args = set()
                for proto_line in prototype_lines:
                    # Non-greedy match per single line
                    m = re.search(r"\((.*?)\)", proto_line)
                    if not m or not m.group(1).strip():
                        continue

                    raw_args = self._split_args(m.group(1).strip())
                    for arg in raw_args:
                        arg_clean = arg.strip()
                        if not arg_clean:
                            continue

                        if arg_clean.startswith("{") or "=" in arg_clean:
                            clean_name = "opt"
                            if clean_name not in seen_args:
                                desc = table_params.get(
                                    "public|interface|private", "Configuration options"
                                )
                                params.append(
                                    DocParam("opt", "table", desc, is_optional=True)
                                )
                                fn_args.append("opt")
                                seen_args.add("opt")
                        elif ":" in arg_clean:
                            name_part, type_part = [
                                p.strip() for p in arg_clean.split(":", 1)
                            ]
                            clean_name = name_part.rstrip("?").strip()
                            if clean_name not in seen_args:
                                is_opt = name_part.endswith("?") or type_part.endswith(
                                    "?"
                                )
                                desc = table_params.get(
                                    clean_name, f"{clean_name} parameter"
                                )
                                params.append(
                                    DocParam(
                                        clean_name,
                                        type_part.rstrip("?"),
                                        desc,
                                        is_optional=is_opt,
                                    )
                                )
                                fn_args.append(clean_name)
                                seen_args.add(clean_name)
                        else:
                            clean_name = arg_clean.rstrip("?").strip()
                            if clean_name not in seen_args:
                                desc = table_params.get(
                                    clean_name, f"{clean_name} parameter"
                                )
                                params.append(DocParam(clean_name, "any", desc))
                                fn_args.append(clean_name)
                                seen_args.add(clean_name)

            anchor = api_id.replace(":", "-").replace("_", "-")
            link = f"{doc_link}#{anchor}"

            # 5. Correctly handle scope for constructor / bare module names
            is_scoped = False
            scope = None
            if not is_instance:
                if ":" in api_id:
                    scope = api_id.split(":", 1)[0]
                    is_scoped = True
                else:
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
