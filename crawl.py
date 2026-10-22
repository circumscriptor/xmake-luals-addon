import os
import re
import sys
import requests

if len(sys.argv) < 2:
    print("Error: required param is missing: name")
    print("Usage: python crawl.py <name> [instance=true|false]")
    print("Example: python crawl.py project-target")
    print("Example: python crawl.py target-instance true")
    quit()

name = sys.argv[1]
instance = False
if len(sys.argv) > 2:
    instance = sys.argv[2].lower() == "true"

# Normalize input name and determine documentation path
clean_input = name.replace(".md", "").strip()
if clean_input.startswith("docs/"):
    clean_input = clean_input[len("docs/"):]

if "/" in clean_input:
    doc_path = clean_input
else:
    normalized_name = clean_input.replace("_", "-")
    if instance:
        doc_path = f"api/scripts/{normalized_name}"
    else:
        doc_path = f"api/description/{normalized_name}"

file_base = os.path.basename(clean_input)
file_name = f"library/{file_base}.lua"

if os.path.isfile(file_name):
    r = input(f"File '{file_name}' already exists. Overwrite? [y|n]\n")
    if r.strip().lower() not in ("y", "yes"):
        print("[INFO] Operation cancelled by user.")
        quit()

os.makedirs("library", exist_ok=True)

xmake_source_format = "https://raw.githubusercontent.com/xmake-io/xmake-docs/master/docs/{0}.md"
doc_link = f"https://xmake.io/{doc_path}"

# Fetch markdown content
if os.path.isfile(name):
    print(f"[INFO] Reading local documentation file: '{name}'")
    with open(name, "r", encoding="utf-8") as f_in:
        lines = f_in.read().splitlines()
else:
    source_url = xmake_source_format.format(doc_path)
    print(f"[INFO] Fetching documentation from: {source_url}")
    req = requests.get(source_url)
    req.raise_for_status()
    lines = req.text.splitlines()

print(f"[INFO] Successfully loaded {len(lines)} lines of markdown.")

# Determine default scope & class name
scope_candidate = os.path.basename(doc_path).replace(".md", "")
for prefix in ["project-", "project_", "configuration-", "configuration_", "custom-", "custom_"]:
    if scope_candidate.startswith(prefix):
        scope_candidate = scope_candidate[len(prefix):]
default_scope = scope_candidate.replace("-dependencies", "").replace("_dependencies", "")

class_base = default_scope.replace("-instance", "").replace("_instance", "")
class_name = class_base.capitalize()

print(f"[INFO] Default scope inferred: '{default_scope}'")
if instance:
    print(f"[INFO] Instance class name: '{class_name}'")

# Detect layout format (2026 VitePress uses '## API', 2023 uses '### API')
is_new_layout = any(re.match(r"^##\s+[a-zA-Z_]", line.strip()) for line in lines)
print(f"[INFO] Documentation format detected: {'2026 (VitePress)' if is_new_layout else '2023 (Docsify)'}")

# Fallback parameter definitions for interfaces without explicit Function Prototype blocks
FALLBACK_PARAMS = {
    "set_targetdir": [("dir", "string", "Target file output directory"), ("opt", "table?", "Target directory options")],
    "set_objectdir": [("dir", "string", "Object file output directory")],
    "set_dependir": [("dir", "string", "Dependent file output directory")],
    "add_imports": [("name", "string", "Module name"), ("...", "string", "Module names")],
    "add_cxflags": [("flag", "string", "C/C++ compilation flag"), ("...", "string", "C/C++ compilation flags")],
    "add_options": [("name", "string", "Option name"), ("...", "string", "Option names")],
}


def map_type(raw_type: str) -> str:
    """Map documentation type annotations into LuaLS EmmyLua types."""
    raw_type = raw_type.strip()
    if raw_type.startswith("<") and raw_type.endswith(">"):
        raw_type = raw_type[1:-1].strip()

    if not raw_type:
        return "any"

    if raw_type.startswith("function"):
        m = re.match(r"^function\s*\((.*?)\)", raw_type)
        if m:
            args_str = m.group(1).strip()
            if args_str:
                fn_args = [a.strip() for a in args_str.split(",")]
                typed_args = []
                for a in fn_args:
                    if a == "target":
                        typed_args.append("target: any")
                    elif a == "sourcefile":
                        typed_args.append("sourcefile: string")
                    elif a in ("opt", "options"):
                        typed_args.append("opt?: table")
                    elif a in ("sourcebatch", "jobgraph"):
                        typed_args.append(f"{a}: any")
                    else:
                        typed_args.append(f"{a}: any")
                return f"fun({', '.join(typed_args)})"
            return "fun()"
        return "function"

    if "string|array" in raw_type or "array|string" in raw_type:
        return "string|string[]"
    if raw_type == "array":
        return "string[]|table"
    if raw_type in ("string", "boolean", "number", "any", "table"):
        return raw_type

    cleaned = raw_type.replace("<", "").replace(">", "").replace("$", "")
    return cleaned if cleaned else "any"


