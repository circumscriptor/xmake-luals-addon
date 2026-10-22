---@meta
---[xpack_component_interfaces](https://xmake.io/api/description/xpack-component-interfaces)

---
---**Scoped: xpack-component-interfaces**
---
---- Set a brief description of the package components
---
---[Open in browser](https://xmake.io/api/description/xpack-component-interfaces#set-title)
---
---@param title string Component title string
---@return nil
function set_title(title) end

---
---**Scoped: xpack-component-interfaces**
---
---- Set detailed description of package components
---
---[Open in browser](https://xmake.io/api/description/xpack-component-interfaces#set-description)
---
---@param description string Component description string
---@return nil
function set_description(description) end

---
---**Scoped: xpack-component-interfaces**
---
---- Set the default enabled state of package components
---
---[Open in browser](https://xmake.io/api/description/xpack-component-interfaces#set-default)
---
---@param default boolean Whether component is enabled by default (boolean)
---@return nil
function set_default(default) end

---
---**Scoped: xpack-component-interfaces**
---
---- Custom loading script
---
---[Open in browser](https://xmake.io/api/description/xpack-component-interfaces#on-load)
---
---@param script fun(target: any, ...: any) Load script function with component parameter
---@return nil
function on_load(script) end

---
---**Scoped: xpack-component-interfaces**
---
---- Add script before component installation
---
---[Open in browser](https://xmake.io/api/description/xpack-component-interfaces#before-installcmd)
---
---@param script fun(target: any, ...: any) Before install script function with component and batchcmds parameters
---@return nil
function before_installcmd(script) end

---
---**Scoped: xpack-component-interfaces**
---
---- Rewrite the installation script of the component
---
---[Open in browser](https://xmake.io/api/description/xpack-component-interfaces#on-installcmd)
---
---@param script fun(target: any, ...: any) Install script function with component and batchcmds parameters
---@return nil
function on_installcmd(script) end

---
---**Scoped: xpack-component-interfaces**
---
---- Add script after component installation
---
---[Open in browser](https://xmake.io/api/description/xpack-component-interfaces#after-installcmd)
---
---@param script fun(target: any, ...: any) After install script function with component and batchcmds parameters
---@return nil
function after_installcmd(script) end

---
---**Scoped: xpack-component-interfaces**
---
---- Add script before component uninstallation
---
---[Open in browser](https://xmake.io/api/description/xpack-component-interfaces#before-uninstallcmd)
---
---@param script fun(target: any, ...: any) Before uninstall script function with component and batchcmds parameters
---@return nil
function before_uninstallcmd(script) end

---
---**Scoped: xpack-component-interfaces**
---
---- Rewrite the script for component uninstallation
---
---[Open in browser](https://xmake.io/api/description/xpack-component-interfaces#on-uninstallcmd)
---
---@param script fun(target: any, ...: any) Uninstall script function with component and batchcmds parameters
---@return nil
function on_uninstallcmd(script) end

---
---**Scoped: xpack-component-interfaces**
---
---- Add script after component uninstallation
---
---[Open in browser](https://xmake.io/api/description/xpack-component-interfaces#after-uninstallcmd)
---
---@param script fun(target: any, ...: any) After uninstall script function with component and batchcmds parameters
---@return nil
function after_uninstallcmd(script) end

---
---**Scoped: xpack-component-interfaces**
---
---- Add component source file
---
---[Open in browser](https://xmake.io/api/description/xpack-component-interfaces#add-sourcefiles)
---
---@return nil
function add_sourcefiles() end

---
---**Scoped: xpack-component-interfaces**
---
---- Add component binary installation file
---
---[Open in browser](https://xmake.io/api/description/xpack-component-interfaces#add-installfiles)
---
---@return nil
function add_installfiles() end
