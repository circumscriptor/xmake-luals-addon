"""Domain models shared by the parser, patcher, and generator."""

from dataclasses import dataclass, field


@dataclass
class DocParam:
    """A documented function parameter."""

    name: str
    type_name: str
    description: str = ""
    is_optional: bool = False

    @property
    def clean_name(self) -> str:
        """Return the parameter name as valid Lua syntax (without ``?``)."""
        return self.name.rstrip("?").strip()

    @property
    def is_vararg(self) -> bool:
        """Whether this parameter represents Lua's variadic argument."""
        return self.clean_name == "..."


@dataclass
class DocFunction:
    """A single documented API function or method."""

    api_id: str
    description: str
    link: str
    params: list[DocParam] = field(default_factory=list)
    return_type: str = "nil"
    is_scoped: bool = False
    scope: str | None = None
    class_name: str | None = None
    fn_args: list[str] = field(default_factory=list)

    @property
    def is_method(self) -> bool:
        """Whether the API is written as ``object:method``."""
        return ":" in self.api_id

    @property
    def is_static(self) -> bool:
        """Whether the API is written as ``object.method``."""
        return "." in self.api_id

    @property
    def method_name(self) -> str:
        """The method name of a ``object:method`` API."""
        return self.api_id.rsplit(":", 1)[-1]

    @property
    def static_name(self) -> str:
        """The name of a ``object.method`` API."""
        return self.api_id.rsplit(".", 1)[-1]

    @property
    def short_name(self) -> str:
        """The function name without any namespace prefix."""
        return self.method_name if self.is_method else self.api_id


@dataclass
class DocFile:
    """A documentation page containing one or more API functions."""

    file_base: str
    doc_link: str
    is_instance: bool
    class_name: str | None
    functions: list[DocFunction] = field(default_factory=list)

    @property
    def has_functions(self) -> bool:
        """Whether this file produced any usable API definitions."""
        return bool(self.functions)
