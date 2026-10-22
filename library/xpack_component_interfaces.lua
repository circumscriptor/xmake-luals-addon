---@meta
---[xpack_component_interfaces](https://xmake.io/api/description/xpack-component-interfaces)

---
---**Scoped: xpack-component-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-component-interfaces#set-title)
---
---@param title string Component title string
---@return nil
function set_title(title) end

---
---**Scoped: xpack-component-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-component-interfaces#set-description)
---
---@param description string Component description string
---@return nil
function set_description(description) end

---
---**Scoped: xpack-component-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-component-interfaces#set-default)
---
---@param is_default boolean Whether component is enabled by default (boolean)
---@return nil
function set_default(is_default) end

---
---**Scoped: xpack-component-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-component-interfaces#on-load)
---
---@param script fun(component: any) Load script function with component parameter
---@return nil
function on_load(script) end

---
---**Scoped: xpack-component-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-component-interfaces#before-installcmd)
---
---@param script fun(component: any, batchcmds: any) Before install script function with component and batchcmds parameters
---@return nil
function before_installcmd(script) end

---
---**Scoped: xpack-component-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-component-interfaces#on-installcmd)
---
---@param script fun(component: any, batchcmds: any) Install script function with component and batchcmds parameters
---@return nil
function on_installcmd(script) end

---
---**Scoped: xpack-component-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-component-interfaces#after-installcmd)
---
---@param script fun(component: any, batchcmds: any) After install script function with component and batchcmds parameters
---@return nil
function after_installcmd(script) end

---
---**Scoped: xpack-component-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-component-interfaces#before-uninstallcmd)
---
---@param script fun(component: any, batchcmds: any) Before uninstall script function with component and batchcmds parameters
---@return nil
function before_uninstallcmd(script) end

---
---**Scoped: xpack-component-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-component-interfaces#on-uninstallcmd)
---
---@param script fun(component: any, batchcmds: any) Uninstall script function with component and batchcmds parameters
---@return nil
function on_uninstallcmd(script) end

---
---**Scoped: xpack-component-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-component-interfaces#after-uninstallcmd)
---
---@param script fun(component: any, batchcmds: any) After uninstall script function with component and batchcmds parameters
---@return nil
function after_uninstallcmd(script) end

---
---**Scoped: xpack-component-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-component-interfaces#add-sourcefiles)
---
---@param files string|string[] Source file pattern string or array
---@param ... any Variable parameters, can pass multiple file patterns
---@param opt table? Options (-----------, prefixdir, rootdir)
---@return nil
function add_sourcefiles(files, ...) end

---
---**Scoped: xpack-component-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-component-interfaces#add-installfiles)
---
---@param files string|string[] Install file pattern string or array
---@param ... any Variable parameters, can pass multiple file patterns
---@param opt table? Options (-----------, prefixdir, rootdir)
---@return nil
function add_installfiles(files, ...) end
