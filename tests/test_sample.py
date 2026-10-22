"""Tests for the generated sample fixture."""

import re
from pathlib import Path

from xmake_luals.sample import SampleGenerator

PROJECT_ROOT = Path(__file__).resolve().parents[1]
LIBRARY_DIR = PROJECT_ROOT / "library"
SCHEMA_FILE = PROJECT_ROOT / "schema.json"
SAMPLE_FILE = PROJECT_ROOT / "sample" / "xmake.lua"


def _library_apis() -> set[str]:
    apis = set()
    for path in LIBRARY_DIR.glob("*.lua"):
        for line in path.read_text(encoding="utf-8").splitlines():
            match = re.match(r"^function (.*?)\(.*\) end$", line)
            if match:
                apis.add(f"{path.stem}.{match.group(1)}")
    return apis


def _sample_apis() -> set[str]:
    apis = set()
    for line in SAMPLE_FILE.read_text(encoding="utf-8").splitlines():
        match = re.search(r"-- @api (\S+)$", line)
        if match:
            apis.add(match.group(1))
    return apis


def test_sample_covers_every_library_api():
    assert _sample_apis() == _library_apis()


def test_committed_sample_matches_generator():
    rendered = SampleGenerator(LIBRARY_DIR, SAMPLE_FILE, SCHEMA_FILE).render()

    assert SAMPLE_FILE.read_text(encoding="utf-8") == rendered


def test_generator_writes_to_the_requested_path(tmp_path: Path):
    output = tmp_path / "nested" / "xmake.lua"

    result = SampleGenerator(LIBRARY_DIR, output, SCHEMA_FILE).generate()

    assert result == str(output)
    assert output.is_file()
    assert "-- @api project_target.target" in output.read_text(encoding="utf-8")
