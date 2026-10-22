---@meta
---[process](https://xmake.io/api/scripts/extension-modules/core/base/process)

---@class Process
local Process = {}

---
---- Wait for subprocess to complete
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/process#process-wait)
---
---@param timeout? number Optional. Timeout in milliseconds. Use -1 for infinite wait, 0 for non-blocking
---@return any
function Process:wait(timeout) end

---
---- Kill the subprocess
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/process#process-kill)
---
---@return any
function Process:kill() end

---
---- Close the subprocess
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/process#process-close)
---
---@return any
function Process:close() end

---
---- Get the process name
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/process#process-name)
---
---@return string
function Process:name() end

---
---- Get the process program path
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/process#process-program)
---
---@return any
function Process:program() end

---
---- Get the process cdata
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/process#process-cdata)
---
---@return any
function Process:cdata() end

---
---- Get the object type
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/process#process-otype)
---
---@return any
function Process:otype() end
