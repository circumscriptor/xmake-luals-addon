"""End-to-end pipeline that turns xmake docs into LuaLS annotations."""

import logging
import os
from dataclasses import dataclass

from .constants import (
    DEFAULT_OUTPUT_DIR,
    DEFAULT_OVERRIDES_FILE,
    DEFAULT_REPO_DIR,
    DEFAULT_SCHEMA_FILE,
    DOCS_COMMIT_FILE,
)
from .generator import LuaLSGenerator
from .models import DocFile
from .parser import MarkdownParser
from .patch import DocPatcher
from .repo import RepoManager
from .schema import SchemaManager
from .type_mapping import LUA_BUILTIN_TYPES
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
    docs_commit: str | None = None


class GenerationPipeline:
    """Coordinate schema, repository, parser, patcher, and generator."""

    def __init__(self, options: GenerationOptions):
        self.options = options

    def run(self) -> GenerationStats:
        """Run all generation steps and return a summary."""
        common_lua_path, schema_manager = self._generate_schema()
        repo_root, doc_files, docs_commit = self._prepare_docs()

        parser = MarkdownParser()
        documents = [
            (file_path, parser.parse_file(file_path, repo_root))
            for file_path in doc_files
        ]
        type_aliases = self._build_type_aliases(
            documents,
            schema_manager.class_names,
        )
        patcher = DocPatcher(
            self.options.overrides_file,
            known_types=schema_manager.class_names,
            type_aliases=type_aliases,
        )
        generator = LuaLSGenerator(self.options.output_dir)

        total_functions = 0
        module_count = 0
        for _, doc_file in documents:
            if not doc_file.has_functions:
                self._remove_stale_output(generator, doc_file)
                continue

            patcher.patch_file(doc_file)
            output_path = generator.generate(doc_file)
            function_count = len(doc_file.functions)
            total_functions += function_count
            module_count += 1
            logger.info("Generated %-35s (%d APIs)", output_path, function_count)

        self._write_docs_commit(docs_commit)

        return GenerationStats(
            modules=module_count,
            functions=total_functions,
            common_lua_path=common_lua_path,
            docs_commit=docs_commit,
        )

    @staticmethod
    def _build_type_aliases(
        documents: list[tuple[str, DocFile]],
        class_names: set[str],
    ) -> dict[str, str]:
        """Map lowercase documentation module types to generated classes."""
        aliases = {
            name.casefold(): name
            for name in class_names
            if name.casefold() not in LUA_BUILTIN_TYPES
        }
        for _, doc_file in documents:
            if not doc_file.is_instance or not doc_file.class_name:
                continue

            class_name = doc_file.class_name
            candidates = [class_name, doc_file.file_base]
            for suffix in ("_instance", "-instance"):
                if doc_file.file_base.endswith(suffix):
                    candidates.append(doc_file.file_base[: -len(suffix)])

            for candidate in candidates:
                alias = candidate.casefold()
                if alias not in LUA_BUILTIN_TYPES:
                    aliases[alias] = class_name
        return aliases

    @staticmethod
    def _remove_stale_output(generator: LuaLSGenerator, doc_file: DocFile) -> None:
        """Delete output left over from a page that no longer defines APIs."""
        stale_path = generator.output_path(doc_file)
        try:
            stale_path.unlink()
        except FileNotFoundError:
            return
        logger.info("Removed stale output: %s", stale_path)

    def _generate_schema(self) -> tuple[str, SchemaManager]:
        inspector = XmakeInspector(enabled=not self.options.skip_xmake)
        self._log_inspector_status(inspector)

        schema_manager = SchemaManager(self.options.schema_file, inspector)
        schema_manager.enrich_from_cli()
        output_path = os.path.join(self.options.output_dir, "common.lua")
        common_lua_path = schema_manager.generate_common_lua(output_path)
        logger.info("Generated: %s", common_lua_path)
        return common_lua_path, schema_manager

    def _prepare_docs(self) -> tuple[str, list[str], str | None]:
        repo_manager = RepoManager(self.options.repo_dir)
        logger.info("Preparing xmake-docs in: %s", self.options.repo_dir)
        repo_root = repo_manager.ensure_repository()
        doc_files = repo_manager.get_api_files()
        docs_commit = repo_manager.get_commit_hash()
        if docs_commit:
            logger.info("xmake-docs commit: %s", docs_commit)
        else:
            logger.warning("Could not determine the xmake-docs commit hash.")
        logger.info(
            "Discovered %d documentation files matching whitelist.", len(doc_files)
        )
        return repo_root, doc_files, docs_commit

    def _write_docs_commit(self, docs_commit: str | None) -> None:
        """Record the docs revision used to generate the committed library."""
        if not docs_commit:
            return

        os.makedirs(self.options.output_dir, exist_ok=True)
        output_path = os.path.join(self.options.output_dir, DOCS_COMMIT_FILE)

        previous_commit = None
        if os.path.isfile(output_path):
            with open(output_path, "r", encoding="utf-8") as handle:
                previous_commit = handle.read().strip()
        if previous_commit and previous_commit != docs_commit:
            logger.info(
                "xmake-docs commit changed: %s -> %s",
                previous_commit,
                docs_commit,
            )

        with open(output_path, "w", encoding="utf-8") as handle:
            handle.write(f"{docs_commit}\n")
        logger.info("Recorded xmake-docs commit: %s", output_path)

    def _log_inspector_status(self, inspector: XmakeInspector) -> None:
        if self.options.skip_xmake:
            logger.info("Skipping local xmake CLI inspection.")
        elif inspector.is_available:
            logger.info("Found local xmake CLI. Querying platform and policy metadata.")
        else:
            logger.warning("Local xmake CLI not found. Falling back to static schema.")
