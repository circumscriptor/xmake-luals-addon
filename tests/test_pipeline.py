"""End-to-end tests for the generation pipeline."""

from pathlib import Path

from xmake_luals.models import DocFile
from xmake_luals.pipeline import GenerationOptions, GenerationPipeline


def _options(
    repo_dir: Path,
    output_dir: Path,
    schema_file: Path,
    overrides_file: Path,
) -> GenerationOptions:
    return GenerationOptions(
        repo_dir=str(repo_dir),
        output_dir=str(output_dir),
        schema_file=str(schema_file),
        overrides_file=str(overrides_file),
        skip_xmake=True,
    )


def test_pipeline_generates_definitions_from_docs(
    docs_repo: Path,
    schema_file: Path,
    overrides_file: Path,
    tmp_path: Path,
):
    output_dir = tmp_path / "library"

    stats = GenerationPipeline(
        _options(docs_repo, output_dir, schema_file, overrides_file)
    ).run()

    assert (output_dir / "common.lua").is_file()
    assert (output_dir / "project_target.lua").is_file()
    assert (output_dir / "bytes.lua").is_file()
    assert not (output_dir / "getting_started.lua").exists()
    assert stats.modules == 2
    assert stats.functions == 3
    assert stats.common_lua_path == str(output_dir / "common.lua")

    target = (output_dir / "project_target.lua").read_text(encoding="utf-8")
    assert "function target(name) end" in target
    assert "---**Scoped: target**" in target

    bytes_page = (output_dir / "bytes.lua").read_text(encoding="utf-8")
    assert "---@class Bytes\nlocal Bytes = {}" in bytes_page
    assert "function bytes(size, initval, str) end" in bytes_page
    assert "function Bytes:size() end" in bytes_page


def test_type_alias_builder_does_not_shadow_lua_builtins():
    documents = [
        (
            "string.md",
            DocFile(
                file_base="string",
                doc_link="https://xmake.io/api/scripts/string",
                is_instance=True,
                class_name="String",
                functions=[],
            ),
        ),
        (
            "bytes.md",
            DocFile(
                file_base="bytes",
                doc_link="https://xmake.io/api/scripts/bytes",
                is_instance=True,
                class_name="Bytes",
                functions=[],
            ),
        ),
    ]

    aliases = GenerationPipeline._build_type_aliases(documents, {"String", "Rect"})

    assert aliases["bytes"] == "Bytes"
    assert aliases["rect"] == "Rect"
    assert "string" not in aliases


def test_pipeline_removes_stale_output_for_pages_without_apis(
    docs_repo: Path,
    schema_file: Path,
    overrides_file: Path,
    tmp_path: Path,
):
    output_dir = tmp_path / "library"
    output_dir.mkdir()
    stale_file = output_dir / "usage_only.lua"
    stale_file.write_text("function Usage() end\n", encoding="utf-8")

    GenerationPipeline(
        _options(docs_repo, output_dir, schema_file, overrides_file)
    ).run()

    assert not stale_file.exists()


def test_pipeline_skip_xmake_does_not_invoke_cli(
    docs_repo: Path,
    schema_file: Path,
    overrides_file: Path,
    tmp_path: Path,
    monkeypatch,
):
    def fail_run(*args, **kwargs):
        raise AssertionError("xmake CLI must not be queried when --skip-xmake is set")

    monkeypatch.setattr("xmake_luals.xmake.subprocess.run", fail_run)

    stats = GenerationPipeline(
        _options(docs_repo, tmp_path / "library", schema_file, overrides_file)
    ).run()

    assert stats.modules == 2


