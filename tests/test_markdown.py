"""Tests for the markdown parsing helpers."""

from xmake_luals.markdown import (
    clean_heading,
    section_heading,
    split_arguments,
    split_sections,
)


def test_split_sections_ignores_preamble_and_level_three_headings():
    lines = [
        "# Page",
        "Introduction",
        "## first",
        "body",
        "### nested",
        "## second",
        "more",
    ]

    assert split_sections(lines) == [
        ["## first", "body", "### nested"],
        ["## second", "more"],
    ]


def test_split_sections_returns_empty_for_page_without_sections():
    assert split_sections(["# Page", "only preamble"]) == []


def test_section_heading_returns_text_after_prefix():
    assert section_heading(["## target {#target}", "body"]) == "target {#target}"


def test_clean_heading_removes_anchors_and_html():
    assert clean_heading("target {#target}") == "target"
    assert clean_heading("set_kind <Badge text='new' />") == "set_kind"


def test_split_arguments_ignores_nested_commas():
    arguments = "name: <string>, options: { public = true, private = false }, ..."

    assert split_arguments(arguments) == [
        "name: <string>",
        "options: { public = true, private = false }",
        "...",
    ]


def test_split_arguments_handles_parentheses_and_generics():
    arguments = "callback: fun(target: any, ...), values: <string|array>"

    assert split_arguments(arguments) == [
        "callback: fun(target: any, ...)",
        "values: <string|array>",
    ]


def test_split_arguments_returns_empty_list_for_blank_input():
    assert split_arguments("") == []
    assert split_arguments("   ") == []
