---@meta
---[menubar](https://xmake.io/api/scripts/extension-modules/core/ui/menubar)

---@class Menubar
local Menubar = {}

---
---- Create a new menu bar instance
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/menubar#menubar-new)
---
---@param name string Required. Menu bar name string
---@param bounds rect Required. Menu bar bounds rectangle
---@return any
function Menubar:new(name, bounds) end

---
---- Get the title label
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/menubar#menubar-title)
---
---@return any
function Menubar:title() end
