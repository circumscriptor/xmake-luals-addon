#!/usr/bin/env python3
"""Main entry point for generating xmake LuaLS annotations."""

import argparse
import os

from xmake_luals.constants import DEFAULT_OUTPUT_DIR, DEFAULT_SCHEMA_FILE
from xmake_luals.generator import LuaLSGenerator
from xmake_luals.parser import MarkdownParser
from xmake_luals.patch import DocPatcher
from xmake_luals.repo import RepoManager
from xmake_luals.schema import SchemaManager
from xmake_luals.xmake import XmakeInspector


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Generate EmmyLua annotations for xmake from docs and xmake CLI."
    )
    parser.add_argument(
        "--repo-dir",
        default=".cache/xmake-docs",
        help="Path to local xmake-docs checkout",
    )
    parser.add_argument(
        "--output-dir",
        default=DEFAULT_OUTPUT_DIR,
        help="Destination directory for .lua files",
    )
    parser.add_argument(
        "--schema-file", default=DEFAULT_SCHEMA_FILE, help="Path to schema.json"
    )
    parser.add_argument(
        "--overrides-file", default="overrides.json", help="Path to overrides.json"
    )
    parser.add_argument(
        "--skip-xmake", action="store_true", help="Skip querying local xmake CLI"
    )
    args = parser.parse_args()

    print("=" * 60)
    print("XMake LuaLS Annotations Generator")
    print("=" * 60)

    # 1. Inspect CLI & Generate common.lua
    inspector = (
        XmakeInspector() if not args.skip_xmake else XmakeInspector(xmake_path="")
    )
    if inspector.is_available:
        print("[INFO] Found local xmake CLI. Querying platform and policy metadata...")
    else:
        print("[WARN] Local xmake CLI not found. Falling back to static schema...")

    schema_mgr = SchemaManager(args.schema_file, inspector)
    schema_mgr.enrich_from_cli()
    common_lua_path = os.path.join(args.output_dir, "common.lua")
    schema_mgr.generate_common_lua(common_lua_path)
    print(f"[SUCCESS] Generated: {common_lua_path}")

    # 2. Fetch/Prepare Documentation Repository
    repo_mgr = RepoManager(args.repo_dir)
    print(f"[INFO] Preparing xmake-docs in: {args.repo_dir}")
    repo_root = repo_mgr.ensure_repository()
    doc_files = repo_mgr.get_api_files()
    print(f"[INFO] Discovered {len(doc_files)} documentation files matching whitelist.")

    # 3. Parse, Patch & Generate Lua Definitions
    parser = MarkdownParser()
    patcher = DocPatcher(args.overrides_file)
    generator = LuaLSGenerator(args.output_dir)

    total_functions = 0
    for file_path in doc_files:
        doc_file = parser.parse_file(file_path, repo_root)
        if not doc_file or not doc_file.functions:
            continue

        patcher.patch_file(doc_file)
        out_path = generator.generate(doc_file)

        fn_count = len(doc_file.functions)
        total_functions += fn_count
        print(f"[GENERATED] {out_path:<35} ({fn_count} APIs)")

    print("=" * 60)
    print(
        f"[ALL DONE] Generated {total_functions} API definitions across {len(doc_files)} modules."
    )
    print("=" * 60)


if __name__ == "__main__":
    main()
