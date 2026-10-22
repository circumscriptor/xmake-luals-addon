# Hacking

This document explains how to set up, regenerate, test, and validate the
project locally.

## Prerequisites

- Python 3.10 or newer.
- `git` for fetching and updating the xmake documentation checkout.
- `xmake` is optional. When available, the generator queries it for platform,
  architecture, build mode, toolchain, and policy values. Without it, the
  static schema is used.
- `lua-language-server` is optional and only needed for manual annotation
  validation.

## Setup

Create a virtual environment and install the project in editable mode:

```bash
python3 -m venv .venv
source .venv/bin/activate
python3 -m pip install -e ".[test]"
```

`ruff` is used for linting but is not a runtime dependency. Install it
separately if it is not already available:

```bash
python3 -m pip install ruff
```

## Build

There is no compiler step. The generated output is the LuaLS annotation
library under `library/`.

Run the generator from the repository root:

```bash
python3 main.py
```

Useful variants:

```bash
# Skip the optional xmake CLI inspection.
python3 main.py --skip-xmake

# Show all available path and generation options.
python3 main.py --help
```

The generator uses `.cache/xmake-docs` for the xmake documentation checkout
and fetches it when missing. After generation it writes the source revision to
`library/docs-commit.txt`. Keep that file and the generated Lua files in sync
with the docs revision.

Do not edit generated files in `library/` by hand. Change `schema.json`,
`overrides.json`, or the Python generator, then regenerate. The cached-docs
integration test compares the generated output with the committed library and
will fail when they differ.

## Test

Run the full test suite:

```bash
python3 -m pytest -q
```

Run a focused subset while iterating:

```bash
python3 -m pytest -q tests/test_parser.py
python3 -m pytest -q tests/test_pipeline.py
```

The integration test `test_cached_docs_match_committed_library` requires the
documentation cache. Run `python3 main.py` once if the test is skipped because
`.cache/xmake-docs` is unavailable.

## Lint

```bash
ruff check .
git diff --check
```

## Optional LuaLS validation

To check generated annotations against a real project, create a LuaLS config
that points at this repository's `library/` directory:

```bash
cat > /tmp/xmake-luals.luarc.json <<EOF
{
    "workspace.library": ["$PWD/library"],
    "runtime.version": "LuaJIT",
    "workspace.checkThirdParty": false
}
EOF
```

Then run the checker against an xmake project:

```bash
lua-language-server \
    --check=/path/to/xmake-project \
    --configpath=/tmp/xmake-luals.luarc.json \
    --checklevel=Warning \
    --check_format=pretty \
    --logpath=/tmp/xmake-luals-log
```

`--check` exits when it finishes and does not leave a language server running.

## Development workflow

1. Change the parser, patcher, generator, schema, or overrides as needed.
2. Regenerate the library with `python3 main.py`.
3. Run `python3 -m pytest -q`.
4. Run `ruff check .` and `git diff --check`.
5. Commit the source changes, the regenerated `library/` files, and the updated
   `library/docs-commit.txt`.

## Project layout

- `main.py`: executable entry point.
- `xmake_luals/`: generator implementation.
- `schema.json`: shared type aliases and configuration classes.
- `overrides.json`: manual annotation corrections.
- `library/`: generated LuaLS definitions and the source docs commit hash.
- `tests/`: unit, integration, CLI, schema, and generation tests.
- `.cache/xmake-docs`: local xmake documentation checkout.
