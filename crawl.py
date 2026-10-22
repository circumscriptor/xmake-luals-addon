import os
import re
import sys
import requests

if len(sys.argv) < 2:
    print("required param is missing: name")
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
    r = input("Overwrite the existing one? [y|n]\n")
    if r == "" or r == "n":
        print("no operation")
        quit()

os.makedirs("library", exist_ok=True)

xmake_source_format = "https://raw.githubusercontent.com/xmake-io/xmake-docs/master/docs/{0}.md"
doc_link = f"https://xmake.io/{doc_path}"

lua_template = '''
---
---{description}
---
---[Open in browser]({link})
---
---@param
---@return
function {function_name}() end
'''

lua_scoped_template = '''
---
---**Scoped: {scope}**
---
---{description}
---
---[Open in browser]({link})
---
---@param
---@return
function {function_name}() end
'''

# Fetch markdown content (reads local file if path exists, otherwise fetches from GitHub)
if os.path.isfile(name):
    with open(name, "r", encoding="utf-8") as f_in:
        lines = f_in.read().splitlines()
else:
    req = requests.get(xmake_source_format.format(doc_path))
    req.raise_for_status()
    lines = req.text.splitlines()

# Determine default scope from filename (e.g. "project-target" -> "target", "configuration-option" -> "option")
scope_candidate = os.path.basename(doc_path).replace(".md", "")
for prefix in ["project-", "project_", "configuration-", "configuration_", "custom-", "custom_"]:
    if scope_candidate.startswith(prefix):
        scope_candidate = scope_candidate[len(prefix):]
default_scope = scope_candidate.replace("-dependencies", "").replace("_dependencies", "")

# Detect whether the file follows 2026 layout (## API) or 2023 layout (### API)
is_new_layout = any(re.match(r"^##\s+[a-zA-Z_]", line.strip()) for line in lines)

if is_new_layout:
    xmake_id_prefix = "## "
    xmake_description_prefix = "### "
else:
    if instance:
        xmake_id_prefix = "#### "
        xmake_description_prefix = "- "
    else:
        xmake_id_prefix = "### "
        xmake_description_prefix = "#### "

current_id = ""

with open(file_name, "w", encoding="utf-8") as f:
    f.write("---@meta\n")
    f.write(f"---[{file_base}]({doc_link})\n")

    for line in lines:
        line = line.strip()

        if line.startswith(xmake_id_prefix):
            raw_heading = line[len(xmake_id_prefix):].strip()
            # Remove custom anchors {#...} and HTML tags like <Badge ... />
            raw_heading = re.sub(r"\{#[^}]+\}", "", raw_heading)
            raw_heading = re.sub(r"<[^>]+>", "", raw_heading).strip()

            # Ensure it matches a valid function / identifier pattern
            match = re.match(r"^([a-zA-Z_][a-zA-Z0-9_]*(?::[a-zA-Z_][a-zA-Z0-9_]*)?)$", raw_heading)
            if match:
                current_id = match.group(1)
            else:
                current_id = ""

        elif current_id and line.startswith(xmake_description_prefix):
            description = line[len(xmake_description_prefix):].strip()

            # Slugify anchor for VitePress URL
            anchor = current_id.replace(":", "-").replace("_", "-")
            link = f"{doc_link}#{anchor}"

            if instance:
                if ":" in current_id:
                    function_name = current_id.capitalize()
                else:
                    function_name = f"{default_scope.capitalize()}:{current_id}"
                f.write(lua_template.format(link=link, description=description, function_name=function_name))
            else:
                if ":" in current_id:
                    scope, function_name = current_id.split(":", 1)
                    is_scoped = True
                else:
                    function_name = current_id
                    if function_name == default_scope or function_name == f"{default_scope}_end":
                        is_scoped = False
                        scope = default_scope
                    else:
                        is_scoped = True
                        scope = default_scope

                if is_scoped:
                    f.write(lua_scoped_template.format(link=link, description=description, function_name=function_name, scope=scope))
                else:
                    f.write(lua_template.format(link=link, description=description, function_name=function_name))

            current_id = ""
