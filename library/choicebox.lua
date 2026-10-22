---@meta
---[choicebox](https://xmake.io/api/scripts/extension-modules/core/ui/choicebox)

---@class Choicebox
local Choicebox = {}

---
---- Create a new single-choice list box instance
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/choicebox#choicebox-new)
---
---@param name string Required. List box name string
---@param bounds rect Required. List box bounds rectangle
---@return Choicebox
function Choicebox:new(name, bounds) end

---
---- Load option values into the list box
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/choicebox#choicebox-load)
---
---@param values table Required. Array of option values
---@param selected? number Optional. Index of the default selected item (1-based), defaults to 1
---@return any
function Choicebox:load(values, selected) end

---
---- Check if the list box is scrollable
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/choicebox#choicebox-scrollable)
---
---@return any
function Choicebox:scrollable() end

---
---- Scroll the list box content
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/choicebox#choicebox-scroll)
---
---@param count number Required. Number of lines to scroll, positive for down, negative for up
---@return any
function Choicebox:scroll(count) end

---
---- Handle keyboard events
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/choicebox#choicebox-on-event)
---
---@param e event Required. Event object
---@return any
function Choicebox:on_event(e) end

---
---- Handle list box resize
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/choicebox#choicebox-on-resize)
---
---@return any
function Choicebox:on_resize() end
