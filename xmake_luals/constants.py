"""Configuration defaults for the xmake LuaLS generator."""

# Repository & URL settings
DEFAULT_REPO_URL = "https://github.com/xmake-io/xmake-docs.git"
DEFAULT_ZIP_URL = "https://github.com/xmake-io/xmake-docs/archive/refs/heads/master.zip"
DOCS_SITE_BASE_URL = "https://xmake.io"

# Filesystem defaults
DEFAULT_REPO_DIR = ".cache/xmake-docs"
DEFAULT_OUTPUT_DIR = "library"
DEFAULT_SCHEMA_FILE = "schema.json"
DEFAULT_OVERRIDES_FILE = "overrides.json"
DOCS_COMMIT_FILE = "docs-commit.txt"

# Whitelist patterns: only parse API descriptions and scripts.
DEFAULT_INCLUDE = [
    "docs/api/description/*.md",
    "docs/api/scripts/*.md",
    "api/description/*.md",
    "api/scripts/*.md",
]

# Blacklist patterns: exclude guides, indexes, manuals and tutorials.
DEFAULT_EXCLUDE = [
    "**/guide/**",
    "**/manual/**",
    "**/examples/**",
    "**/index.md",
    "**/README.md",
    "**/getting-started.md",
    "**/faq.md",
]