def test_cached_docs_match_committed_library(
    cached_repo: Path,
    tmp_path: Path,
):
    project_root = Path(__file__).resolve().parents[1]
    output_dir = tmp_path / "library"

    stats = GenerationPipeline(
        GenerationOptions(
            repo_dir=str(cached_repo),
            output_dir=str(output_dir),
            schema_file=str(project_root / "schema.json"),
            overrides_file=str(project_root / "overrides.json"),
            skip_xmake=True,
        )
    ).run()

    generated = {
        path.name: path
        for path in output_dir.glob("*.lua")
        if path.name != "common.lua"
    }
    committed = {
        path.name: path
        for path in (project_root / "library").glob("*.lua")
        if path.name != "common.lua"
    }

    assert generated.keys() == committed.keys()
    for name, generated_path in generated.items():
        committed_path = committed[name]
        assert generated_path.read_text(encoding="utf-8") == committed_path.read_text(
            encoding="utf-8"
        ), f"Generated output changed for {name}"

    assert stats.modules == len(committed)
    assert stats.functions > 0

    project_target = generated["project_target.lua"].read_text(encoding="utf-8")
    assert "---@param opt? TargetAttr|fun() Configuration options" in project_target
    assert "function target(name, opt) end" in project_target
    assert "---@param cflags string|string[]" in project_target
    assert "---@param ... string|CompilationFlagAttr" in project_target
    assert "function add_cflags(cflags, ...) end" in project_target
    assert "---@param ... string|DependencyAttr" in project_target

    custom_rule = generated["custom_rule.lua"].read_text(encoding="utf-8")
    assert "---@param opt? RuleAttr|fun() Configuration options" in custom_rule
    assert "function rule(name, opt) end" in custom_rule
    assert "---@param ... string|RuleDependencyOption" in custom_rule
    assert "function add_deps(deps, ...) end" in custom_rule

    configuration_option = generated["configuration_option.lua"].read_text(
        encoding="utf-8"
    )
    assert "---@param opt? OptionAttr|fun() Configuration options" in (
        configuration_option
    )
    assert "function option(name, opt) end" in configuration_option

    package_dependencies = generated["package_dependencies.lua"].read_text(
        encoding="utf-8"
    )
    assert "---@param opt? PackageAttr|fun() Configuration options" in (
        package_dependencies
    )
    assert "function package(name, opt) end" in package_dependencies

    custom_toolchain = generated["custom_toolchain.lua"].read_text(encoding="utf-8")
    assert "---@param opt? ToolchainAttr|fun() Configuration options" in (
        custom_toolchain
    )
    assert "function toolchain(name, opt) end" in custom_toolchain

    plugin_and_task = generated["plugin_and_task.lua"].read_text(encoding="utf-8")
    assert "---@param opt? TaskAttr|fun() Configuration options" in plugin_and_task
    assert "function task(name, opt) end" in plugin_and_task

    global_interfaces = generated["global_interfaces.lua"].read_text(encoding="utf-8")
    assert "---@param script? fun() Namespace script function" in global_interfaces
    assert "function namespace(name, script) end" in global_interfaces

    bytes_module = generated["bytes.lua"].read_text(encoding="utf-8")
    assert "---@param buffer Bytes" in bytes_module
    assert "---@param buffer bytes" not in bytes_module

    dialog = generated["dialog.lua"].read_text(encoding="utf-8")
    assert "---@param bounds Rect" in dialog
    assert "---@param e Event" in dialog

    application = generated["application.lua"].read_text(encoding="utf-8")
    assert "---@param view View" in application

    tools = generated["tools.lua"].read_text(encoding="utf-8")
    assert "---@param package Package" in tools

    common = (output_dir / "common.lua").read_text(encoding="utf-8")
    assert "---@class Rect" in common
    assert "---@class TargetAttr" in common
    assert "---@field defines string|string[]" in common
    assert "---@field deps string|string[]" in common
    assert "---@field links string|string[]" in common
    assert "---@class OptionAttr" in common
    assert "---@class PackageAttr" in common
    assert "---@class RuleAttr" in common
    assert "---@class ToolchainAttr" in common
    assert "---@class TaskAttr" in common
