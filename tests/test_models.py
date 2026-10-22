"""Tests for the shared domain models."""

from xmake_luals.models import DocFunction, DocParam


def test_param_clean_name_and_vararg_detection():
    optional = DocParam("value?", "string")
    vararg = DocParam("...", "string")

    assert optional.clean_name == "value"
    assert optional.is_vararg is False
    assert vararg.clean_name == "..."
    assert vararg.is_vararg is True


def test_method_function_helpers():
    function = DocFunction("target:set_kind", "Set kind", "link")

    assert function.is_method is True
    assert function.is_static is False
    assert function.method_name == "set_kind"
    assert function.short_name == "set_kind"


def test_static_function_helpers():
    function = DocFunction("target.add_files", "Add files", "link")

    assert function.is_method is False
    assert function.is_static is True
    assert function.static_name == "add_files"
    assert function.short_name == "target.add_files"


def test_plain_function_helpers():
    function = DocFunction("target", "Define target", "link")

    assert function.is_method is False
    assert function.is_static is False
    assert function.short_name == "target"
