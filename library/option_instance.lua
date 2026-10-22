---@meta
---[option_instance](https://xmake.io/api/scripts/option-instance)

---@class Option
local Option = {}

---
---- Get the name of the option (without namespace)
---
---[Open in browser](https://xmake.io/api/scripts/option-instance#option-name)
---
---@return string
function Option:name() end

---
---- Get the full name of the option (with namespace)
---
---[Open in browser](https://xmake.io/api/scripts/option-instance#option-fullname)
---
---@return any
function Option:fullname() end

---
---- Get the namespace of the option
---
---[Open in browser](https://xmake.io/api/scripts/option-instance#option-namespace)
---
---@return any
function Option:namespace() end

---
---- Get the description of the option
---
---[Open in browser](https://xmake.io/api/scripts/option-instance#option-description)
---
---@return any
function Option:description() end

---
---- Get the current value of the option
---
---[Open in browser](https://xmake.io/api/scripts/option-instance#option-value)
---
---@return any
function Option:value() end

---
---- Check if the option is enabled
---
---[Open in browser](https://xmake.io/api/scripts/option-instance#option-enabled)
---
---@return any
function Option:enabled() end

---
---- Enable or disable the option
---
---[Open in browser](https://xmake.io/api/scripts/option-instance#option-enable)
---
---@param enable boolean Whether to enable
---@return any
function Option:enable(enable) end

---
---- Set the value of the option
---
---[Open in browser](https://xmake.io/api/scripts/option-instance#option-set-value)
---
---@param value any Option value
---@return nil
function Option:set_value(value) end

---
---- Clear the option status, need to recheck
---
---[Open in browser](https://xmake.io/api/scripts/option-instance#option-clear)
---
---@return any
function Option:clear() end

---
---- Get the configuration values of the option in the description scope
---
---[Open in browser](https://xmake.io/api/scripts/option-instance#option-get)
---
---@param key string Configuration key name
---@return any
function Option:get(key) end

---
---- Set the configuration values of the option
---
---[Open in browser](https://xmake.io/api/scripts/option-instance#option-set)
---
---@param key string Configuration key name
---@param value any Configuration value
---@return nil
function Option:set(key, value) end

---
---- Add values to the option by name
---
---[Open in browser](https://xmake.io/api/scripts/option-instance#option-add)
---
---@param key string Configuration key name
---@param value any Value to add
---@return nil
function Option:add(key, value) end

---
---- Remove specified values from the option
---
---[Open in browser](https://xmake.io/api/scripts/option-instance#option-remove)
---
---@param key string Configuration key name
---@param value any Value to remove
---@return nil
function Option:remove(key, value) end

---
---- Get all dependencies of the option
---
---[Open in browser](https://xmake.io/api/scripts/option-instance#option-deps)
---
---@return table
function Option:deps() end

---
---- Get the specified dependent option
---
---[Open in browser](https://xmake.io/api/scripts/option-instance#option-dep)
---
---@param name string Dependency name
---@return any
function Option:dep(name) end

---
---- Get the ordered dependencies of the option
---
---[Open in browser](https://xmake.io/api/scripts/option-instance#option-orderdeps)
---
---@return any
function Option:orderdeps() end

---
---- Get extra configuration information
---
---[Open in browser](https://xmake.io/api/scripts/option-instance#option-extraconf)
---
---@param name string Configuration name
---@param key string Configuration key
---@return any
function Option:extraconf(name, key) end
