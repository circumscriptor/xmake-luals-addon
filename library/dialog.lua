---@meta
---[dialog](https://xmake.io/api/scripts/extension-modules/core/ui/dialog)

---@class Dialog
local Dialog = {}

---
---- Create a new dialog instance
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/dialog#dialog-new)
---
---@param name string Required. Dialog name string
---@param bounds rect Required. Dialog bounds rectangle
---@param title string Required. Dialog title string
---@return Dialog
function Dialog:new(name, bounds, title) end

---
---- Get the buttons panel
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/dialog#dialog-buttons)
---
---@return any
function Dialog:buttons() end

---
---- Get a specific button by name
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/dialog#dialog-button)
---
---@param name string Required. Button name string
---@return any
function Dialog:button(name) end

---
---- Add a button to the dialog
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/dialog#dialog-button-add)
---
---@param name string Required. Button name string
---@param text string Required. Button display text
---@param command string|function Required. Command string or function to execute when clicked
---@return any
function Dialog:button_add(name, text, command) end

---
---- Select a button by name
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/dialog#dialog-button-select)
---
---@param name string Required. Button name to select
---@return any
function Dialog:button_select(name) end

---
---- Show or hide the dialog
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/dialog#dialog-show)
---
---@param visible boolean Required. Show or hide the dialog
---@param opt? table Optional. Options table, supports: `{focused = true}`
---@return any
function Dialog:show(visible, opt) end

---
---- Close the dialog
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/dialog#dialog-quit)
---
---@return any
function Dialog:quit() end

---
---- Handle dialog events
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/dialog#dialog-on-event)
---
---@param e event Required. Event object
---@return any
function Dialog:on_event(e) end

---
---- Set dialog background color
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/dialog#dialog-background-set)
---
---@param color string Required. Color name (e.g., "blue", "red")
---@return any
function Dialog:background_set(color) end
