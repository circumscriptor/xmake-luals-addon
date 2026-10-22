---@meta
---[mconfdialog](https://xmake.io/api/scripts/extension-modules/core/ui/mconfdialog)

---@class Mconfdialog
local Mconfdialog = {}

---
---- Create a new menu configuration dialog instance
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/mconfdialog#mconfdialog-new)
---
---@param name string Required. Dialog name string
---@param bounds rect Required. Dialog bounds rectangle
---@param title string Required. Dialog title string
---@return any
function Mconfdialog:new(name, bounds, title) end

---
---- Load configuration items into the dialog
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/mconfdialog#mconfdialog-load)
---
---@param configs table Required. Array of configuration items (created with `menuconf.*` functions)
---@return any
function Mconfdialog:load(configs) end

---
---- Get all loaded configurations
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/mconfdialog#mconfdialog-configs)
---
---@return any
function Mconfdialog:configs() end

---
---- Get the menu config component
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/mconfdialog#mconfdialog-menuconf)
---
---@return any
function Mconfdialog:menuconf() end

---
---- Show help dialog for the current configuration item
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/mconfdialog#mconfdialog-show-help)
---
---@return any
function Mconfdialog:show_help() end

---
---- Show search dialog to search configurations
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/mconfdialog#mconfdialog-show-search)
---
---@return any
function Mconfdialog:show_search() end

---
---- Show exit confirmation dialog
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/mconfdialog#mconfdialog-show-exit)
---
---@param message string Required. Confirmation message to display
---@return any
function Mconfdialog:show_exit(message) end

---
---- Handle keyboard events
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/mconfdialog#mconfdialog-on-event)
---
---@param e event Required. Event object
---@return any
function Mconfdialog:on_event(e) end
