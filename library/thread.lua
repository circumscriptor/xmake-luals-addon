---@meta
---[thread](https://xmake.io/api/scripts/extension-modules/core/base/thread)

---@class Thread
local Thread = {}

---
---- Wait for thread completion (thread instance method)
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/thread#thread-wait)
---
---@param timeout number Required. Timeout in milliseconds (-1 for infinite wait)
---@return any
function Thread:wait(timeout) end
