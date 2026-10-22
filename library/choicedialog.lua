---@meta
---[choicedialog](https://xmake.io/api/scripts/extension-modules/core/ui/choicedialog)

---@class Choicedialog
local Choicedialog = {}

---
---- Create a new choice dialog instance
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/choicedialog#choicedialog-new)
---
---@param name string Required. Dialog name string
---@param bounds rect Required. Dialog bounds rectangle
---@param title string Required. Dialog title string
---@return Choicedialog
function Choicedialog:new(name, bounds, title) end

---
---- Get the choice list box
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/choicedialog#choicedialog-choicebox)
---
---@return any
function Choicedialog:choicebox() end

---
---- Get the scrollbar component
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/choicedialog#choicedialog-scrollbar-box)
---
---@return any
function Choicedialog:scrollbar_box() end

---
---- Handle dialog events
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/choicedialog#choicedialog-on-event)
---
---@param e event Required. Event object
---@return any
function Choicedialog:on_event(e) end
