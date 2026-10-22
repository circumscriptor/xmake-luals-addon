"""Constants and string templates for xmake LuaLS generator."""

import re

# Repository & URL settings
DEFAULT_REPO_URL = "https://github.com/xmake-io/xmake-docs.git"
DEFAULT_ZIP_URL = "https://github.com/xmake-io/xmake-docs/archive/refs/heads/master.zip"
DOCS_SITE_BASE_URL = "https://xmake.io"

# File patterns and search directories
DEFAULT_DOCS_SUBDIR = "docs"
DEFAULT_OUTPUT_DIR = "library"
DEFAULT_SCHEMA_FILE = "schema.json"
DEFAULT_OVERRIDES_FILE = "overrides.json"

# Whitelist patterns: only parse API descriptions and scripts
DEFAULT_INCLUDE = [
    "docs/api/description/*.md",
    "docs/api/scripts/*.md",
    "api/description/*.md",
    "api/scripts/*.md",
]

# Blacklist patterns: exclude guides, indexes, manuals and tutorials
DEFAULT_EXCLUDE = [
    "**/guide/**",
    "**/manual/**",
    "**/examples/**",
    "**/index.md",
    "**/README.md",
    "**/getting-started.md",
    "**/faq.md",
]

# Formatting templates
LUA_FILE_HEADER_TEMPLATE = """---@meta
---[{file_base}]({doc_link})
"""

LUA_CLASS_HEADER_TEMPLATE = """
---@class {class_name}
local {class_name} = {{}}
"""

LUA_FUNCTION_TEMPLATE = """
---
{scope_doc}{description_doc}---[Open in browser]({link})
---
{params_doc}---@return {return_type}
function {function_signature} end
"""

# Regular expressions
REGEX_HEADING_NEW = re.compile(
    r"^##\s+([a-zA-Z_][a-zA-Z0-9_]*(?::[a-zA-Z_][a-zA-Z0-9_]*)?)"
)
REGEX_IDENTIFIER = re.compile(r"^([a-zA-Z_][a-zA-Z0-9_]*(?::[a-zA-Z_][a-zA-Z0-9_]*)?)$")
REGEX_HTML_TAGS = re.compile(r"<[^>]+>")
REGEX_CUSTOM_ANCHOR = re.compile(r"\{#[^}]+\}")
REGEX_STOP_SECTIONS = re.compile(
    r"^#+\s+(Function Prototype|Parameter Description|Usage|Return Value|Example)",
    re.IGNORECASE,
)
