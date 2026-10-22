# Sample

`xmake.lua` calls every API declared in the generated [`library/`](../library)
once. It is an annotation fixture for the language server, not a buildable
project: most calls only exist to exercise a signature, and some APIs are
deliberately invoked with placeholder values.

Regenerate it after changing `library/`:

```bash
python3 main.py --sample-file sample/xmake.lua
```

The `-- @api <module>.<function>` comment on every line maps the call back to
its definition, and `tests/test_sample.py` verifies that the fixture stays in
sync with `library/`.

## Check the annotations

From the repository root:

```bash
lua-language-server \
    --check=sample \
    --configpath=sample/.luarc.json \
    --checklevel=Warning \
    --check_format=pretty \
    --logpath=/tmp/xmake-luals-log
```

`sample/.luarc.json` loads `../library` as a workspace library, so the check
works without installing the addon globally.
