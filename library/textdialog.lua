---@meta
---[textdialog](https://xmake.io/api/scripts/extension-modules/core/ui/textdialog)

---@class Textdialog
local Textdialog = {}

---
---- Create a new text dialog instance
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/textdialog#textdialog-new)
---
---@param name string Required. Dialog name string
---@param bounds rect Required. Dialog bounds rectangle
---@param title? string Optional. Dialog title string
---@return Textdialog
function Textdialog:new(name, bounds, title) end

---
---- Get the text area component
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/textdialog#textdialog-text)
---
---@return any
function Textdialog:text() end

---
---- Get the scrollbar component
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/textdialog#textdialog-scrollbar)
---
---@return any
function Textdialog:scrollbar() end

---
---- Set dialog options
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/textdialog#textdialog-option-set)
---
---@param name string Required. Option name, supports: `"scrollable"`
---@param value any Required. Option value
---@return any
function Textdialog:option_set(name, value) end

---
---- Handle dialog events
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/textdialog#textdialog-on-event)
---
---@param e event Required. Event object
---@return any
function Textdialog:on_event(e) end
