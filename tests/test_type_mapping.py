"""Tests for parameter type normalisation."""

from xmake_luals.models import DocParam
from xmake_luals.type_mapping import (
    TYPE_MAPPINGS,
    map_parameter_types,
    normalise_type_aliases,
)


def _param(name: str, type_name: str, optional: bool = False) -> DocParam:
    return DocParam(name, type_name, is_optional=optional)


def test_maps_well_known_parameter_names():
    params = [_param(name, "string") for name in TYPE_MAPPINGS]

    map_parameter_types(params)

    assert [param.type_name for param in params] == list(TYPE_MAPPINGS.values())


def test_maps_pseudo_generic_annotations():
    params = [
        _param("files", "<string|array>"),
        _param("enabled", "<boolean>"),
        _param("count", "<number>"),
        _param("callback", "<function>"),
        _param("other", "<table>"),
    ]

    map_parameter_types(params)

    assert [param.type_name for param in params] == [
        "string|string[]",
        "boolean",
        "number",
        "fun(target: any, ...: any)",
        "table",
    ]


def test_vararg_inherits_previous_mapped_type():
    params = [
        _param("kind", "string"),
        _param("...", "string|table"),
    ]

    map_parameter_types(params)

    assert params[0].type_name == "TargetKind"
    assert params[1].type_name == "TargetKind|table"


def test_vararg_does_not_inherit_from_plain_string():
    params = [
        _param("name", "string"),
        _param("...", "string|table"),
    ]

    map_parameter_types(params)

    assert params[1].type_name == "string|table"


def test_unknown_types_are_cleaned():
    params = [_param("value", "<foo|bar>?"), _param("empty", "?")]

    map_parameter_types(params)

    assert params[0].type_name == "foo|bar"
    assert params[1].type_name == "any"


def test_normalises_lowercase_instance_type_aliases():
    aliases = {"bytes": "Bytes", "event": "Event", "rect": "Rect"}

    assert normalise_type_aliases("bytes|string", aliases) == "Bytes|string"
    assert normalise_type_aliases("rect[]", aliases) == "Rect[]"
    assert normalise_type_aliases("event", aliases) == "Event"
    assert normalise_type_aliases("string|rect|nil", aliases) == "string|Rect|nil"


def test_does_not_replace_function_parameter_names():
    aliases = {"target": "Target", "package": "Package"}

    assert (
        normalise_type_aliases("fun(target: any, ...: any)", aliases)
        == "fun(target: any, ...: any)"
    )
    assert normalise_type_aliases("table<string, any>", aliases) == (
        "table<string, any>"
    )


def test_handles_empty_parameter_list():
    params: list[DocParam] = []

    map_parameter_types(params)

    assert params == []
