---@meta
---[runjobs](https://xmake.io/api/scripts/extension-modules/async/runjobs)

---@class Runjobs
local Runjobs = {}

---
---Run jobs concurrently.
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/async/runjobs#runjobs)
---
---@param name string name parameter
---@param jobs fun(target: any, ...: any) jobs parameter
---@param options? table options parameter
---@return Runjobs
function runjobs(name, jobs, options) end
