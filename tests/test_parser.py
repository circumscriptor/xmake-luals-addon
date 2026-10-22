"""Tests for parsing xmake documentation into domain objects."""

from pathlib import Path

from xmake_luals.parser import MarkdownParser


def _write_doc(tmp_path: Path, relative_path: str, content: str) -> tuple[Path, Path]:
    repo = tmp_path / "repo"
    path = repo / relative_path
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(content, encoding="utf-8")
    return path, repo


def test_parses_real_instance_module_page(cached_repo: Path):
    page = cached_repo / "docs/api/scripts/extension-modules/core/base/bytes.md"
    doc_file = MarkdownParser().parse_file(str(page), str(cached_repo))

    assert doc_file.file_base == "bytes"
    assert doc_file.doc_link.endswith("/api/scripts/extension-modules/core/base/bytes")
    assert doc_file.is_instance is True
    assert doc_file.class_name == "Bytes"

    functions = {function.api_id: function for function in doc_file.functions}
    constructor = functions["bytes"]
    assert constructor.is_scoped is False
    assert constructor.params[0].clean_name == "size"
    assert constructor.fn_args == ["size", "initval", "str", "buffer", "offset"]
    assert constructor.link.endswith("#bytes")

    size = functions["bytes:size"]
    assert size.is_method is True
    assert size.params == []
    assert size.fn_args == []


def test_parses_real_description_page_and_infers_scopes(cached_repo: Path):
    page = cached_repo / "docs/api/description/project-target.md"
    doc_file = MarkdownParser().parse_file(str(page), str(cached_repo))

    assert doc_file.file_base == "project_target"
    assert doc_file.is_instance is False
    assert doc_file.class_name is None

    functions = {function.api_id: function for function in doc_file.functions}
    assert functions["target"].scope == "target"
    assert functions["target"].is_scoped is True
    assert functions["set_kind"].scope == "target"
    assert functions["set_kind"].fn_args == ["kind"]


def test_removes_dependencies_suffix_from_default_scope(cached_repo: Path):
    page = cached_repo / "docs/api/description/package-dependencies.md"
    doc_file = MarkdownParser().parse_file(str(page), str(cached_repo))

    assert doc_file.file_base == "package_dependencies"
    assert doc_file.functions
    assert all(function.scope == "package" for function in doc_file.functions)


def test_parses_overloaded_prototypes_into_unique_arguments(tmp_path):
    path, repo = _write_doc(
        tmp_path,
        "docs/api/scripts/extension-modules/core/base/demo.md",
        """\
# demo

## demo:copy

Copy data

#### Function Prototype

```lua
demo:copy(source: <string>, start: <number>)
demo:copy(buffer: <bytes>, offset: <number>)
```

#### Parameter Description

| Parameter | Description |
|-----------|-------------|
| source | Source string |
| start | Start position |
| buffer | Source buffer |
| offset | Offset position |
""",
    )

    doc_file = MarkdownParser().parse_file(str(path), str(repo))
    function = doc_file.functions[0]

    assert function.fn_args == ["source", "start", "buffer", "offset"]
    assert [param.clean_name for param in function.params] == function.fn_args
    assert function.is_method is True


def test_marks_optional_parameters(tmp_path):
    path, repo = _write_doc(
        tmp_path,
        "docs/api/description/demo.md",
        """\
## demo

Demo function

#### Function Prototype

```lua
demo(name?: <string>, count: <number|nil>?)
```

#### Parameter Description

| Parameter | Description |
|-----------|-------------|
| name | Optional name |
| count | Optional count |
""",
    )

    function = MarkdownParser().parse_file(str(path), str(repo)).functions[0]

    assert [param.is_optional for param in function.params] == [True, True]
    assert [param.type_name for param in function.params] == [
        "<string>",
        "<number|nil>",
    ]
    assert function.fn_args == ["name", "count"]


def test_parses_table_argument_as_optional_options(tmp_path):
    path, repo = _write_doc(
        tmp_path,
        "docs/api/description/demo.md",
        """\
## demo

Demo function

#### Function Prototype

```lua
demo({ public = true, private = false })
```
""",
    )

    function = MarkdownParser().parse_file(str(path), str(repo)).functions[0]

    assert function.fn_args == ["opt"]
    assert function.params[0].clean_name == "opt"
    assert function.params[0].type_name == "table"
    assert function.params[0].is_optional is True


def test_parses_multiline_config_table_after_vararg(tmp_path):
    path, repo = _write_doc(
        tmp_path,
        "docs/api/description/project-target.md",
        """\
## add_cflags

Add c compilation flags

#### Function Prototype

```lua
add_cflags(cflags: <string|array>, ..., {
    public|interface|private = <boolean>
})
```

#### Parameter Description

| Parameter | Description |
|-----------|-------------|
| cflags | Compilation flags |
| ... | More compilation flags |
| public\\|interface\\|private | Visibility |
""",
    )

    function = MarkdownParser().parse_file(str(path), str(repo)).functions[0]

    assert function.fn_args == ["cflags", "..."]
    assert [param.clean_name for param in function.params] == ["cflags", "...", "opt"]
    assert function.params[-1].is_config is True
    assert "opt" not in function.fn_args


def test_parses_multiline_config_table_without_vararg(tmp_path):
    path, repo = _write_doc(
        tmp_path,
        "docs/api/description/project-target.md",
        """\
## target

Define a project target

#### Function Prototype

```lua
target(name: <string>, {
    kind = <string>,
    files = <string|array>,
    ...
})
```

#### Parameter Description

| Parameter | Description |
|-----------|-------------|
| name | Target name |
| kind | Target kind |
| files | Target files |
""",
    )

    function = MarkdownParser().parse_file(str(path), str(repo)).functions[0]

    assert function.fn_args == ["name", "opt"]
    assert function.params[-1].is_config is True
    assert function.params[-1].is_optional is True


