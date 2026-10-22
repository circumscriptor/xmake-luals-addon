"""Tests for rendering domain objects as LuaLS annotations."""

from pathlib import Path

from xmake_luals.generator import LuaLSGenerator
from xmake_luals.models import DocFile, DocFunction, DocParam


def _function(api_id: str = "target", **kwargs) -> DocFunction:
    defaults = {
        "api_id": api_id,
        "description": "",
        "link": f"https://xmake.io/demo#{api_id}",
    }
    defaults.update(kwargs)
    return DocFunction(**defaults)


def _file(
    functions: list[DocFunction],
    *,
    is_instance: bool = False,
    class_name: str | None = None,
) -> DocFile:
    return DocFile(
        file_base="demo",
        doc_link="https://xmake.io/api/description/demo",
        is_instance=is_instance,
        class_name=class_name,
        functions=functions,
    )


def test_renders_scoped_function_exactly(tmp_path: Path):
    doc_file = _file(
        [
            _function(
                "target",
                description="Define a project target",
                link="https://xmake.io/api#target",
                params=[DocParam("name", "string", "Target name")],
                fn_args=["name"],
                is_scoped=True,
                scope="target",
            )
        ]
    )

    rendered = LuaLSGenerator(tmp_path).render(doc_file)

    assert rendered == (
        "---@meta\n"
        "---[demo](https://xmake.io/api/description/demo)\n"
        "\n"
        "---\n"
        "---**Scoped: target**\n"
        "---\n"
        "---Define a project target\n"
        "---\n"
        "---[Open in browser](https://xmake.io/api#target)\n"
        "---\n"
        "---@param name string Target name\n"
        "---@return nil\n"
        "function target(name) end\n"
    )


def test_renders_instance_class_and_method(tmp_path: Path):
    doc_file = _file(
        [_function("bytes:size", description="Get buffer size", return_type="any")],
        is_instance=True,
        class_name="Bytes",
    )

    rendered = LuaLSGenerator(tmp_path).render(doc_file)

    assert "---@class Bytes\nlocal Bytes = {}" in rendered
    assert "function Bytes:size() end" in rendered
    assert "---@return any" in rendered


def test_optional_parameter_is_marked_only_in_annotation(tmp_path: Path):
    doc_file = _file(
        [
            _function(
                "demo",
                params=[DocParam("count", "number", "Count", is_optional=True)],
                fn_args=["count"],
            )
        ]
    )

    rendered = LuaLSGenerator(tmp_path).render(doc_file)

    assert "---@param count? number Count" in rendered
    assert "function demo(count) end" in rendered


def test_vararg_is_moved_last_and_not_marked_optional(tmp_path: Path):
    doc_file = _file(
        [
            _function(
                "demo",
                params=[
                    DocParam("...", "string", "Extra values", is_optional=True),
                    DocParam("name", "string", "Name"),
                ],
                fn_args=["...", "name"],
            )
        ]
    )

    rendered = LuaLSGenerator(tmp_path).render(doc_file)

    assert "---@param ... string Extra values" in rendered
    assert "function demo(name, ...) end" in rendered


def test_skips_parameters_that_are_not_in_the_signature(tmp_path: Path):
    doc_file = _file(
        [
            _function(
                "demo",
                params=[
                    DocParam("used", "string", "Used"),
                    DocParam("unused", "string", "Unused"),
                ],
                fn_args=["used"],
            )
        ]
    )

    rendered = LuaLSGenerator(tmp_path).render(doc_file)

    assert "---@param used string Used" in rendered
    assert "unused" not in rendered


def test_deduplicates_arguments(tmp_path: Path):
    doc_file = _file([_function("demo", fn_args=["name", "name?", "count"])])

    rendered = LuaLSGenerator(tmp_path).render(doc_file)

    assert "function demo(name, count) end" in rendered


def test_method_constructor_returns_class(tmp_path: Path):
    doc_file = _file(
        [_function("bytes:new", return_type="nil")],
        is_instance=True,
        class_name="Bytes",
    )

    rendered = LuaLSGenerator(tmp_path).render(doc_file)

    assert "function Bytes:new() end" in rendered
    assert "---@return Bytes" in rendered


def test_static_constructor_returns_class(tmp_path: Path):
    doc_file = _file(
        [_function("bytes.new", return_type="any")],
        is_instance=True,
        class_name="Bytes",
    )

    rendered = LuaLSGenerator(tmp_path).render(doc_file)

    assert "function Bytes.new() end" in rendered
    assert "---@return Bytes" in rendered


def test_free_standing_constructor_returns_class(tmp_path: Path):
    doc_file = _file(
        [_function("bytes", return_type="any")],
        is_instance=True,
        class_name="Bytes",
    )

    rendered = LuaLSGenerator(tmp_path).render(doc_file)

    assert "function bytes() end" in rendered
    assert "---@return Bytes" in rendered


def test_non_constructor_keeps_return_type(tmp_path: Path):
    doc_file = _file(
        [_function("hash", return_type="any")],
        is_instance=True,
        class_name="Bytes",
    )

    rendered = LuaLSGenerator(tmp_path).render(doc_file)

    assert "function hash() end" in rendered
    assert "---@return any" in rendered


def test_generate_writes_file_and_creates_output_directory(tmp_path: Path):
    output_dir = tmp_path / "nested" / "library"
    doc_file = _file([_function("demo")])

    output_path = LuaLSGenerator(output_dir).generate(doc_file)

    assert output_path == str(output_dir / "demo.lua")
    assert Path(output_path).read_text(encoding="utf-8").startswith("---@meta\n")
