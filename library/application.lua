---@meta
---[application](https://xmake.io/api/scripts/extension-modules/core/ui/application)

---@class Application
local Application = {}

---
---- Create a new application instance
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/application#application-new)
---
---@return any
function Application:new() end

---
---- Initialize the application
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/application#application-init)
---
---@param name string Required. Application name string
---@param argv? table Optional. Command line arguments table
---@return any
function Application:init(name, argv) end

---
---- Run the application and start the event loop
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/application#application-run)
---
---@param ... any Optional. Additional arguments
---@return any
function Application:run(...) end

---
---- Set the application background color
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/application#application-background-set)
---
---@param color string Required. Color name (e.g., "blue", "red")
---@return any
function Application:background_set(color) end

---
---- Insert a view into the application
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/application#application-insert)
---
---@param view view Required. View to insert
---@param opt? table Optional. Options table, supports: `{centerx = true, centery = true}`
---@return any
function Application:insert(view, opt) end

---
---- Handle window resize events
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/application#application-on-resize)
---
---@return any
function Application:on_resize() end

---
---- Get the application's menu bar
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/application#application-menubar)
---
---@return any
function Application:menubar() end

---
---- Get the application's desktop area
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/application#application-desktop)
---
---@return any
function Application:desktop() end

---
---- Get the application's status bar
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/ui/application#application-statusbar)
---
---@return any
function Application:statusbar() end
