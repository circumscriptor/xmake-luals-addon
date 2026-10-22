---@meta
---[label](https://xmake.io/api/scripts/extension-modules/core/ui/label)

---@class Label
local Label = {}

---
---- Create a new label instance
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/label#label-new)
---
---@param name string Required. Label name string
---@param bounds Rect Required. Label bounds rectangle
---@param text string Required. Text content to display
---@return Label
function Label:new(name, bounds, text) end

---
---- Get the current text content
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/label#label-text)
---
---@return any
function Label:text() end

---
---- Set the text content
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/label#label-text-set)
---
---@param text string Required. Text content to display
---@return any
function Label:text_set(text) end

---
---- Get the text attribute string
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/label#label-textattr)
---
---@return any
function Label:textattr() end

---
---- Set the text attribute (color, style)
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/label#label-textattr-set)
---
---@param attr string Required. Text attribute string (e.g., "red bold", "yellow onblue")
---@return any
function Label:textattr_set(attr) end

---
---- Get the compiled text attribute value
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/label#label-textattr-val)
---
---@return any
function Label:textattr_val() end

---
---- Split text into lines based on width
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/label#label-splitext)
---
---@param text string Required. Text to split
---@param width? number Optional. Maximum line width (defaults to label width)
---@return any
function Label:splitext(text, width) end

---
---- Draw the label view
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/label#label-on-draw)
---
---@param transparent? boolean Optional. Draw with transparency
---@return any
function Label:on_draw(transparent) end
