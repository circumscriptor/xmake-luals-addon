---@meta
---[inputdialog](https://xmake.io/api/scripts/extension-modules/core/ui/inputdialog)

---@class Inputdialog
local Inputdialog = {}

---
---- Create a new input dialog instance
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/inputdialog#inputdialog-new)
---
---@param name string Required. Input dialog name string
---@param bounds rect Required. Input dialog bounds rectangle
---@param title string Required. Input dialog title string
---@return any
function Inputdialog:new(name, bounds, title) end

---
---- Get the text edit component
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/inputdialog#inputdialog-textedit)
---
---@return any
function Inputdialog:textedit() end

---
---- Get the prompt label
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/inputdialog#inputdialog-text)
---
---@return any
function Inputdialog:text() end

---
---- Add a button to the dialog
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/inputdialog#inputdialog-button-add)
---
---@param name string Required. Button name string
---@param text string Required. Button display text
---@param command string|function Required. Command string or function to execute
---@return any
function Inputdialog:button_add(name, text, command) end

---
---- Show or hide the dialog
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/inputdialog#inputdialog-show)
---
---@param visible boolean Required. Show or hide the dialog
---@param opt? table Optional. Options table, supports: `{focused = true}`
---@return any
function Inputdialog:show(visible, opt) end

---
---- Set dialog background color
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/inputdialog#inputdialog-background-set)
---
---@param color string Required. Color name (e.g., "blue", "cyan")
---@return any
function Inputdialog:background_set(color) end

---
---- Close the input dialog
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/inputdialog#inputdialog-quit)
---
---@return any
function Inputdialog:quit() end
