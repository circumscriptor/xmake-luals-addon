---@meta
---[coroutine](https://xmake.io/api/scripts/builtin-modules/coroutine)

---
---**Scoped: coroutine**
---
---- Create a new coroutine
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/coroutine#coroutine.create)
---
---@param f fun(target: any, ...: any) Function to create coroutine
---@return any
function coroutine.create(f) end

---
---**Scoped: coroutine**
---
---- Resume execution of a coroutine
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/coroutine#coroutine.resume)
---
---@param co thread Coroutine thread
---@param ... any Arguments to pass to the coroutine
---@return any
function coroutine.resume(co, ...) end

---
---**Scoped: coroutine**
---
---- Yield execution to the caller
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/coroutine#coroutine.yield)
---
---@param ... any Values to return to the caller
---@return any
function coroutine.yield(...) end

---
---**Scoped: coroutine**
---
---- Get the status of a coroutine
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/coroutine#coroutine.status)
---
---@param co thread Coroutine thread
---@return any
function coroutine.status(co) end

---
---**Scoped: coroutine**
---
---- Create a coroutine wrapper function
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/coroutine#coroutine.wrap)
---
---@param f fun(target: any, ...: any) Function to create coroutine
---@return any
function coroutine.wrap(f) end

---
---**Scoped: coroutine**
---
---- Get the running coroutine
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/coroutine#coroutine.running)
---
---@return any
function coroutine.running() end
