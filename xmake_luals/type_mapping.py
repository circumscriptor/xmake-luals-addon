"""Rules that map documentation parameter names and types to xmake types."""

from collections.abc import Iterable, Mapping
from typing import Final

from .models import DocParam

# Lua/LuaLS primitives must never be shadowed by documentation module names.
LUA_BUILTIN_TYPES: Final[frozenset[str]] = frozenset(
    {
        "any",
        "boolean",
        "false",
        "function",
        "integer",
        "never",
        "nil",
        "number",
        "self",
        "string",
        "table",
        "thread",
        "true",
        "unknown",
        "userdata",
    }
)

# Parameter name to documented schema type.
TYPE_MAPPINGS: Final[dict[str, str]] = {
    "kind": "TargetKind",
    "plat": "Platform",
    "platform": "Platform",
    "arch": "Architecture",
    "mode": "StripMode",
    "level": "WarningLevel",
    "optimize": "OptimizationLevel",
    "runtime": "Runtime",
    "languages": "LanguageStandard",
    "fpmodels": "FloatPointModel",
    "policy": "BuildPolicy",
}


def map_parameter_types(params: Iterable[DocParam]) -> None:
    """Normalise documented parameter types in place.

    The docs use pseudo-generic annotations such as ``<string|array>`` that
    LuaLS does not understand. This function translates those annotations to
    real LuaLS types and maps well-known parameter names to schema aliases.
    """
    previous_type = "string"

    for param in params:
        if param.is_vararg:
            # Variadic arguments often share the type of the preceding option.
            if "string" in param.type_name and previous_type not in (
                "string",
                "string|string[]",
            ):
                param.type_name = param.type_name.replace("string", previous_type)
            continue

        if param.clean_name in TYPE_MAPPINGS:
            param.type_name = TYPE_MAPPINGS[param.clean_name]
        elif "<string|array>" in param.type_name:
            param.type_name = "string|string[]"
        elif "<boolean>" in param.type_name:
            param.type_name = "boolean"
        elif "<number>" in param.type_name:
            param.type_name = "number"
        elif param.type_name.startswith("<function"):
            param.type_name = "fun(target: any, ...: any)"
        else:
            param.type_name = (
                param.type_name.replace("<", "").replace(">", "").rstrip("?") or "any"
            )

        previous_type = param.type_name


def normalise_type_aliases(type_name: str, aliases: Mapping[str, str]) -> str:
    """Replace documentation type names with their canonical schema classes.

    Documentation refers to instance modules by their lowercase module name
    (for example ``bytes`` or ``event``), while generated classes use their
    canonical names (``Bytes`` and ``Event``). Only complete union members are
    replaced so function signatures such as ``fun(target: any)`` stay intact.
    """
    if not type_name or not aliases:
        return type_name

    members: list[str] = []
    for member in type_name.split("|"):
        stripped = member.strip()
        suffix = "[]" if stripped.endswith("[]") else ""
        base = stripped[: -len(suffix)] if suffix else stripped
        canonical = aliases.get(base.casefold())
        members.append(f"{canonical}{suffix}" if canonical else stripped)
    return "|".join(members)
