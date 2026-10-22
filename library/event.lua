---@meta
---[event](https://xmake.io/api/scripts/extension-modules/core/ui/event)

---@class Event
local Event = {}

---
---- Check if event is a keyboard event with specific key
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/event#event-is-key)
---
---@param key_name string Required. Name of the key to check (e.g., "Enter", "Esc", "Tab")
---@return boolean
function Event:is_key(key_name) end

---
---- Check if event is a command event with specific command
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/event#event-is-command)
---
---@param command string Required. Command name to check (e.g., "cm_quit", "cm_enter")
---@return boolean
function Event:is_command(command) end

---
---- Dump event information for debugging
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/event#event-dump)
---
---@return any
function Event:dump() end
