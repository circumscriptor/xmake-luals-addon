"""Tests for instance method return type heuristics."""

import pytest

from xmake_luals.return_inference import infer_instance_return


@pytest.mark.parametrize(
    ("api_id", "expected"),
    [
        ("target:set_kind", "nil"),
        ("target:add_files", "nil"),
        ("target:remove_files", "nil"),
        ("target:del_files", "string[]"),
        ("target:is_enabled", "boolean"),
        ("target:has_files", "boolean"),
        ("target:check_sizeof", "number|nil"),
        ("target:check_deps", "boolean"),
        ("target:name", "string"),
        ("target:kind", "string"),
        ("target:sourcefile", "string"),
        ("target:targetdir", "string"),
        ("target:get_files", "string[]"),
        ("target:get_dirs", "string[]"),
        ("target:sourcebatches", "table"),
        ("target:get", "any"),
        ("target:values", "any"),
        ("target:unknown", "any"),
        ("path.files", "string[]"),
        ("path.basename", "string"),
        ("os.is_host", "boolean"),
        ("os.setenv", "any"),
    ],
)
def test_infers_return_type(api_id: str, expected: str):
    assert infer_instance_return(api_id) == expected
