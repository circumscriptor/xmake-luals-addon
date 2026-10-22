"""Heuristics for inferring the return type of documented instance methods."""

_PREFIX_RETURNS: tuple[tuple[tuple[str, ...], str], ...] = (
    (("set_", "add_", "remove_"), "nil"),
    (("is_", "has_"), "boolean"),
)

_EXACT_RETURNS: dict[str, str] = {
    "set": "nil",
    "add": "nil",
    "del": "nil",
    "remove": "nil",
    "get": "any",
    "values": "any",
}

_STRING_FIELDS = frozenset(
    {"name", "kind", "basename", "filename", "version", "plat", "arch"}
)
_STRING_SUFFIXES = ("file", "dir")
_ARRAY_SUFFIXES = ("files", "dirs")
_TABLE_FIELDS = frozenset({"sourcebatches", "deps"})


def infer_instance_return(api_id: str) -> str:
    """Infer a reasonable return type for an instance method or module API.

    The documentation rarely specifies return values for script modules, so
    a few naming conventions are used as a best-effort fallback.
    """
    api_name = api_id.rsplit(":", 1)[-1]
    method_name = api_name.rsplit(".", 1)[-1].lower()

    if method_name in _EXACT_RETURNS:
        return _EXACT_RETURNS[method_name]
    if method_name == "check_sizeof":
        return "number|nil"
    if method_name.startswith("check_"):
        return "boolean"

    for prefixes, return_type in _PREFIX_RETURNS:
        if method_name.startswith(prefixes):
            return return_type

    if method_name in _STRING_FIELDS or method_name.endswith(_STRING_SUFFIXES):
        return "string"
    if method_name.endswith(_ARRAY_SUFFIXES):
        return "string[]"
    if method_name.endswith("batches") or method_name in _TABLE_FIELDS:
        return "table"
    return "any"
