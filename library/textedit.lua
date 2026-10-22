---@meta
---[textedit](https://xmake.io/api/scripts/extension-modules/core/ui/textedit)

---@class Textedit
local Textedit = {}

---
---- Create a new text editor instance
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/textedit#textedit-new)
---
---@param name string Required. Text editor name string
---@param bounds rect Required. Text editor bounds rectangle
---@param text? string Optional. Initial text content
---@return any
function Textedit:new(name, bounds, text) end

---
---- Set text content
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/textedit#textedit-text-set)
---
---@param text string Required. Text content to set
---@return any
function Textedit:text_set(text) end

---
---- Handle keyboard events
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/textedit#textedit-on-event)
---
---@param e event Required. Event object
---@return any
function Textedit:on_event(e) end
