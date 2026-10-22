---@meta
---[statusbar](https://xmake.io/api/scripts/extension-modules/core/ui/statusbar)

---@class Statusbar
local Statusbar = {}

---
---- Create a new status bar instance
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/statusbar#statusbar-new)
---
---@param name string Required. Status bar name string
---@param bounds Rect Required. Status bar bounds rectangle
---@return Statusbar
function Statusbar:new(name, bounds) end

---
---- Get the info label
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/statusbar#statusbar-info)
---
---@return any
function Statusbar:info() end
