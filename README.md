
# XMake Lua Language Server Addon

<!--toc:start-->
- [XMake Lua Language Server Addon](#xmake-lua-language-server-addon)
  - [Installation](#installation)
  - [Development](#development)
  - [License](#license)
<!--toc:end-->

This is the official lua language server addon for xmake, A cross-platform build utility based on Lua language.

## Installation

For [Zed Editor](https://zed.dev/):

- Install [Scoop](https://scoop.sh/)

```bash
  Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

- Install [Zed Editor](https://zed.dev/)

```bash
scoop install extras/zed
```

- Install [Lua](https://www.lua.org/)

```bash
scoop install main/lua
```

- Install [Lua Language Server](https://luals.github.io/)

```bash
scoop install main/lua-language-server
```

- Clone [LLS-Addons](https://github.com/LuaLS/LLS-Addons) and initialize xmake submodule

```bash
git clone https://github.com/LuaLS/LLS-Addons.git; Set-Location LLS-Addons; git submodule update --init addons/xmake/module
```

- Create an xmake project in the directory of your choice

```bash
xmake create -P "hello"
```

- Open the project folder inside Zed Editor, then create a project settings file by pressing Ctrl + Shift + P and typing 'Open Project Settings', inside there point to the lua language server, by giving its binary directory

```bash
{
    "lsp": {
        "lua-language-server": {
            "binary": {
                "path": "C:/Users/cakit/scoop/apps/lua-language-server/current/bin/lua-language-server.exe"
            }
        }
    },
    "languages": {
        "Lua": {
            "language_servers": ["lua-language-server"]
        }
    }
}
```

- Create .luarc.json file by running this command at the project directory, this file must point to your addons directory and the library folder of the xmake addon. Also disable the runtime builtin os module from showing up in the lsp.

```bash
@'
{
    "workspace.userThirdParty": ["C:/Users/cakit/Documents/LLS-Addons/addons"],
    "workspace.library": [
        "C:/Users/cakit/Documents/LLS-Addons/addons/xmake-luals-addon/library"
    ],
    "runtime.builtin":{
        "os": "disable"
    }
}
'@ | Out-File -Encoding utf8 .luarc.json
```

## Development

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
    "rule.add_deps": {
        "config_type": "RuleDependencyOption"
    }
}
```

`config_type` must name a class from `schema.json`. For functions with `...`,
the configuration table is merged into the variadic argument because Lua does
not allow parameters after `...`. Functions without `...` receive the schema
class as their optional `opt` parameter. `return_type` and a complete manual
`params` list remain available as escape hatches.

Install the test dependencies and run the suite with:

```bash
python3 -m pip install -e ".[test]"
python3 -m pytest
```

The integration tests use the documentation checkout in `.cache/xmake-docs`
when it is available, and verify that the generated definitions match the
committed `library/` output. They are skipped automatically when the cache has
not been populated yet. To populate it, run `python3 main.py` once.

## Authors

- [@LelouchHe](https://github.com/LelouchHe)
- [@mccakit](https://github.com/mccakit)
- [@waruqi](https://github.com/waruqi)

## License

[GPLv3](https://www.gnu.org/licenses/gpl-3.0.en.html)
