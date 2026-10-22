---@meta
---[winos](https://xmake.io/api/scripts/builtin-modules/winos)

---@class Winos
winos = {}

---
---**Scoped: winos**
---
---- Get windows system version
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/winos#winos.version)
---
---@return string
function winos.version() end

---
---**Scoped: winos**
---
---- Get current system process list
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/winos#winos.processes)
---
---@return any
function winos.processes() end

---
---**Scoped: winos**
---
---- Set Windows process error mode
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/winos#winos.set-error-mode)
---
---@param mode integer Process error mode value (Windows API `SetErrorMode`)
---@return nil
function winos.set_error_mode(mode) end

---
---**Scoped: winos**
---
---- Get the list of registry builds
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/winos#winos.registry-keys)
---
---@param pattern string Pattern string for matching registry keys
---@return any
function winos.registry_keys(pattern) end

---
---**Scoped: winos**
---
---- Get a list of registry value names
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/winos#winos.registry-values)
---
---@param pattern string Pattern string for matching registry values
---@return any
function winos.registry_values(pattern) end

---
---**Scoped: winos**
---
---- Get the registry value
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/winos#winos.registry-query)
---
---@param keypath string Registry key path
---@return any
function winos.registry_query(keypath) end

---
---**Scoped: winos**
---
---- Get the digital signature information of a file
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/winos#winos.file-signature)
---
---@param filepath string Windows executable file path
---@return any
function winos.file_signature(filepath) end
