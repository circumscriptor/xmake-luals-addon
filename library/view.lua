---@meta
---[view](https://xmake.io/api/scripts/extension-modules/core/ui/view)

---@class View
local View = {}

---
---- Create a new view instance
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/view#view-new)
---
---@param name string Required. View name string
---@param bounds rect Required. View bounds rectangle
---@param ... any Variable arguments
---@return any
function View:new(name, bounds, ...) end

---
---- Get the view name
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/view#view-name)
---
---@return string
function View:name() end

---
---- Get the view bounds rectangle
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/view#view-bounds)
---
---@return any
function View:bounds() end

---
---- Set the view bounds rectangle
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/view#view-bounds-set)
---
---@param bounds rect Required. New bounds rectangle
---@return any
function View:bounds_set(bounds) end

---
---- Get the view width
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/view#view-width)
---
---@return any
function View:width() end

---
---- Get the view height
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/view#view-height)
---
---@return any
function View:height() end

---
---- Get the parent view
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/view#view-parent)
---
---@return any
function View:parent() end

---
---- Get the application instance
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/view#view-application)
---
---@return any
function View:application() end

---
---- Get the view canvas
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/view#view-canvas)
---
---@return any
function View:canvas() end

---
---- Get the view state
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/view#view-state)
---
---@param name string Required. State name
---@return any
function View:state(name) end

---
---- Set the view state
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/view#view-state-set)
---
---@param name string Required. State name
---@param enable boolean Required. Whether to enable
---@return any
function View:state_set(name, enable) end

---
---- Get the view option
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/view#view-option)
---
---@param name string Required. Option name
---@return any
function View:option(name) end

---
---- Set the view option
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/view#view-option-set)
---
---@param name string Required. Option name
---@param enable boolean Required. Whether to enable
---@return any
function View:option_set(name, enable) end

---
---- Get the view attribute
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/view#view-attr)
---
---@param name string Required. Attribute name
---@return any
function View:attr(name) end

---
---- Set the view attribute
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/view#view-attr-set)
---
---@param name string Required. Attribute name
---@param value any Required. Attribute value
---@return any
function View:attr_set(name, value) end

---
---- Get the background color
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/view#view-background)
---
---@return any
function View:background() end

---
---- Set the background color
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/view#view-background-set)
---
---@param color string Required. Color name
---@return any
function View:background_set(color) end

---
---- Set the action handler
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/view#view-action-set)
---
---@param name string Required. Action name
---@param on_action fun(target: any, ...: any) Required. Action handler function
---@return any
function View:action_set(name, on_action) end

---
---- Trigger an action
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/view#view-action-on)
---
---@param name string Required. Action name
---@param ... any Variable arguments, passed to action handler
---@return any
function View:action_on(name, ...) end

---
---- Invalidate the view (needs redraw)
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/view#view-invalidate)
---
---@param bounds? boolean Optional. Whether resize is needed
---@return any
function View:invalidate(bounds) end

---
---- Show or hide the view
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/view#view-show)
---
---@param visible boolean Required. Whether to show
---@param opt? table Optional. Option table, supports: `{focused = true}`
---@return any
function View:show(visible, opt) end

---
---- Move cursor position
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/view#view-cursor-move)
---
---@param x number Required. Cursor X coordinate
---@param y number Required. Cursor Y coordinate
---@return any
function View:cursor_move(x, y) end

---
---- Show or hide cursor
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/view#view-cursor-show)
---
---@param visible boolean Required. Whether to show cursor
---@return any
function View:cursor_show(visible) end

---
---- Draw the view
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/view#view-on-draw)
---
---@param transparent boolean Optional. Whether to draw transparently
---@return any
function View:on_draw(transparent) end

---
---- Handle events
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/view#view-on-event)
---
---@param e event Required. Event object
---@return any
function View:on_event(e) end
