"""Tests for the xmake CLI inspector."""

import subprocess

import pytest

from xmake_luals import xmake as xmake_module
from xmake_luals.xmake import XmakeInspector


def test_disabled_inspector_never_queries_cli():
    inspector = XmakeInspector.disabled()

    assert inspector.is_available is False
    assert inspector.query_list("platforms") == []


def test_auto_detects_xmake(monkeypatch):
    monkeypatch.setattr(xmake_module.shutil, "which", lambda name: "/usr/bin/xmake")

    inspector = XmakeInspector()

    assert inspector.is_available is True
    assert inspector.xmake_path == "/usr/bin/xmake"


def test_explicit_path_bypasses_path_lookup(monkeypatch):
    monkeypatch.setattr(
        xmake_module.shutil,
        "which",
        lambda name: pytest.fail("shutil.which should not be called"),
    )

    inspector = XmakeInspector("/opt/xmake")

    assert inspector.xmake_path == "/opt/xmake"


def test_query_list_parses_and_sorts_values(monkeypatch):
    calls = []

    def fake_run(command, **kwargs):
        calls.append((command, kwargs))
        return subprocess.CompletedProcess(command, 0, stdout='["b", "a"]', stderr="")

    monkeypatch.setattr(xmake_module.subprocess, "run", fake_run)
    inspector = XmakeInspector("/opt/xmake")

    assert inspector.query_list("platforms") == ["a", "b"]
    assert calls[0][0] == [
        "/opt/xmake",
        "show",
        "-l",
        "platforms",
        "--json",
    ]
    assert calls[0][1]["timeout"] == 60


def test_query_list_caches_results(monkeypatch):
    call_count = 0

    def fake_run(command, **kwargs):
        nonlocal call_count
        call_count += 1
        return subprocess.CompletedProcess(command, 0, stdout='["linux"]', stderr="")

    monkeypatch.setattr(xmake_module.subprocess, "run", fake_run)
    inspector = XmakeInspector("/opt/xmake")

    assert inspector.query_list("platforms") == ["linux"]
    assert inspector.query_list("platforms") == ["linux"]
    assert call_count == 1


def test_query_list_extracts_names_from_objects_and_dicts(monkeypatch):
    outputs = iter(
        [
            '[{"name": "gcc", "description": "GNU"}, {"name": "clang"}]',
            '{"z": 1, "a": 2}',
        ]
    )

    def fake_run(command, **kwargs):
        return subprocess.CompletedProcess(command, 0, stdout=next(outputs), stderr="")

    monkeypatch.setattr(xmake_module.subprocess, "run", fake_run)
    inspector = XmakeInspector("/opt/xmake")

    assert inspector.query_list("toolchains") == ["clang", "gcc"]
    assert inspector.query_list("policies") == ["a", "z"]


def test_query_list_tolerates_non_json_preamble(monkeypatch):
    def fake_run(command, **kwargs):
        return subprocess.CompletedProcess(
            command, 0, stdout='warning: something\n["linux", "windows"]', stderr=""
        )

    monkeypatch.setattr(xmake_module.subprocess, "run", fake_run)
    inspector = XmakeInspector("/opt/xmake")

    assert inspector.query_list("platforms") == ["linux", "windows"]


def test_query_list_returns_empty_for_invalid_json(monkeypatch):
    def fake_run(command, **kwargs):
        return subprocess.CompletedProcess(command, 0, stdout="not json", stderr="")

    monkeypatch.setattr(xmake_module.subprocess, "run", fake_run)
    inspector = XmakeInspector("/opt/xmake")

    assert inspector.query_list("platforms") == []


def test_query_list_returns_empty_on_process_failure(monkeypatch):
    def fake_run(command, **kwargs):
        raise subprocess.CalledProcessError(1, command)

    monkeypatch.setattr(xmake_module.subprocess, "run", fake_run)
    inspector = XmakeInspector("/opt/xmake")

    assert inspector.query_list("platforms") == []


def test_query_list_returns_empty_on_timeout(monkeypatch):
    def fake_run(command, **kwargs):
        raise subprocess.TimeoutExpired(command, timeout=60)

    monkeypatch.setattr(xmake_module.subprocess, "run", fake_run)
    inspector = XmakeInspector("/opt/xmake")

    assert inspector.query_list("platforms") == []