def split_args(arg_str: str) -> list[str]:
    """Split argument strings by commas, ignoring commas inside brackets or braces."""
    args = []
    current = []
    depth_brace = 0
    depth_paren = 0
    depth_angle = 0
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
        elif ch == "," and depth_brace == 0 and depth_paren == 0 and depth_angle == 0:
            args.append("".join(current).strip())
            current = []
            continue
        current.append(ch)
    if current:
        item = "".join(current).strip()
        if item:
            args.append(item)
    return args


def infer_return_type(api_id: str, description: str, is_instance: bool, explicit_return: str | None = None) -> str:
    """Infer EmmyLua return type from explicit section, name semantics, or description heuristics."""
    if explicit_return:
        return explicit_return

    # In description domain (e.g. project-target.md), configuration APIs return nil
    if not is_instance:
        return "nil"

    m_name = api_id.split(":")[-1].lower()

    # 1. Mutating / setter methods return nil
    if m_name in ("set", "add", "del", "remove") or m_name.startswith(("set_", "add_", "remove_", "del_")):
        return "nil"

    # 2. Boolean checks
    if m_name.startswith(("is_", "has_")):
        return "boolean"
    if m_name.startswith("check_"):
        if m_name == "check_sizeof":
            return "number|nil"
        return "boolean"

    # 3. Path / string getters
    if m_name in ("name", "kind", "basename", "filename", "version", "plat", "arch"):
        return "string"
    if m_name.endswith(("file", "dir")):
        return "string"

    # 4. Collections / Lists
    if m_name.endswith(("files", "dirs")):
        return "string[]"
    if m_name.endswith("batches") or m_name in ("sourcebatches", "deps"):
        return "table"

    # 5. Generic value getters
    if m_name in ("get", "values"):
        return "any"

    # 6. Description heuristics
    desc_lower = description.lower()
    if any(k in desc_lower for k in ("path", "name", "directory", "filename")):
        return "string"
    if any(k in desc_lower for k in ("whether", "check if", "is true")):
        return "boolean"
    if "list of" in desc_lower or "array of" in desc_lower:
        return "string[]|table"

    return "any"


# Split document into API sections
heading_prefix = "## " if is_new_layout else ("#### " if instance else "### ")

sections = []
current_section = []
for line in lines:
    if line.strip().startswith(heading_prefix):
        if current_section:
            sections.append(current_section)
        current_section = [line]
    elif current_section:
        current_section.append(line)
if current_section:
    sections.append(current_section)

parsed_count = 0

