"""Command-line interface for the xmake LuaLS generator."""

import argparse
import logging

from .constants import (
    DEFAULT_OUTPUT_DIR,
    DEFAULT_OVERRIDES_FILE,
    DEFAULT_REPO_DIR,
    DEFAULT_SCHEMA_FILE,
)
from .pipeline import GenerationOptions, GenerationPipeline

logger = logging.getLogger(__name__)


def build_parser() -> argparse.ArgumentParser:
    """Create the argument parser for the CLI."""
    parser = argparse.ArgumentParser(
        description="Generate EmmyLua annotations for xmake from docs and xmake CLI."
    )
    parser.add_argument(
        "--repo-dir",
        default=DEFAULT_REPO_DIR,
        help="Path to local xmake-docs checkout",
    )
    parser.add_argument(
        "--output-dir",
        default=DEFAULT_OUTPUT_DIR,
        help="Destination directory for .lua files",
    )
    parser.add_argument(
        "--schema-file",
        default=DEFAULT_SCHEMA_FILE,
        help="Path to schema.json",
    )
    parser.add_argument(
        "--overrides-file",
        default=DEFAULT_OVERRIDES_FILE,
        help="Path to overrides.json",
    )
    parser.add_argument(
        "--sample-file",
        default=None,
        help="Optional path for a generated xmake.lua that exercises every API",
    )
    parser.add_argument(
        "--skip-xmake",
        action="store_true",
        help="Skip querying local xmake CLI",
    )
    return parser


def parse_options(argv: list[str] | None = None) -> GenerationOptions:
    """Parse CLI arguments into :class:`GenerationOptions`."""
    args = build_parser().parse_args(argv)
    return GenerationOptions(
        repo_dir=args.repo_dir,
        output_dir=args.output_dir,
        schema_file=args.schema_file,
        overrides_file=args.overrides_file,
        sample_file=args.sample_file,
        skip_xmake=args.skip_xmake,
    )


def configure_logging(level: int = logging.INFO) -> None:
    """Configure console logging for standalone CLI usage."""
    logging.basicConfig(level=level, format="[%(levelname)s] %(message)s")


def main(argv: list[str] | None = None) -> int:
    """Run the CLI and return a process exit code."""
    configure_logging()
    options = parse_options(argv)

    logger.info("=" * 60)
    logger.info("XMake LuaLS Annotations Generator")
    logger.info("=" * 60)

    try:
        stats = GenerationPipeline(options).run()
    except (OSError, RuntimeError, TypeError, ValueError) as error:
        logger.error("%s", error)
        return 1

    logger.info("=" * 60)
    logger.info(
        "Generated %d API definitions across %d modules.",
        stats.functions,
        stats.modules,
    )
    if stats.docs_commit:
        logger.info("xmake-docs commit: %s", stats.docs_commit)
    logger.info("=" * 60)
    return 0
