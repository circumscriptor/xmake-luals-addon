"""Small, reusable helpers for parsing the xmake markdown documentation."""

import re
from collections.abc import Iterable, Sequence

CUSTOM_ANCHOR_RE = re.compile(r"\{#[^}]+\}")
HTML_TAG_RE = re.compile(r"<[^>]+>")
SECTION_PREFIX = "## "


def split_sections(lines: Iterable[str]) -> list[list[str]]:
    """Split markdown lines into level-two (``##``) sections.

    Content before the first level-two heading is ignored, matching the
    structure used by the xmake documentation.
    """
    sections: list[list[str]] = []
    current: list[str] = []

    for line in lines:
        if line.strip().startswith(SECTION_PREFIX):
            if current:
                sections.append(current)
            current = [line]
        elif current:
            current.append(line)

    if current:
        sections.append(current)
    return sections


def section_heading(section: Sequence[str]) -> str:
    """Return the raw heading of a section produced by :func:`split_sections`."""
    return section[0][len(SECTION_PREFIX) :].strip()


def clean_heading(heading: str) -> str:
    """Remove VitePress anchors and inline HTML from a heading."""
    heading = CUSTOM_ANCHOR_RE.sub("", heading)
    return HTML_TAG_RE.sub("", heading).strip()


def split_arguments(arguments: str) -> list[str]:
    """Split a Lua argument list on top-level commas.

    Commas nested inside braces, brackets, parentheses, or angle brackets are
    preserved. This is important for table and generic-style type annotations.
    """
    result: list[str] = []
    current: list[str] = []
    depth_brace = depth_paren = depth_angle = 0

    for char in arguments:
        if char in ("{", "["):
            depth_brace += 1
        elif char in ("}", "]"):
            depth_brace -= 1
        elif char == "(":
            depth_paren += 1
        elif char == ")":
            depth_paren -= 1
        elif char == "<":
            depth_angle += 1
        elif char == ">":
            depth_angle -= 1
        elif char == "," and depth_brace == 0 and depth_paren == 0 and depth_angle == 0:
            result.append("".join(current).strip())
            current = []
            continue
        current.append(char)

    if current:
        value = "".join(current).strip()
        if value:
            result.append(value)
    return result


def split_prototypes(lines: Sequence[str]) -> list[str]:
    """Group prototype lines into complete function call expressions.

    Documentation prototypes may span multiple lines, for example when they
    describe a trailing configuration table. Overloads remain separate entries.
    """
    prototypes: list[str] = []
    current: list[str] = []
    depth = 0

    for raw_line in lines:
        line = raw_line.strip()
        if not line:
            continue

        if not current:
            if "(" not in line:
                continue
            current = [line]
            depth = _parenthesis_delta(line)
        else:
            current.append(line)
            depth += _parenthesis_delta(line)

        if depth <= 0:
            prototypes.append(" ".join(current))
            current = []
            depth = 0

    if current:
        prototypes.append(" ".join(current))
    return prototypes


def extract_arguments(prototype: str) -> str | None:
    """Return the text between the outermost parentheses of ``prototype``."""
    start = prototype.find("(")
    if start == -1:
        return None

    depth = 0
    for index in range(start, len(prototype)):
        char = prototype[index]
        if char == "(":
            depth += 1
        elif char == ")":
            depth -= 1
            if depth == 0:
                return prototype[start + 1 : index]
    return None


def _parenthesis_delta(text: str) -> int:
    return text.count("(") - text.count(")")
