"""Custom override and patching engine for LuaLS annotations."""

import json
import os
from typing import Any

from .models import DocFile, DocFunction, DocParam
from .return_inference import infer_instance_return
from .type_mapping import map_parameter_types, normalise_type_aliases


class DocPatcher:
    """Enrich parsed documentation and apply user-provided overrides."""

    def __init__(
        self,
        overrides_path: str = "overrides.json",
        known_types: set[str] | None = None,
        type_aliases: dict[str, str] | None = None,
    ):
        self.overrides = self._load_overrides(overrides_path)
        self.known_types = known_types
        self.type_aliases = type_aliases or {}

    @staticmethod
    def _load_overrides(path: str) -> dict[str, Any]:
        """Load the optional overrides file, ignoring a missing file."""
        if not os.path.isfile(path):
            return {}
        with open(path, "r", encoding="utf-8") as handle:
            data = json.load(handle)
        if not isinstance(data, dict):
            raise TypeError(f"Overrides file must contain a JSON object: {path}")
        return data

    def patch_file(self, doc_file: DocFile) -> None:
        """Enrich and patch every function in ``doc_file``."""
        for function in doc_file.functions:
            self.patch_function(
                function,
                doc_file.is_instance,
                scope=function.scope,
            )

    def patch_function(
        self,
        function: DocFunction,
        is_instance: bool,
        scope: str | None = None,
    ) -> None:
        """Apply all transformations to a single function."""
        map_parameter_types(function.params)
        function.fn_args = [arg.rstrip("?").strip() for arg in function.fn_args]
        function.return_type = (
            infer_instance_return(function.api_id) if is_instance else "nil"
        )
        self._apply_override(function, scope)
        self._normalise_type_aliases(function)

    def _normalise_type_aliases(self, function: DocFunction) -> None:
        """Replace lowercase documentation type names with schema classes."""
        if not self.type_aliases:
            return
        for param in function.params:
            param.type_name = normalise_type_aliases(
                param.type_name, self.type_aliases
            )
        function.return_type = normalise_type_aliases(
            function.return_type, self.type_aliases
        )

    def _apply_override(
        self,
        function: DocFunction,
        scope: str | None,
    ) -> None:
        """Apply a manual override, if one exists for the API id."""
        override = self._find_override(function, scope)
        if override is None:
            return

        if "return_type" in override:
            function.return_type = str(override["return_type"])
        if "params" in override:
            function.params = self._parse_override_params(
                function.api_id, override["params"]
            )
            function.fn_args = [param.clean_name for param in function.params]
        if "config_type" in override:
            self._apply_config_type(function, str(override["config_type"]))
        if override.get("callback"):
            self._apply_callback(function, override["callback"])

    def _apply_callback(self, function: DocFunction, callback: Any) -> None:
        """Allow the configuration argument to also be a callback function."""
        callback_type = callback.strip() if isinstance(callback, str) else "fun()"
        if not callback_type:
            callback_type = "fun()"

        config_params = function.config_params
        if config_params:
            for param in config_params:
                param.type_name = self._merge_union(param.type_name, callback_type)
            return

        vararg = function.vararg_param
        if vararg is not None:
            vararg.type_name = self._merge_union(vararg.type_name, callback_type)
            return

        function.params.append(
            DocParam(
                "opt",
                callback_type,
                "Configuration options",
                is_optional=True,
                is_config=True,
            )
        )
        if "opt" not in function.fn_args:
            function.fn_args.append("opt")

    def _find_override(
        self,
        function: DocFunction,
        scope: str | None,
    ) -> dict[str, Any] | None:
        """Look up a scoped override first, then fall back to the API id."""
        if scope:
            qualified = self.overrides.get(f"{scope}.{function.api_id}")
            if isinstance(qualified, dict):
                return qualified

        override = self.overrides.get(function.api_id)
        return override if isinstance(override, dict) else None

    def _apply_config_type(self, function: DocFunction, type_name: str) -> None:
        """Attach a schema type to the function's configuration table."""
        config_type = type_name.strip()
        if not config_type:
            raise ValueError(f"Override 'config_type' cannot be empty: {function.api_id}")
        if self.known_types is not None and config_type not in self.known_types:
            raise ValueError(
                f"Unknown config_type '{config_type}' for API: {function.api_id}"
            )

        vararg = function.vararg_param
        if vararg is not None:
            base_type = self._vararg_base_type(function, vararg)
            vararg.type_name = self._merge_union(base_type, config_type)
            # A configuration table written after ``...`` is part of the
            # variadic arguments, not a separate positional parameter.
            function.params = [
                param
                for param in function.params
                if not (param.is_config and param.clean_name not in function.fn_args)
            ]
            return

        config_params = function.config_params
        if config_params:
            for param in config_params:
                param.type_name = config_type
            return

        # The docs omitted the prototype, but the override knows about the
        # configuration table, so add it as the final optional argument.
        function.params.append(
            DocParam(
                "opt",
                config_type,
                "Configuration options",
                is_optional=True,
                is_config=True,
            )
        )
        if "opt" not in function.fn_args:
            function.fn_args.append("opt")

    @staticmethod
    def _vararg_base_type(function: DocFunction, vararg: DocParam) -> str:
        """Infer the scalar type accepted by a variadic argument."""
        explicit_type = vararg.type_name.strip()
        if explicit_type and explicit_type != "any":
            return explicit_type

        index = function.params.index(vararg)
        for param in reversed(function.params[:index]):
            if param.is_config:
                continue
            candidate = DocPatcher._scalar_type(param.type_name)
            if candidate != "any":
                return candidate
        return "any"

    @staticmethod
    def _scalar_type(type_name: str) -> str:
        """Reduce a type expression to its first scalar member."""
        for part in type_name.split("|"):
            part = part.strip().replace("[]", "").strip()
            if part and part not in ("any", "nil"):
                return part
        return "any"

    @staticmethod
    def _merge_union(base_type: str, extra_type: str) -> str:
        """Merge two type expressions without duplicating members."""
        members: list[str] = []
        for type_expression in (base_type, extra_type):
            for member in type_expression.split("|"):
                member = member.strip()
                if member and member not in members:
                    members.append(member)
        return "|".join(members) or extra_type

    @staticmethod
    def _parse_override_params(api_id: str, entries: Any) -> list[DocParam]:
        """Convert override JSON entries into :class:`DocParam` objects."""
        if not isinstance(entries, list):
            raise TypeError(f"Override 'params' must be a list for API id: {api_id}")

        params: list[DocParam] = []
        for entry in entries:
            if (
                not isinstance(entry, dict)
                or "name" not in entry
                or "type" not in entry
            ):
                raise ValueError(
                    f"Override parameters require 'name' and 'type': {api_id}"
                )
            name = str(entry["name"])
            params.append(
                DocParam(
                    name=name.rstrip("?"),
                    type_name=str(entry["type"]),
                    description=str(entry.get("desc", "")),
                    is_optional=name.endswith("?")
                    or bool(entry.get("optional", False)),
                )
            )
        return params
