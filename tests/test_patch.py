"""Tests for documentation patching and overrides."""

import json
from pathlib import Path

import pytest

from xmake_luals.models import DocFile, DocFunction, DocParam
from xmake_luals.patch import DocPatcher


def _function(api_id: str = "target:set_kind", **kwargs) -> DocFunction:
    defaults = {
        "api_id": api_id,
        "description": "Description",
        "link": "https://xmake.io/api#target",
        "params": [],
        "fn_args": [],
    }
    defaults.update(kwargs)
    return DocFunction(**defaults)


def _write_overrides(tmp_path: Path, data: object) -> Path:
    path = tmp_path / "overrides.json"
    path.write_text(json.dumps(data), encoding="utf-8")
    return path


def test_patches_parameter_types_and_return_type(tmp_path):
    function = _function(
        "target:set_kind",
        params=[DocParam("kind", "string", "Target kind")],
        fn_args=["kind"],
    )
    doc_file = DocFile("target", "https://xmake.io", True, "Target", [function])

    DocPatcher(str(tmp_path / "missing.json")).patch_file(doc_file)

    assert function.params[0].type_name == "TargetKind"
    assert function.return_type == "nil"
    assert function.fn_args == ["kind"]


def test_non_instance_functions_always_return_nil(tmp_path):
    function = _function("is_enabled")

    DocPatcher(str(tmp_path / "missing.json")).patch_function(function, False)

    assert function.return_type == "nil"


def test_cleans_optional_markers_from_function_arguments(tmp_path):
    function = _function(fn_args=["kind?", "...?"])

    DocPatcher(str(tmp_path / "missing.json")).patch_function(function, False)

    assert function.fn_args == ["kind", "..."]


def test_applies_manual_param_and_return_overrides(tmp_path):
    overrides = _write_overrides(
        tmp_path,
        {
            "add_cflags": {
                "return_type": "nil",
                "params": [
                    {
                        "name": "...",
                        "type": "string|CompilationFlagAttr",
                        "desc": "Compilation flags",
                    }
                ],
            }
        },
    )
    function = _function(
        "add_cflags",
        params=[DocParam("flags", "string")],
        fn_args=["flags"],
    )

    DocPatcher(str(overrides)).patch_function(function, True)

    assert function.return_type == "nil"
    assert function.fn_args == ["..."]
    assert function.params == [
        DocParam("...", "string|CompilationFlagAttr", "Compilation flags")
    ]


def test_override_optional_parameter(tmp_path):
    overrides = _write_overrides(
        tmp_path,
        {
            "set_kind": {
                "params": [
                    {"name": "kind?", "type": "TargetKind", "desc": "Target kind"},
                    {
                        "name": "level",
                        "type": "number",
                        "desc": "Level",
                        "optional": True,
                    },
                ]
            }
        },
    )
    function = _function("set_kind")

    DocPatcher(str(overrides)).patch_function(function, False)

    assert [param.clean_name for param in function.params] == ["kind", "level"]
    assert [param.is_optional for param in function.params] == [True, True]
    assert function.fn_args == ["kind", "level"]


def test_ignores_unknown_override_entries(tmp_path):
    overrides = _write_overrides(tmp_path, {"other_api": {"return_type": "string"}})
    function = _function("set_kind")

    DocPatcher(str(overrides)).patch_function(function, False)

    assert function.return_type == "nil"


def test_rejects_non_object_overrides_file(tmp_path):
    overrides = _write_overrides(tmp_path, ["not", "an", "object"])

    with pytest.raises(TypeError):
        DocPatcher(str(overrides))


def test_rejects_invalid_override_params(tmp_path):
    overrides = _write_overrides(tmp_path, {"set_kind": {"params": "kind"}})
    patcher = DocPatcher(str(overrides))

    with pytest.raises(TypeError):
        patcher.patch_function(_function("set_kind"), False)


def test_rejects_override_parameter_without_name_or_type(tmp_path):
    overrides = _write_overrides(tmp_path, {"set_kind": {"params": [{"name": "kind"}]}})
    patcher = DocPatcher(str(overrides))

    with pytest.raises(ValueError):
        patcher.patch_function(_function("set_kind"), False)


def test_missing_overrides_file_is_allowed(tmp_path):
    patcher = DocPatcher(str(tmp_path / "does-not-exist.json"))

    assert patcher.overrides == {}
