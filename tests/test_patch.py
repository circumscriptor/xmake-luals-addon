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


def test_builtin_module_functions_use_return_inference(tmp_path):
    function = _function("path.files")

    DocPatcher(str(tmp_path / "missing.json")).patch_function(
        function, False, is_module=True
    )

    assert function.return_type == "string[]"


def test_check_snippets_overrides_add_optional_options():
    overrides = Path(__file__).resolve().parents[1] / "overrides.json"
    function = _function(
        "target:check_csnippets",
        params=[DocParam("snippets", "string|table", "Code snippet")],
        fn_args=["snippets"],
    )

    DocPatcher(str(overrides)).patch_function(function, True)

    assert function.fn_args == ["snippets", "opt"]
    assert function.params == [
        DocParam("snippets", "string|table", "Code snippet or code snippet list"),
        DocParam(
            "opt",
            "SnippetOption",
            "Optional options table",
            is_optional=True,
        ),
    ]


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


def test_config_type_merges_into_variadic_parameter(tmp_path):
    overrides = _write_overrides(
        tmp_path,
        {"target.add_cflags": {"config_type": "CompilationFlagAttr"}},
    )
    function = _function(
        "add_cflags",
        params=[
            DocParam("cflags", "string|string[]"),
            DocParam("...", "any", "More flags"),
            DocParam("opt", "table", is_optional=True, is_config=True),
        ],
        fn_args=["cflags", "..."],
    )

    DocPatcher(str(overrides)).patch_function(function, False, scope="target")

    assert function.fn_args == ["cflags", "..."]
    assert [param.clean_name for param in function.params] == ["cflags", "..."]
    assert function.params[1].type_name == "string|CompilationFlagAttr"


def test_callback_extends_config_type_with_function(tmp_path):
    overrides = _write_overrides(
        tmp_path,
        {
            "target.target": {
                "config_type": "TargetAttr",
                "callback": True,
            }
        },
    )
    function = _function(
        "target",
        params=[
            DocParam("name", "string"),
            DocParam("opt", "table", is_optional=True, is_config=True),
        ],
        fn_args=["name", "opt"],
    )

    DocPatcher(str(overrides)).patch_function(function, False, scope="target")

    assert function.fn_args == ["name", "opt"]
    assert function.params[1].type_name == "TargetAttr|fun()"
    assert function.params[1].is_optional


def test_callback_adds_optional_configuration_parameter(tmp_path):
    overrides = _write_overrides(
        tmp_path,
        {"option.option": {"callback": True}},
    )
    function = _function(
        "option",
        params=[DocParam("name", "string")],
        fn_args=["name"],
    )

    DocPatcher(str(overrides)).patch_function(function, False, scope="option")

    assert function.fn_args == ["name", "opt"]
    assert function.params[-1] == DocParam(
        "opt",
        "fun()",
        "Configuration options",
        is_optional=True,
        is_config=True,
    )


def test_config_type_uses_schema_type_for_table_parameter(tmp_path):
    overrides = _write_overrides(
        tmp_path,
        {"global-interfaces.set_version": {"config_type": "VersionOption"}},
    )
    function = _function(
        "set_version",
        params=[
            DocParam("version", "string"),
            DocParam("opt", "table", is_optional=True, is_config=True),
        ],
        fn_args=["version", "opt"],
    )

    DocPatcher(str(overrides)).patch_function(
        function, False, scope="global-interfaces"
    )

    assert function.fn_args == ["version", "opt"]
    assert function.params[1].type_name == "VersionOption"


def test_config_type_adds_missing_configuration_parameter(tmp_path):
    overrides = _write_overrides(
        tmp_path,
        {"demo": {"config_type": "TargetAttr"}},
    )
    function = _function("demo")

    DocPatcher(str(overrides)).patch_function(function, False)

    assert function.fn_args == ["opt"]
    assert function.params == [
        DocParam(
            "opt",
            "TargetAttr",
            "Configuration options",
            is_optional=True,
            is_config=True,
        )
    ]


def test_scoped_override_uses_the_matching_scope(tmp_path):
    overrides = _write_overrides(
        tmp_path,
        {
            "target.add_deps": {"config_type": "DependencyAttr"},
            "rule.add_deps": {"config_type": "RuleDependencyOption"},
        },
    )
    target_function = _function(
        "add_deps",
        params=[
            DocParam("deps", "string|string[]"),
            DocParam("...", "any"),
            DocParam("opt", "table", is_config=True),
        ],
        fn_args=["deps", "..."],
    )
    rule_function = _function(
        "add_deps",
        params=[
            DocParam("deps", "string|string[]"),
            DocParam("...", "any"),
            DocParam("opt", "table", is_config=True),
        ],
        fn_args=["deps", "..."],
    )
    patcher = DocPatcher(str(overrides))

    patcher.patch_function(target_function, False, scope="target")
    patcher.patch_function(rule_function, False, scope="rule")

    assert target_function.params[1].type_name == "string|DependencyAttr"
    assert rule_function.params[1].type_name == "string|RuleDependencyOption"


def test_patcher_normalises_documentation_type_aliases(tmp_path):
    function = _function(
        "recv",
        params=[DocParam("buff", "bytes"), DocParam("event", "event|nil")],
    )

    DocPatcher(
        str(tmp_path / "missing.json"),
        type_aliases={"bytes": "Bytes", "event": "Event"},
    ).patch_function(function, False)

    assert [param.type_name for param in function.params] == [
        "Bytes",
        "Event|nil",
    ]


def test_rejects_unknown_config_type(tmp_path):
    overrides = _write_overrides(
        tmp_path,
        {"demo": {"config_type": "MissingType"}},
    )
    patcher = DocPatcher(str(overrides), known_types={"TargetAttr"})

    with pytest.raises(ValueError, match="Unknown config_type"):
        patcher.patch_function(_function("demo"), False)


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
