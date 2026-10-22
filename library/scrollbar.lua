---@meta
---[scrollbar](https://xmake.io/api/scripts/extension-modules/core/ui/scrollbar)

---@class Scrollbar
local Scrollbar = {}

---
---- Create a new scrollbar instance
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/scrollbar#scrollbar-new)
---
---@param name string Required. Scrollbar name string
---@param bounds Rect Required. Scrollbar bounds rectangle
---@param vertical? boolean Optional. Whether it's a vertical scrollbar, defaults to `true`
---@return Scrollbar
function Scrollbar:new(name, bounds, vertical) end

---
---- Get current scroll progress
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/scrollbar#scrollbar-progress)
---
---@return any
function Scrollbar:progress() end

---
---- Set scroll progress
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/scrollbar#scrollbar-progress-set)
---
---@param progress number Required. Progress value, range 0.0 to 1.0
---@return any
function Scrollbar:progress_set(progress) end

---
---- Get step width
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/scrollbar#scrollbar-stepwidth)
---
---@return any
function Scrollbar:stepwidth() end

---
---- Set step width
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/scrollbar#scrollbar-stepwidth-set)
---
---@param stepwidth number Required. Step width, range 0.0 to 1.0
---@return any
function Scrollbar:stepwidth_set(stepwidth) end

---
---- Check if it's a vertical scrollbar
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/scrollbar#scrollbar-vertical)
---
---@return any
function Scrollbar:vertical() end

---
---- Set scrollbar direction
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/scrollbar#scrollbar-vertical-set)
---
---@param vertical boolean Required. Set direction, `true` for vertical, `false` for horizontal
---@return any
function Scrollbar:vertical_set(vertical) end

---
---- Get scrollbar character
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/scrollbar#scrollbar-char)
---
---@return any
function Scrollbar:char() end

---
---- Set scrollbar character
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/scrollbar#scrollbar-char-set)
---
---@param char string Required. Character displayed in the scrollbar
---@return any
function Scrollbar:char_set(char) end

---
---- Get scrollbar character attribute
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/scrollbar#scrollbar-charattr)
---
---@return any
function Scrollbar:charattr() end

---
---- Set scrollbar character attribute
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/scrollbar#scrollbar-charattr-set)
---
---@param attr string Required. Character attribute string
---@return any
function Scrollbar:charattr_set(attr) end

---
---- Scroll the scrollbar
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/scrollbar#scrollbar-scroll)
---
---@param steps? number Optional. Number of steps, positive for down/right, negative for up/left, defaults to 1
---@return any
function Scrollbar:scroll(steps) end

---
---- Handle keyboard events
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/scrollbar#scrollbar-on-event)
---
---@param e Event Required. Event object
---@return any
function Scrollbar:on_event(e) end
