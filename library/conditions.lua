---@meta
---[conditions](https://xmake.io/api/description/conditions)

---
---**Scoped: conditions**
---
---Is the current compilation target system
---
---[Open in browser](https://xmake.io/api/description/conditions#is-os)
---
---@param os string Operating system name string
---@param ... any Variable parameters, can pass multiple OS names
---@return nil
function is_os(os, ...) end

---
---**Scoped: conditions**
---
---Is the current compilation architecture
---
---[Open in browser](https://xmake.io/api/description/conditions#is-arch)
---
---@param arch Architecture Architecture name string
---@param ... any Variable parameters, can pass multiple architecture names
---@return nil
function is_arch(arch, ...) end

---
---**Scoped: conditions**
---
---Is the current compilation platform
---
---[Open in browser](https://xmake.io/api/description/conditions#is-plat)
---
---@param plat Platform Platform name string
---@param ... any Variable parameters, can pass multiple platform names
---@return nil
function is_plat(plat, ...) end

---
---**Scoped: conditions**
---
---Is the current compilation host system
---
---[Open in browser](https://xmake.io/api/description/conditions#is-host)
---
---@param host string Host system name string
---@param ... any Variable parameters, can pass multiple host names
---@return nil
function is_host(host, ...) end

---
---**Scoped: conditions**
---
---Determine the subsystem environment of the current host
---
---[Open in browser](https://xmake.io/api/description/conditions#is-subhost)
---
---@param subhost string Subsystem name string
---@param ... any Variable parameters, can pass multiple subsystem names
---@return nil
function is_subhost(subhost, ...) end

---
---**Scoped: conditions**
---
---Determine the architecture of the current host subsystem environment
---
---[Open in browser](https://xmake.io/api/description/conditions#is-subarch)
---
---@param subarch string Subsystem architecture name string
---@param ... any Variable parameters, can pass multiple subsystem architecture names
---@return nil
function is_subarch(subarch, ...) end

---
---**Scoped: conditions**
---
---Determines whether the current platform is cross-compiled or not.
---
---[Open in browser](https://xmake.io/api/description/conditions#is-cross)
---
---@return nil
function is_cross() end

---
---**Scoped: conditions**
---
---Is the current compilation mode
---
---[Open in browser](https://xmake.io/api/description/conditions#is-mode)
---
---@param mode StripMode Compilation mode name string
---@param ... any Variable parameters, can pass multiple mode names
---@return nil
function is_mode(mode, ...) end

---
---**Scoped: conditions**
---
---Is the current target kind
---
---[Open in browser](https://xmake.io/api/description/conditions#is-kind)
---
---@param kind TargetKind Target kind name string
---@param ... any Variable parameters, can pass multiple kind names
---@return nil
function is_kind(kind, ...) end

---
---**Scoped: conditions**
---
---Is the given config values?
---
---[Open in browser](https://xmake.io/api/description/conditions#is-config)
---
---@param name string Configuration option name string
---@param values string Configuration value string
---@param ... any Variable parameters, can pass multiple values
---@return nil
function is_config(name, values, ...) end

---
---**Scoped: conditions**
---
---Is the given configs enabled?
---
---[Open in browser](https://xmake.io/api/description/conditions#has-config)
---
---@param configs string Configuration name string
---@param ... any Variable parameters, can pass multiple configuration names
---@return nil
function has_config(configs, ...) end

---
---**Scoped: conditions**
---
---Is the given dependent package enabled?
---
---[Open in browser](https://xmake.io/api/description/conditions#has-package)
---
---@param packages string Package name string
---@param ... any Variable parameters, can pass multiple package names
---@return nil
function has_package(packages, ...) end
