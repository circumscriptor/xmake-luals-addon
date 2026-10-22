"""Tests for schema enrichment and common.lua generation."""

import json
from pathlib import Path

import pytest

from xmake_luals.schema import SchemaManager


class FakeInspector:
    def __init__(self, available: bool = True, **values: list[str]):
        self._available = available
        self._values = values

    @property
    def is_available(self) -> bool:
        return self._available

    def _get(self, name: str) -> list[str]:
        return self._values.get(name, [])

    def get_platforms(self) -> list[str]:
        return self._get("platforms")

    def get_architectures(self) -> list[str]:
        return self._get("architectures")

    def get_buildmodes(self) -> list[str]:
        return self._get("buildmodes")

    def get_toolchains(self) -> list[str]:
        return self._get("toolchains")

    def get_policies(self) -> list[str]:
        return self._get("policies")


def _write_schema(tmp_path: Path, data: object) -> Path:
    path = tmp_path / "schema.json"
    path.write_text(json.dumps(data), encoding="utf-8")
    return path


def test_renders_aliases_and_classes(tmp_path: Path):
    schema = {
        "aliases": {"Platform": ["linux", "windows"], "Empty": []},
        "classes": {"Target": {"fields": {"name": "string", "kind": "TargetKind"}}},
    }
    manager = SchemaManager(
        str(_write_schema(tmp_path, schema)), FakeInspector(available=False)
    )

    rendered = manager.render_common_lua()

    assert rendered == (
        "---@meta\n"
        "---Automatically generated xmake type definitions schema\n"
        "\n"
        '---Supported Platform\n---@alias Platform string|"linux"|"windows"\n'
        "\n"
        "---Supported Empty\n---@alias Empty string\n"
        "\n"
        "---@class Target\n"
        "---@field name string\n"
        "---@field kind TargetKind\n"
    )


def test_enriches_aliases_from_cli(tmp_path: Path):
    schema = {"aliases": {"Platform": ["linux"]}, "classes": {}}
    manager = SchemaManager(
        str(_write_schema(tmp_path, schema)),
        FakeInspector(platforms=["windows", "linux", "android"]),
    )

    manager.enrich_from_cli()

    assert manager.data["aliases"]["Platform"] == ["android", "linux", "windows"]


def test_adds_new_aliases_and_ignores_empty_cli_results(tmp_path: Path):
    schema = {"aliases": {}, "classes": {}}
    manager = SchemaManager(
        str(_write_schema(tmp_path, schema)),
        FakeInspector(buildmodes=["debug", "release"], platforms=[]),
    )

    manager.enrich_from_cli()

    assert manager.data["aliases"] == {"CompilationMode": ["debug", "release"]}


def test_does_not_enrich_when_cli_is_unavailable(tmp_path: Path):
    schema = {"aliases": {"Platform": ["linux"]}, "classes": {}}
    manager = SchemaManager(
        str(_write_schema(tmp_path, schema)),
        FakeInspector(available=False, platforms=["windows"]),
    )

    manager.enrich_from_cli()

    assert manager.data["aliases"]["Platform"] == ["linux"]


def test_missing_schema_uses_empty_defaults(tmp_path: Path):
    manager = SchemaManager(
        str(tmp_path / "missing.json"), FakeInspector(available=False)
    )

    assert manager.data == {"aliases": {}, "classes": {}}
    assert manager.render_common_lua().startswith("---@meta\n")


def test_rejects_non_object_schema(tmp_path: Path):
    path = _write_schema(tmp_path, ["not", "an", "object"])

    with pytest.raises(TypeError):
        SchemaManager(str(path), FakeInspector(available=False))


def test_generate_common_lua_creates_parent_directories(tmp_path: Path):
    schema = {"aliases": {}, "classes": {}}
    manager = SchemaManager(
        str(_write_schema(tmp_path, schema)), FakeInspector(available=False)
    )
    output = tmp_path / "nested" / "library" / "common.lua"

    result = manager.generate_common_lua(str(output))

    assert result == str(output)
    assert output.read_text(encoding="utf-8") == manager.render_common_lua()


def test_generate_common_lua_accepts_bare_filename(tmp_path: Path, monkeypatch):
    schema = {"aliases": {}, "classes": {}}
    manager = SchemaManager(
        str(_write_schema(tmp_path, schema)), FakeInspector(available=False)
    )
    monkeypatch.chdir(tmp_path)

    manager.generate_common_lua("common.lua")

    assert (tmp_path / "common.lua").is_file()
