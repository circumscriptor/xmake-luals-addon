"""End-to-end pipeline that turns xmake docs into LuaLS annotations."""

import logging
import os
from dataclasses import dataclass

from .constants import (
    DEFAULT_OUTPUT_DIR,
    DEFAULT_OVERRIDES_FILE,
    DEFAULT_REPO_DIR,
    DEFAULT_SCHEMA_FILE,
)
from .generator import LuaLSGenerator
from .parser import MarkdownParser
from .patch import DocPatcher
from .repo import RepoManager
from .schema import SchemaManager
from .xmake import XmakeInspector

logger = logging.getLogger(__name__)


@dataclass(frozen=True)
class GenerationOptions:
    """User-configurable paths and switches for a generation run."""

    repo_dir: str = DEFAULT_REPO_DIR
    output_dir: str = DEFAULT_OUTPUT_DIR
    schema_file: str = DEFAULT_SCHEMA_FILE
    overrides_file: str = DEFAULT_OVERRIDES_FILE
    skip_xmake: bool = False


@dataclass(frozen=True)
class GenerationStats:
    """Summary of a completed generation run."""

    modules: int
    functions: int
    common_lua_path: str


class GenerationPipeline:
    """Coordinate schema, repository, parser, patcher, and generator."""

    def __init__(self, options: GenerationOptions):
        self.options = options

    def run(self) -> GenerationStats:
        """Run all generation steps and return a summary."""
        patcher = DocPatcher(self.options.overrides_file)
        common_lua_path = self._generate_schema()
        repo_root, doc_files = self._prepare_docs()

        parser = MarkdownParser()
        generator = LuaLSGenerator(self.options.output_dir)

        total_functions = 0
        module_count = 0
        for file_path in doc_files:
            doc_file = parser.parse_file(file_path, repo_root)
            if not doc_file.has_functions:
                continue

            patcher.patch_file(doc_file)
            output_path = generator.generate(doc_file)
            function_count = len(doc_file.functions)
            total_functions += function_count
            module_count += 1
            logger.info("Generated %-35s (%d APIs)", output_path, function_count)

        return GenerationStats(
            modules=module_count,
            functions=total_functions,
            common_lua_path=common_lua_path,
        )

    def _generate_schema(self) -> str:
        inspector = XmakeInspector(enabled=not self.options.skip_xmake)
        self._log_inspector_status(inspector)

        schema_manager = SchemaManager(self.options.schema_file, inspector)
        schema_manager.enrich_from_cli()
        output_path = os.path.join(self.options.output_dir, "common.lua")
        common_lua_path = schema_manager.generate_common_lua(output_path)
        logger.info("Generated: %s", common_lua_path)
        return common_lua_path

    def _prepare_docs(self) -> tuple[str, list[str]]:
        repo_manager = RepoManager(self.options.repo_dir)
        logger.info("Preparing xmake-docs in: %s", self.options.repo_dir)
        repo_root = repo_manager.ensure_repository()
        doc_files = repo_manager.get_api_files()
        logger.info(
            "Discovered %d documentation files matching whitelist.", len(doc_files)
        )
        return repo_root, doc_files

    def _log_inspector_status(self, inspector: XmakeInspector) -> None:
        if self.options.skip_xmake:
            logger.info("Skipping local xmake CLI inspection.")
        elif inspector.is_available:
            logger.info("Found local xmake CLI. Querying platform and policy metadata.")
        else:
            logger.warning("Local xmake CLI not found. Falling back to static schema.")
