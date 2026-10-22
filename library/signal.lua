---@meta
---[signal](https://xmake.io/api/scripts/builtin-modules/signal)

---@class Signal
signal = {}

---
---**Scoped: signal**
---
---- Register signal handler
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/signal#signal.register)
---
---@param signo number Signal number (e.g., signal.SIGINT)
---@param handler fun(target: any, ...: any) Signal handler function
---@return any
function signal.register(signo, handler) end

---
---**Scoped: signal**
---
---- Ignore a signal
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/signal#signal.ignore)
---
---@param signo number Signal number (e.g., signal.SIGINT)
---@return any
function signal.ignore(signo) end

---
---**Scoped: signal**
---
---- Reset a signal
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/signal#signal.reset)
---
---@param signo number Signal number (e.g., signal.SIGINT)
---@return any
function signal.reset(signo) end
