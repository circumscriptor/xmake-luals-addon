---@meta
---[action](https://xmake.io/api/scripts/extension-modules/core/ui/action)

---@class Action
local Action = {}

---
---- Register custom action types
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/action#action-register)
---
---@param tag string Required. Tag name for accumulating count
---@param ... any Variable arguments. Action constant names
---@return any
function Action:register(tag, ...) end
