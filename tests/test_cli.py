"""Tests for the command-line interface."""

import logging
from pathlib import Path

from xmake_luals.cli import build_parser, main, parse_options
from xmake_luals.constants import (
    DEFAULT_OUTPUT_DIR,
    DEFAULT_OVERRIDES_FILE,
    DEFAULT_REPO_DIR,
    DEFAULT_SCHEMA_FILE,
)
from xmake_luals.pipeline import GenerationOptions


def test_argument_parser_defaults():
    options = parse_options([])

    assert options == GenerationOptions(
        repo_dir=DEFAULT_REPO_DIR,
        output_dir=DEFAULT_OUTPUT_DIR,
        schema_file=DEFAULT_SCHEMA_FILE,
        overrides_file=DEFAULT_OVERRIDES_FILE,
        skip_xmake=False,
    )


def test_argument_parser_overrides_defaults(tmp_path: Path):
    options = parse_options(
        [
            "--repo-dir",
            str(tmp_path / "repo"),
            "--output-dir",
            str(tmp_path / "out"),
            "--schema-file",
            str(tmp_path / "schema.json"),
            "--overrides-file",
            str(tmp_path / "overrides.json"),
            "--sample-file",
            str(tmp_path / "sample" / "xmake.lua"),
            "--skip-xmake",
        ]
    )

    assert options.repo_dir == str(tmp_path / "repo")
    assert options.output_dir == str(tmp_path / "out")
    assert options.schema_file == str(tmp_path / "schema.json")
    assert options.overrides_file == str(tmp_path / "overrides.json")
    assert options.sample_file == str(tmp_path / "sample" / "xmake.lua")
    assert options.skip_xmake is True


def test_build_parser_has_description():
    assert "xmake" in build_parser().description


def test_main_generates_files(
    docs_repo: Path,
    schema_file: Path,
    overrides_file: Path,
    tmp_path: Path,
    caplog,
):
    output_dir = tmp_path / "library"
    sample_file = tmp_path / "sample" / "xmake.lua"

    with caplog.at_level(logging.INFO):
        exit_code = main(
            [
                "--repo-dir",
                str(docs_repo),
                "--output-dir",
                str(output_dir),
                "--schema-file",
                str(schema_file),
                "--overrides-file",
                str(overrides_file),
                "--sample-file",
                str(sample_file),
                "--skip-xmake",
            ]
        )

    assert exit_code == 0
    assert (output_dir / "bytes.lua").is_file()
    assert sample_file.is_file()
    assert "-- @api bytes.bytes" in sample_file.read_text(encoding="utf-8")
    assert "Skipping local xmake CLI inspection." in caplog.text
    assert "Generated 3 API definitions across 2 modules." in caplog.text


def test_main_returns_error_for_invalid_overrides(
    docs_repo: Path,
    schema_file: Path,
    tmp_path: Path,
    caplog,
):
    overrides_file = tmp_path / "overrides.json"
    overrides_file.write_text("[]", encoding="utf-8")

    with caplog.at_level(logging.ERROR):
        exit_code = main(
            [
                "--repo-dir",
                str(docs_repo),
                "--output-dir",
                str(tmp_path / "library"),
                "--schema-file",
                str(schema_file),
                "--overrides-file",
                str(overrides_file),
                "--skip-xmake",
            ]
        )

    assert exit_code == 1
    assert "Overrides file must contain a JSON object" in caplog.text
