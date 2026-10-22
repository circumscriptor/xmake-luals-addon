---@meta
---[package_instance](https://xmake.io/api/scripts/package-instance)

---@class Package
local Package = {}

---
---- Get the name of the package
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-name)
---
---@return string
function Package:name() end

---
---- Get the values of the package by name
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-get)
---
---@param key string Configuration key name
---@return any
function Package:get(key) end

---
---- Set the values of the package by name
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-set)
---
---@param key string Configuration key name
---@param value any Configuration value
---@return nil
function Package:set(key, value) end

---
---- Add to the values of the package by name
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-add)
---
---@param key string Configuration key name
---@param value any Value to add
---@return nil
function Package:add(key, value) end

---
---- Get the license of the package
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-license)
---
---@return any
function Package:license() end

---
---- Get the description of the package
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-description)
---
---@return any
function Package:description() end

---
---- Get the platform of the package. Can be any of:
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-plat)
---
---@return string
function Package:plat() end

---
---- Get the architecture of the package (e.g. x86, x64, x86_64)
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-arch)
---
---@return string
function Package:arch() end

---
---- Get the targeted OS of the package.
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-targetos)
---
---@return any
function Package:targetos() end

---
---- Get the targeted architecture of the package.
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-targetarch)
---
---@return any
function Package:targetarch() end

---
---- Wether the current platform is one of the given platforms
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-is-plat)
---
---@param plat Platform Platform name
---@return boolean
function Package:is_plat(plat) end

---
---- Wether the current platform is one of the given platforms
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-is-arch)
---
---@param arch Architecture Architecture name
---@return boolean
function Package:is_arch(arch) end

---
---- Wether the currently targeted OS is one of the given OS
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-is-targetos)
---
---@return boolean
function Package:is_targetos() end

---
---- Wether the currently targeted architecture is one of the given architectures
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-is-targetarch)
---
---@return boolean
function Package:is_targetarch() end

---
---- Get the alias of the package
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-alias)
---
---@return any
function Package:alias() end

---
---- Get the URLs of the package
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-urls)
---
---@return any
function Package:urls() end

---
---- Get a dependency of the package by name. The name needs to be a dependency of the package.
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-dep)
---
---@param name string Dependency name
---@return any
function Package:dep(name) end

---
---- Get all dependencies of the package
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-deps)
---
---@return table
function Package:deps() end

---
---- Get the sha256 checksum of an URL alias
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-sourcehash)
---
---@return any
function Package:sourcehash() end

---
---- Get the kind of the package. Can be any of:
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-kind)
---
---@return string
function Package:kind() end

---
---- Wether the package is of kind binary
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-is-binary)
---
---@return boolean
function Package:is_binary() end

---
---- Wether the package is of kind toolchain
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-is-toolchain)
---
---@return boolean
function Package:is_toolchain() end

---
---- Wether the package is of kind library
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-is-library)
---
---@return boolean
function Package:is_library() end

---
---- Wether the package is directly required by the user (e.g. xmake.lua)
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-is-toplevel)
---
---@return boolean
function Package:is_toplevel() end

---
---- Wether the package is provided by a thirdparty package manager (e.g. brew, conan, vcpkg)
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-is-thirdparty)
---
---@return boolean
function Package:is_thirdparty() end

---
---- Wether the package is build with debug mode (Same as `package:config("debug")`)
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-is-debug)
---
---@return boolean
function Package:is_debug() end

---
---- Wether the package is supported by the current platform and architecture
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-is-supported)
---
---@return boolean
function Package:is_supported() end

---
---- Wether the the package gets built with debug mode
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-debug)
---
---@return any
function Package:debug() end

---
---- Wether the package is getting cross-compiled
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-is-cross)
---
---@return boolean
function Package:is_cross() end

---
---- Get the cache directory of the package
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-cachedir)
---
---@return string
function Package:cachedir() end

---
---- Get the installation directory of the package. Can also be used to get a subdirectory. If the given directory tree does not exist it will be created.
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-installdir)
---
---@return string
function Package:installdir() end

---
---- Get the directory where the xmake.lua of the package lies
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-scriptdir)
---
---@return string
function Package:scriptdir() end

---
---- Get the exported environment variables of the package
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-envs)
---
---@return any
function Package:envs() end

---
---- Get the given environment variable
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-getenv)
---
---@return any
function Package:getenv() end

---
---- Set the given environment variable. Overwrites the variable
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-setenv)
---
---@return any
function Package:setenv() end

---
---- Add the given values to the environment variable
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-addenv)
---
---@return any
function Package:addenv() end

---
---- Get the scheme instance by name
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-scheme)
---
---@param name string Scheme name
---@return any
function Package:scheme(name) end

---
---- Get the currently selected scheme
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-current-scheme)
---
---@return any
function Package:current_scheme() end

---
---- Get all version strings of the package. Returns a table containing all versions as strings
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-versions)
---
---@return any
function Package:versions() end

---
---- Get the version of the package
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-version)
---
---@return string
function Package:version() end

---
---- Get the version of the package as string
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-version-str)
---
---@return any
function Package:version_str() end

---
---- Get the given configuration value of the package
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-config)
---
---@return any
function Package:config() end

---
---- Set the given configuration value of the package
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-config-set)
---
---@return any
function Package:config_set() end

---
---- Get all configurations of the package
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-configs)
---
---@return any
function Package:configs() end

---
---- Get the build hash of the package
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-buildhash)
---
---@return any
function Package:buildhash() end

---
---- Get all patches of the current version
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-patches)
---
---@return any
function Package:patches() end

---
---- Wether the package has the given C functions
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-has-cfuncs)
---
---@return boolean
function Package:has_cfuncs() end

---
---- Wether the package has the given C++ functions
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-has-cxxfuncs)
---
---@param funcs string|table Function name or function name list
---@return boolean
function Package:has_cxxfuncs(funcs) end

---
---- Wether the package has the given C types
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-has-ctypes)
---
---@param types string|table Type name or type name list
---@return boolean
function Package:has_ctypes(types) end

---
---- Wether the package has the given C++ types
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-has-cxxtypes)
---
---@param types string|table Type name or type name list
---@return boolean
function Package:has_cxxtypes(types) end

---
---- Wether the package has the given C header files
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-has-cincludes)
---
---@param includes string|table Include file or include file list
---@return boolean
function Package:has_cincludes(includes) end

---
---- Wether the package has the given C++ header files
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-has-cxxincludes)
---
---@param includes string|table Include file or include file list
---@return boolean
function Package:has_cxxincludes(includes) end

---
---- Wether the given C snippet can be compiled and linked
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-check-csnippets)
---
---@param snippets string|table Code snippet or code snippet list
---@return boolean
function Package:check_csnippets(snippets) end

---
---- Wether the given C++ snippet can be compiled and linked
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-check-cxxsnippets)
---
---@param snippets string|table Code snippet or code snippet list
---@return boolean
function Package:check_cxxsnippets(snippets) end

---
---- Wether the given Fortran snippet can be compiled and linked
---
---[Open in browser](https://xmake.io/api/scripts/package-instance#package-check-fcsnippets)
---
---@return boolean
function Package:check_fcsnippets() end
