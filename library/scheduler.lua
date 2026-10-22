---@meta
---[scheduler](https://xmake.io/api/scripts/extension-modules/core/base/scheduler)

---@class Scheduler
local Scheduler = {}

---
---- Wait for semaphore
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/scheduler#co-semaphore-wait)
---
---@param timeout number Optional. Timeout in milliseconds, -1 means wait indefinitely, 0 means don't wait
---@return any
function Scheduler:wait(timeout) end

---
---- Release semaphore
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/scheduler#co-semaphore-post)
---
---@param value number Required. The value to increase by
---@return any
function Scheduler:post(value) end

---
---- Get semaphore name
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/scheduler#co-semaphore-name)
---
---@return string
function Scheduler:name() end