with open(file_name, "w", encoding="utf-8") as f:
    f.write("---@meta\n")
    f.write(f"---[{file_base}]({doc_link})\n")
    if instance:
        f.write(f"\n---@class {class_name}\nlocal {class_name} = {{}}\n")

    for section in sections:
        header_line = section[0].strip()
        raw_heading = header_line[len(heading_prefix):].strip()

        # Remove custom anchor tags {#...} and HTML tags (<Badge ...>)
        raw_heading = re.sub(r"\{#[^}]+\}", "", raw_heading)
        raw_heading = re.sub(r"<[^>]+>", "", raw_heading).strip()

        # Validate that the heading is an API identifier
        id_match = re.match(r"^([a-zA-Z_][a-zA-Z0-9_]*(?::[a-zA-Z_][a-zA-Z0-9_]*)?)$", raw_heading)
        if not id_match:
            continue

        api_id = id_match.group(1)

        # 1. Extract description (supports both subheadings and plain text)
        description = ""
        for line in section[1:]:
            line_s = line.strip()
            if not line_s:
                continue

            if re.match(r"^#+\s+(Function Prototype|Parameter Description|Usage|Return Value|Example)", line_s, re.IGNORECASE):
                break
            if line_s.startswith(":::") or line_s.startswith("```"):
                break

            if line_s.startswith("#"):
                clean_desc = re.sub(r"^#+\s*", "", line_s).strip()
                if clean_desc:
                    description = clean_desc
                    break
            else:
                description = line_s
                break

        # 2. Extract Function Prototype
        prototype_str = ""
        in_prototype_block = False
        for line in section:
            line_s = line.strip()
            if "Function Prototype" in line_s and line_s.startswith("#"):
                in_prototype_block = True
                continue
            if in_prototype_block:
                if line_s.startswith("```"):
                    if prototype_str:
                        break  # end of code block
                    continue
                if line_s.startswith(":::"):
                    continue
                if line_s:
                    prototype_str += (" " if prototype_str else "") + line_s

        # 3. Extract Parameter Description table
        table_params = {}
        in_param_table = False
        for line in section:
            line_s = line.strip()
            if "Parameter Description" in line_s and line_s.startswith("#"):
                in_param_table = True
                continue
            if in_param_table:
                if line_s.startswith("##") or "Usage" in line_s or "Return Value" in line_s:
                    break
                if line_s.startswith("|"):
                    parts = [p.strip() for p in line_s.split("|")]
                    if len(parts) >= 3:
                        p_name = parts[1].replace("`", "")
                        p_desc = parts[2]
                        if p_name.lower() in ("parameter", "---", ":---", ":---:", "---:"):
                            continue
                        if p_name.lower() == "no parameters":
                            table_params["__no_params__"] = True
                            continue
                        table_params[p_name] = p_desc

        # 4. Extract Return Value if documented
        explicit_return = None
        in_return_section = False
        for line in section:
            line_s = line.strip()
            if "Return Value" in line_s and line_s.startswith("#"):
                in_return_section = True
                continue
            if in_return_section:
                if line_s.startswith("##") or "Usage" in line_s:
                    break
                if line_s.startswith("|"):
                    parts = [p.strip() for p in line_s.split("|")]
                    if len(parts) >= 3:
                        t_name = parts[1].replace("`", "").strip().lower()
                        if t_name in ("type", "---", ":---", ":---:", "---:"):
                            continue
                        explicit_return = map_type(t_name)
                        break

        return_type = infer_return_type(api_id, description, instance, explicit_return)

        # 5. Resolve Parameters
        params = []
        fn_args = []

        if table_params.get("__no_params__"):
            params = []
        elif prototype_str:
            m = re.search(r"\((.*)\)", prototype_str, re.DOTALL)
            inner_args = m.group(1).strip() if m else ""
            if inner_args:
                raw_args = split_args(inner_args)
                has_vararg = False

                for arg in raw_args:
                    if arg == "...":
                        has_vararg = True
                        desc = table_params.get("...", "Variable parameters")
                        params.append({"name": "...", "type": "any", "desc": desc})
                    elif arg.startswith("{") or "=" in arg:
                        opt_name = "opt"
                        opt_desc = "Configuration options"
                        if "public|interface|private" in table_params:
                            opt_desc = table_params["public|interface|private"]
                        elif any(k not in ("...", "deps", "files", "name") for k in table_params):
                            custom_keys = [k for k in table_params if k not in ("...", "deps", "files", "name")]
                            opt_desc = f"Options ({', '.join(custom_keys[:3])})"
                        params.append({"name": opt_name, "type": "table?", "desc": opt_desc})
                        if not has_vararg:
                            fn_args.append(opt_name)
                    elif ":" in arg:
                        p_name, p_type = [part.strip() for part in arg.split(":", 1)]
                        call_name = "is_default" if p_name == "default" and api_id == "set_default" else p_name
                        luals_type = map_type(p_type)
                        desc = table_params.get(p_name, f"{p_name} parameter")
                        params.append({"name": call_name, "type": luals_type, "desc": desc})
                        if not has_vararg:
                            fn_args.append(call_name)
                    else:
                        p_name = arg.strip()
                        desc = table_params.get(p_name, f"{p_name} parameter")
                        params.append({"name": p_name, "type": "any", "desc": desc})
                        if not has_vararg:
                            fn_args.append(p_name)

                if has_vararg:
                    fn_args.append("...")
        elif api_id in FALLBACK_PARAMS:
            for fb_name, fb_type, fb_desc in FALLBACK_PARAMS[api_id]:
                params.append({"name": fb_name, "type": fb_type, "desc": fb_desc})
                if fb_name == "..." and "..." not in fn_args:
                    fn_args.append("...")
                elif fb_name != "...":
                    fn_args.append(fb_name)

        # 6. Determine function signature and scope
        anchor = api_id.replace(":", "-").replace("_", "-")
        link = f"{doc_link}#{anchor}"

        if instance:
            if ":" in api_id:
                m_name = api_id.split(":", 1)[1]
                function_name = f"{class_name}:{m_name}"
            else:
                function_name = f"{class_name}:{api_id}"
            is_scoped = False
            scope = None
        else:
            if ":" in api_id:
                scope, function_name = api_id.split(":", 1)
                is_scoped = True
            else:
                function_name = api_id
                if function_name == default_scope or function_name == f"{default_scope}_end":
                    is_scoped = False
                    scope = default_scope
                else:
                    is_scoped = True
                    scope = default_scope

        # Build LuaLS documentation comments
        doc_lines = ["", "---"]
        if is_scoped:
            doc_lines.append(f"---**Scoped: {scope}**")
            doc_lines.append("---")
        if description:
            doc_lines.append(f"---{description}")
            doc_lines.append("---")
        doc_lines.append(f"---[Open in browser]({link})")
        doc_lines.append("---")

        for p in params:
            doc_lines.append(f"---@param {p['name']} {p['type']} {p['desc']}".rstrip())
        doc_lines.append(f"---@return {return_type}")

        doc_lines.append(f"function {function_name}({', '.join(fn_args)}) end\n")
        f.write("\n".join(doc_lines))

        parsed_count += 1
        arg_repr = ", ".join(fn_args)
        scope_info = f"Scoped: {scope}" if is_scoped else "Global"
        print(f"[PARSED] {function_name}({arg_repr}) -> {return_type} ({len(params)} params)")

print("-" * 60)
print(f"[SUCCESS] Generated {parsed_count} API definitions in '{file_name}'.")
