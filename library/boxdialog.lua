---@meta
---[boxdialog](https://xmake.io/api/scripts/extension-modules/core/ui/boxdialog)

---@class Boxdialog
local Boxdialog = {}

---
---- Create a new box dialog instance
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/boxdialog#boxdialog-new)
---
---@param name string Required. Dialog name string
---@param bounds Rect Required. Dialog bounds rectangle
---@param title string Required. Dialog title string
---@return Boxdialog
function Boxdialog:new(name, bounds, title) end

---
---- Get the content box window
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/boxdialog#boxdialog-box)
---
---@return any
function Boxdialog:box() end

---
---- Handle dialog resize
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/boxdialog#boxdialog-on-resize)
---
---@return any
function Boxdialog:on_resize() end
