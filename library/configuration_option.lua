---@meta
---[configuration_option](https://xmake.io/api/description/configuration-option)

---
---**Scoped: option**
---
---Defining options
---
---[Open in browser](https://xmake.io/api/description/configuration-option#option)
---
---@param name string Option name string
---@param opt? OptionAttr|fun() Configuration options
---@return nil
function option(name, opt) end

---
---**Scoped: option**
---
---End definition option
---
---[Open in browser](https://xmake.io/api/description/configuration-option#option-end)
---
---@return nil
function option_end() end

---
---**Scoped: option**
---
---Adding options depends
---
---[Open in browser](https://xmake.io/api/description/configuration-option#add-deps)
---
---@param deps string|string[] Dependency option name string or array
---@param ... any Variable parameters, can pass multiple dependency names
---@return nil
function add_deps(deps, ...) end

---
---**Scoped: option**
---
---Execute this script before option detection
---
---[Open in browser](https://xmake.io/api/description/configuration-option#before-check)
---
---@param script fun(target: any, ...: any) Before check script function with option parameter
---@return nil
function before_check(script) end

---
---**Scoped: option**
---
---Custom Option Detection Script
---
---[Open in browser](https://xmake.io/api/description/configuration-option#on-check)
---
---@param script fun(target: any, ...: any) Check script function with option parameter
---@return nil
function on_check(script) end

---
---**Scoped: option**
---
---Execute this script after option detection
---
---[Open in browser](https://xmake.io/api/description/configuration-option#after-check)
---
---@param script fun(target: any, ...: any) After check script function with option parameter
---@return nil
function after_check(script) end

---
---**Scoped: option**
---
---Setting the list of option values
---
---[Open in browser](https://xmake.io/api/description/configuration-option#set-values)
---
---@param values string|string[] Option value string or array
---@param ... any Variable parameters, can pass multiple values
---@return nil
function set_values(values, ...) end

---
---**Scoped: option**
---
---Setting options defaults
---
---[Open in browser](https://xmake.io/api/description/configuration-option#set-default)
---
---@param value string|boolean|number Default value (string, boolean, or number)
---@return nil
function set_default(value) end

---
---**Scoped: option**
---
---Set whether to enable menu display
---
---[Open in browser](https://xmake.io/api/description/configuration-option#set-showmenu)
---
---@param showmenu boolean Whether to show in menu (boolean)
---@return nil
function set_showmenu(showmenu) end

---
---**Scoped: option**
---
---Setting option categories, only for menu display
---
---[Open in browser](https://xmake.io/api/description/configuration-option#set-category)
---
---@param category string Category name string
---@return nil
function set_category(category) end

---
---**Scoped: option**
---
---Setting menu display description
---
---[Open in browser](https://xmake.io/api/description/configuration-option#set-description)
---
---@param description string|string[] Description string or array
---@param ... any Variable parameters, can pass multiple description lines
---@return nil
function set_description(description, ...) end

---
---**Scoped: option**
---
---Add Link Library Detection
---
---[Open in browser](https://xmake.io/api/description/configuration-option#add-links)
---
---@param links string|string[] Library name string or array
---@param ... any Variable parameters, can pass multiple library names
---@return nil
function add_links(links, ...) end

---
---**Scoped: option**
---
---Adding the search directory needed for link library detection
---
---[Open in browser](https://xmake.io/api/description/configuration-option#add-linkdirs)
---
---@param linkdirs string|string[] Link directory path string or array
---@param ... any Variable parameters, can pass multiple directory paths
---@return nil
function add_linkdirs(linkdirs, ...) end

---
---**Scoped: option**
---
---Adding a load search directory for a dynamic library at runtime
---
---[Open in browser](https://xmake.io/api/description/configuration-option#add-rpathdirs)
---
---@param rpathdirs string|string[] RPATH directory path string or array
---@param ... any Variable parameters, can pass multiple directory paths
---@return nil
function add_rpathdirs(rpathdirs, ...) end

---
---**Scoped: option**
---
---Add c header file detection
---
---[Open in browser](https://xmake.io/api/description/configuration-option#add-cincludes)
---
---@param includes string|string[] Header file name string or array
---@param ... any Variable parameters, can pass multiple header file names
---@return nil
function add_cincludes(includes, ...) end

---
---**Scoped: option**
---
---Add c++ header file detection
---
---[Open in browser](https://xmake.io/api/description/configuration-option#add-cxxincludes)
---
---@param includes string|string[] C++ header file name string or array
---@param ... any Variable parameters, can pass multiple header file names
---@return nil
function add_cxxincludes(includes, ...) end

---
---**Scoped: option**
---
---Add c type detection
---
---[Open in browser](https://xmake.io/api/description/configuration-option#add-ctypes)
---
---@param types string|string[] C type name string or array
---@param ... any Variable parameters, can pass multiple type names
---@return nil
function add_ctypes(types, ...) end

---
---**Scoped: option**
---
---Adding c++ type detection
---
---[Open in browser](https://xmake.io/api/description/configuration-option#add-cxxtypes)
---
---@param types string|string[] C++ type name string or array
---@param ... any Variable parameters, can pass multiple type names
---@return nil
function add_cxxtypes(types, ...) end

---
---**Scoped: option**
---
---Add c code fragment detection
---
---[Open in browser](https://xmake.io/api/description/configuration-option#add-csnippets)
---
---@param name string Code snippet name string
---@param code string C code fragment string
---@param opt? SnippetOption Configuration options
---@return nil
function add_csnippets(name, code, opt) end

---
---**Scoped: option**
---
---Adding c++ code snippet detection
---
---[Open in browser](https://xmake.io/api/description/configuration-option#add-cxxsnippets)
---
---@param name string Code snippet name string
---@param code string C++ code fragment string
---@param opt? SnippetOption Configuration options
---@return nil
function add_cxxsnippets(name, code, opt) end

---
---**Scoped: option**
---
---Add c library function detection
---
---[Open in browser](https://xmake.io/api/description/configuration-option#add-cfuncs)
---
---@param funcs string|string[] C function name string or array
---@param ... any Variable parameters, can pass multiple function names
---@return nil
function add_cfuncs(funcs, ...) end

---
---**Scoped: option**
---
---Add c++ library function detection
---
---[Open in browser](https://xmake.io/api/description/configuration-option#add-cxxfuncs)
---
---@param funcs string|string[] C++ function name string or array
---@param ... any Variable parameters, can pass multiple function names
---@return nil
function add_cxxfuncs(funcs, ...) end
