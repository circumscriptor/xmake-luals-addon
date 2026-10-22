"""Shared fixtures and paths for the test suite."""

from pathlib import Path
from textwrap import dedent

import pytest

PROJECT_ROOT = Path(__file__).resolve().parents[1]
CACHE_REPO = PROJECT_ROOT / ".cache" / "xmake-docs"
CACHE_DOCS = CACHE_REPO / "docs"


@pytest.fixture(scope="session")
def cached_repo() -> Path:
    """Return the real xmake-docs checkout, skipping if it is unavailable."""
    if not CACHE_DOCS.is_dir():
        pytest.skip("The xmake-docs cache is not available (.cache/xmake-docs).")
    return CACHE_REPO


@pytest.fixture
def docs_repo(tmp_path: Path) -> Path:
    """Create a small documentation repository for end-to-end tests."""
    repo = tmp_path / "xmake-docs"

    project_target = dedent(
        """\
        # project target

        ## target

        Define a project target

        #### Function Prototype

        ::: tip API
        ```lua
        target(name: <string>)
        ```
        :::

        #### Parameter Description

        | Parameter | Description |
        |-----------|-------------|
        | name | Required. Target name |

        #### Usage

        ```lua
        target("demo")
        ```
        """
    )
    bytes_page = dedent(
        """\
        # bytes

        ## bytes

        - Create a byte buffer

        #### Function Prototype

        ::: tip API
        ```lua
        bytes(size: <number>, initval: <number|string>)
        bytes(str: <string>)
        ```
        :::

        #### Parameter Description

        | Parameter | Description |
        |-----------|-------------|
        | size | Required. Buffer size |
        | initval | Optional. Initial value |
        | str | Required. String value |

        #### Usage

        ```lua
        local buffer = bytes(16)
        ```

        ## bytes:size

        - Get buffer size

        #### Parameter Description

        No parameters required for this function.
        """
    )
    guide_page = "# guide\n\nThis page must not be parsed.\n"

    for relative_path, content in (
        ("docs/api/description/project-target.md", project_target),
        ("docs/api/scripts/extension-modules/core/base/bytes.md", bytes_page),
        ("docs/guide/getting-started.md", guide_page),
        ("docs/README.md", "# readme\n"),
    ):
        target = repo / relative_path
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(content, encoding="utf-8")

    return repo


@pytest.fixture
def schema_file(tmp_path: Path) -> Path:
    """Create a minimal schema file used by pipeline tests."""
    path = tmp_path / "schema.json"
    path.write_text(
        dedent(
            """\
            {
                "aliases": {
                    "Platform": ["linux", "windows"]
                },
                "classes": {
                    "Target": {
                        "fields": {
                            "name": "string"
                        }
                    }
                }
            }
            """
        ),
        encoding="utf-8",
    )
    return path


@pytest.fixture
def overrides_file(tmp_path: Path) -> Path:
    """Create an empty overrides file used by pipeline tests."""
    path = tmp_path / "overrides.json"
    path.write_text("{}", encoding="utf-8")
    return path
