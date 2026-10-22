# xmake LuaLS Addon

LuaLS addon for [xmake](https://xmake.io), a cross-platform build system based on
Lua. It provides type annotations for the xmake `xmake.lua` API.

<!--toc:start-->
- [xmake LuaLS Addon](#xmake-luals-addon)
  - [Overview](#overview)
  - [Development](#development)
    - [Overrides](#overrides)
  - [Authors](#authors)
  - [License](#license)
<!--toc:end-->

## Overview

- `library/` contains the generated LuaLS definitions loaded by the addon.
- `library/docs-commit.txt` records the xmake-docs commit used for the last
  generation, so documentation changes can be compared later.
- `config.json` is the addon manifest. It recommends the addon for `xmake.lua`
  files and sets the Lua runtime to LuaJIT.
- `schema.json` contains type aliases and configuration classes used by the
  generated annotations.
- `overrides.json` contains manual corrections for annotations that cannot be
  inferred from the documentation.
- `xmake_luals/` contains the generator.
- `tests/` contains the test suite.

Do not edit files in `library/` by hand. Change the schema, overrides, or
generator and regenerate the library.

When `library/docs-commit.txt` changes after regeneration, the old and new
hashes can be compared with
`https://github.com/xmake-io/xmake-docs/compare/<old>...<new>`.

## Development

Requirements:

- Python 3.10 or newer.
- xmake is optional. When it is available, the generator queries it for
  platform, architecture, build mode, toolchain, and policy values. Without it,
  the static schema is used.

Install the package and test dependencies from the repository root:

```bash
python3 -m pip install -e ".[test]"
```

Generate the annotations:

```bash
python3 main.py
```

After an editable install, the same command is available as `xmake-luals`.

The generator reads the xmake documentation from `.cache/xmake-docs` and fetches
it when the directory is empty. The default output directory is `library/`. Use
`python3 main.py --help` to list the available path and generation options.

The generator is split into small modules:

- `xmake_luals/pipeline.py` coordinates the full generation run.
- `xmake_luals/cli.py` parses command-line options and configures logging.
- `xmake_luals/repo.py` fetches and filters the xmake documentation.
- `xmake_luals/parser.py` and `xmake_luals/markdown.py` parse the markdown pages.
- `xmake_luals/type_mapping.py` and `xmake_luals/return_inference.py` contain
  the documentation heuristics.
- `xmake_luals/patch.py` applies those heuristics and the manual overrides.
- `xmake_luals/generator.py` and `xmake_luals/schema.py` render the Lua files.
- `xmake_luals/xmake.py` queries the local xmake CLI.

Run the tests:

```bash
python3 -m pytest
```

The cached-docs integration test compares the generated API modules with the
committed `library/` files. It is skipped when the documentation cache is
unavailable; run the generator once to populate the cache.

### Overrides

`overrides.json` can correct annotations that cannot be inferred from the
documentation. Entries are keyed by API name, or by `scope.api` when the same
name exists in multiple scopes:

```json
{
    "target.add_cflags": {
        "return_type": "nil",
        "config_type": "CompilationFlagAttr"
    },
    "target.target": {
        "config_type": "TargetAttr",
        "callback": true
    },
    "rule.add_deps": {
        "config_type": "RuleDependencyOption"
    }
}
```

`config_type` must name a class from `schema.json`. For functions with `...`,
the configuration table is merged into the variadic argument because Lua does
not allow parameters after `...`. Functions without `...` receive the schema
class as their optional `opt` parameter. Schema fields are emitted as optional
(`---@field name? type`), so configuration tables only need to specify the keys
they use.

Setting `callback` to `true` allows the same optional argument to also be a
callback function, producing types such as `TargetAttr|fun()`. This is used by
the scoped APIs (`target`, `option`, `package`, `rule`, `toolchain`, and
`task`) that support both a configuration table and a closure, for example
`target("foo", function() ... end)`. `return_type` and a complete manual
`params` list remain available as escape hatches.

## Authors

- [@LelouchHe](https://github.com/LelouchHe)
- [@mccakit](https://github.com/mccakit)
- [@waruqi](https://github.com/waruqi)

## License

[GPLv3](https://www.gnu.org/licenses/gpl-3.0.en.html)