def test_parses_multiline_overloads_independently(tmp_path):
    path, repo = _write_doc(
        tmp_path,
        "docs/api/description/demo.md",
        """\
## demo

Demo function

#### Function Prototype

```lua
demo(source: <string>, {
    public = <boolean>
})
demo(buffer: <bytes>, {
    private = <boolean>
})
```
""",
    )

    function = MarkdownParser().parse_file(str(path), str(repo)).functions[0]

    assert function.fn_args == ["source", "opt", "buffer"]
    assert [param.clean_name for param in function.params] == [
        "source",
        "opt",
        "buffer",
    ]


def test_ignores_prototype_arguments_when_docs_say_no_parameters(tmp_path):
    path, repo = _write_doc(
        tmp_path,
        "docs/api/description/demo.md",
        """\
## set_enabled

Enable the target

#### Function Prototype

```lua
set_enabled(enabled: <boolean>)
```

#### Parameter Description

No parameters required for this function.
""",
    )

    function = MarkdownParser().parse_file(str(path), str(repo)).functions[0]

    assert function.params == []
    assert function.fn_args == []


def test_description_stops_at_usage_section(tmp_path):
    path, repo = _write_doc(
        tmp_path,
        "docs/api/description/demo.md",
        """\
## demo

The short description

#### Usage

This text must not become the description.
""",
    )

    function = MarkdownParser().parse_file(str(path), str(repo)).functions[0]

    assert function.description == "The short description"


def test_resolves_explicit_scope_from_api_id(tmp_path):
    path, repo = _write_doc(
        tmp_path,
        "docs/api/description/custom-rule.md",
        """\
## target:set_kind

Set kind

#### Function Prototype

```lua
target:set_kind(kind: <string>)
```
""",
    )

    function = MarkdownParser().parse_file(str(path), str(repo)).functions[0]

    assert function.scope == "target"
    assert function.is_scoped is True
    assert function.is_method is True


def test_skips_sections_without_valid_identifier(tmp_path):
    path, repo = _write_doc(
        tmp_path,
        "docs/api/description/demo.md",
        """\
## Visibility Settings {#visibility}

Not an API

## valid_name

Valid API
""",
    )

    doc_file = MarkdownParser().parse_file(str(path), str(repo))

    assert [function.api_id for function in doc_file.functions] == ["valid_name"]


def test_skips_documentation_section_titles(tmp_path):
    path, repo = _write_doc(
        tmp_path,
        "docs/api/description/demo.md",
        """\
## Usage

How to use the module.

## Overview

A high-level overview.

## References

Some links.

## valid_name

Valid API
""",
    )

    doc_file = MarkdownParser().parse_file(str(path), str(repo))

    assert [function.api_id for function in doc_file.functions] == ["valid_name"]


def test_parses_dotted_builtin_module_api(tmp_path):
    path, repo = _write_doc(
        tmp_path,
        "docs/api/scripts/builtin-modules/path.md",
        """\
# path

## path.join

- Stitching path

#### Function Prototype

```lua
path.join(paths: <string|array>, ...)
```

#### Parameter Description

| Parameter | Description |
|-----------|-------------|
| paths | Path string or array |
| ... | Variable arguments |
""",
    )

    doc_file = MarkdownParser().parse_file(str(path), str(repo))

    assert doc_file.is_instance is False
    assert doc_file.class_name is None
    assert doc_file.module_name == "path"

    function = doc_file.functions[0]
    assert function.api_id == "path.join"
    assert function.is_static is True
    assert function.is_scoped is True
    assert function.scope == "path"
    assert function.fn_args == ["paths", "..."]


def test_parses_title_level_builtin_function(tmp_path):
    path, repo = _write_doc(
        tmp_path,
        "docs/api/scripts/builtin-modules/import.md",
        """\
# import

- Import extension modules

#### Function Prototype

```lua
import(modulename: <string>, options: <table>)
```

#### Parameter Description

| Parameter | Description |
|-----------|-------------|
| modulename | Module name string |
| options | Import options table (optional) |
""",
    )

    doc_file = MarkdownParser().parse_file(str(path), str(repo))

    assert doc_file.module_name == "import"
    assert [function.api_id for function in doc_file.functions] == ["import"]
    function = doc_file.functions[0]
    assert function.fn_args == ["modulename", "options"]
    assert function.params[1].is_optional is True


def test_dotted_non_module_headings_are_not_functions(tmp_path):
    path, repo = _write_doc(
        tmp_path,
        "docs/api/description/builtin-policies.md",
        """\
## check.auto_ignore_flags

A policy name, not a function.

## valid_name

A real API.
""",
    )

    doc_file = MarkdownParser().parse_file(str(path), str(repo))

    assert [function.api_id for function in doc_file.functions] == ["valid_name"]


def test_real_pages_do_not_produce_usage_or_overview_functions(cached_repo: Path):
    pages = [
        cached_repo / "docs/api/description/builtin-policies.md",
        cached_repo / "docs/api/scripts/extension-modules/core/base/bit.md",
        cached_repo / "docs/api/scripts/extension-modules/core/ui/action.md",
        cached_repo / "docs/api/scripts/extension-modules/package/tools.md",
    ]

    api_ids = []
    for page in pages:
        doc_file = MarkdownParser().parse_file(str(page), str(cached_repo))
        api_ids.extend(function.api_id for function in doc_file.functions)

    assert "Usage" not in api_ids
    assert "Overview" not in api_ids
    assert "References" not in api_ids
