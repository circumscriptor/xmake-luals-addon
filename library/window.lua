---@meta
---[window](https://xmake.io/api/scripts/extension-modules/core/ui/window)

---@class Window
local Window = {}

---
---- Create a new window instance
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/window#window-new)
---
---@param name string Required. Window name string
---@param bounds Rect Required. Window bounds rectangle
---@param title? string Optional. Window title string (centered at top)
---@param shadow? boolean Optional. Show shadow effect (`true` or `false`, default `false`)
---@return Window
function Window:new(name, bounds, title, shadow) end

---
---- Get the frame panel
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/window#window-frame)
---
---@return any
function Window:frame() end

---
---- Get the content panel
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/window#window-panel)
---
---@return any
function Window:panel() end

---
---- Get the title label
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/window#window-title)
---
---@return any
function Window:title() end

---
---- Get the shadow view
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/window#window-shadow)
---
---@return any
function Window:shadow() end

---
---- Get the border component
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/window#window-border)
---
---@return any
function Window:border() end

---
---- Handle keyboard events for tab navigation
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/window#window-on-event)
---
---@param e Event Required. Event object
---@return any
function Window:on_event(e) end

---
---- Handle window resize
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/window#window-on-resize)
---
---@return any
function Window:on_resize() end
