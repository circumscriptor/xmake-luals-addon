---@meta
---[global_interfaces](https://xmake.io/api/description/global-interfaces)

---
---**Scoped: global-interfaces**
---
---Add sub-project files and directories
---
---[Open in browser](https://xmake.io/api/description/global-interfaces#includes)
---
---@param paths string|string[] Sub-project file or directory path, supports pattern matching like "**/xmake.lua"
---@param ... string|RootDirOption Variable parameters, can pass multiple paths
---@return nil
function includes(paths, ...) end

---
---**Scoped: global-interfaces**
---
---Set project name
---
---[Open in browser](https://xmake.io/api/description/global-interfaces#set-project)
---
---@param name string Project name string
---@return nil
function set_project(name) end

---
---**Scoped: global-interfaces**
---
---Set project version
---
---[Open in browser](https://xmake.io/api/description/global-interfaces#set-version)
---
---@param version string Project version string, e.g. "1.5.1"
---@param opt? VersionOption Configuration options
---@return nil
function set_version(version, opt) end

---
---**Scoped: global-interfaces**
---
---Set minimal xmake version
---
---[Open in browser](https://xmake.io/api/description/global-interfaces#set-xmakever)
---
---@param version string Minimum required xmake version string, e.g. "2.1.0"
---@return nil
function set_xmakever(version) end

---
---**Scoped: global-interfaces**
---
---Add module directories
---
---[Open in browser](https://xmake.io/api/description/global-interfaces#add-moduledirs)
---
---@param dirs string|string[] Module directory path string or array
---@param ... any Variable parameters, can pass multiple directory paths
---@return nil
function add_moduledirs(dirs, ...) end

---
---**Scoped: global-interfaces**
---
---Add plugin directories
---
---[Open in browser](https://xmake.io/api/description/global-interfaces#add-plugindirs)
---
---@param dirs string|string[] Plugin directory path string or array
---@param ... any Variable parameters, can pass multiple directory paths
---@return nil
function add_plugindirs(dirs, ...) end

---
---**Scoped: global-interfaces**
---
---Get the configuration value
---
---[Open in browser](https://xmake.io/api/description/global-interfaces#get-config)
---
---@param name string Configuration option name string
---@return nil
function get_config(name) end

---
---**Scoped: global-interfaces**
---
---Set the default configuration value
---
---[Open in browser](https://xmake.io/api/description/global-interfaces#set-config)
---
---@param name string Configuration option name string
---@param value string|boolean|number Configuration value, can be string, boolean, or number
---@return nil
function set_config(name, value) end

---
---**Scoped: global-interfaces**
---
---Add the required addons
---
---[Open in browser](https://xmake.io/api/description/global-interfaces#add-addons)
---
---@param addons string|string[] Addon name string or array, supports semantic version like "esp32-devel 1.0.x"
---@param ... any Variable parameters, can pass multiple addon names
---@return nil
function add_addons(addons, ...) end

---
---**Scoped: global-interfaces**
---
---Add the required dependency packages
---
---[Open in browser](https://xmake.io/api/description/global-interfaces#add-requires)
---
---@param packages string|string[] Package name string or array, supports semantic version like "tbox 1.6.*"
---@param ... string|PackageRequireOption Other package-specific configuration parameters
---@return nil
function add_requires(packages, ...) end

---
---**Scoped: global-interfaces**
---
---Set the configuration of the specified dependent package
---
---[Open in browser](https://xmake.io/api/description/global-interfaces#add-requireconfs)
---
---@param packages string|string[] Package name string or array, supports pattern matching like "*" or "libpng.zlib"
---@param ... string|RequireConfOption Other package-specific configuration parameters
---@return nil
function add_requireconfs(packages, ...) end

---
---**Scoped: global-interfaces**
---
---Add 3rd package repositories
---
---[Open in browser](https://xmake.io/api/description/global-interfaces#add-repositories)
---
---@param repos string|string[] Repository name and URL string or array, format: "name url"
---@param ... string|RootDirOption Variable parameters, can pass multiple repositories
---@return nil
function add_repositories(repos, ...) end

---
---**Scoped: global-interfaces**
---
---Set the default compilation platform
---
---[Open in browser](https://xmake.io/api/description/global-interfaces#set-defaultplat)
---
---@param platform Platform Default compilation platform name, e.g. "iphoneos", "windows"
---@return nil
function set_defaultplat(platform) end

---
---**Scoped: global-interfaces**
---
---Set the default compilation architecture
---
---[Open in browser](https://xmake.io/api/description/global-interfaces#set-defaultarchs)
---
---@param archs string|string[] Default compilation architecture string or array, supports platform-specific format like "iphoneos
---@param ... any Variable parameters, can pass multiple architecture specifications
---@return nil
function set_defaultarchs(archs, ...) end

---
---**Scoped: global-interfaces**
---
---Set the default compilation mode
---
---[Open in browser](https://xmake.io/api/description/global-interfaces#set-defaultmode)
---
---@param mode StripMode Default compilation mode name, e.g. "release", "debug", "releasedbg"
---@return nil
function set_defaultmode(mode) end

---
---**Scoped: global-interfaces**
---
---Set the list of platforms allowed to compile
---
---[Open in browser](https://xmake.io/api/description/global-interfaces#set-allowedplats)
---
---@param platforms string|string[] Allowed compilation platform name string or array
---@param ... any Variable parameters, can pass multiple platform names
---@return nil
function set_allowedplats(platforms, ...) end

---
---**Scoped: global-interfaces**
---
---Set the platform architecture that allows compilation
---
---[Open in browser](https://xmake.io/api/description/global-interfaces#set-allowedarchs)
---
---@param archs string|string[] Allowed compilation architecture string or array, supports platform-specific format like "windows
---@param ... any Variable parameters, can pass multiple architecture specifications
---@return nil
function set_allowedarchs(archs, ...) end

---
---**Scoped: global-interfaces**
---
---Set the list of allowed compilation modes
---
---[Open in browser](https://xmake.io/api/description/global-interfaces#set-allowedmodes)
---
---@param modes string|string[] Allowed compilation mode name string or array
---@param ... any Variable parameters, can pass multiple mode names
---@return nil
function set_allowedmodes(modes, ...) end

---
---**Scoped: global-interfaces**
---
---Enter namespace
---
---[Open in browser](https://xmake.io/api/description/global-interfaces#namespace)
---
---@param name string Namespace name string
---@param script fun(target: any, ...: any) Namespace script function
---@return nil
function namespace(name, script) end

---
---**Scoped: global-interfaces**
---
---End namespace
---
---[Open in browser](https://xmake.io/api/description/global-interfaces#namespace-end)
---
---@return nil
function namespace_end() end
