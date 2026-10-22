---@meta
---[button](https://xmake.io/api/scripts/extension-modules/core/ui/button)

---@class Button
local Button = {}

---
---- Create a new button instance
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/button#button-new)
---
---@param name string Required. Button name string
---@param bounds rect Required. Button bounds rectangle
---@param text string Required. Button text to display
---@param on_action? fun(target: any, ...: any) Optional. Function to call when button is activated
---@return any
function Button:new(name, bounds, text, on_action) end

---
---- Get the button text
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/button#button-text)
---
---@return any
function Button:text() end

---
---- Set the button text
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/button#button-text-set)
---
---@param text string Required. Button text to display
---@return any
function Button:text_set(text) end

---
---- Get the text attribute
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/button#button-textattr)
---
---@return any
function Button:textattr() end

---
---- Set the text attribute (color, style)
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/button#button-textattr-set)
---
---@param attr string Required. Text attribute string (e.g., "red bold")
---@return any
function Button:textattr_set(attr) end

---
---- Set the button action handler
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/button#button-action-set)
---
---@param action_type string Required. Action type (e.g., `action.ac_on_enter`)
---@param handler fun(target: any, ...: any) Required. Function to call when action is triggered
---@return any
function Button:action_set(action_type, handler) end

---
---- Handle keyboard events
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/button#button-on-event)
---
---@param e event Required. Event object
---@return any
function Button:on_event(e) end

---
---- Draw the button view
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/button#button-on-draw)
---
---@param transparent boolean Optional. Draw with transparency
---@return any
function Button:on_draw(transparent) end
