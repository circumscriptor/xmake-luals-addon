---@meta
---[target_instance](https://xmake.io/api/scripts/target-instance)

---@class Target
local Target = {}

---
---- Get the name of the target
---
---[Open in browser](https://xmake.io/api/scripts/target-instance#target-name)
---
---@return string
function Target:name() end

---
---- Get the values of the target by name
---
---[Open in browser](https://xmake.io/api/scripts/target-instance#target-get)
---
---@param key string Configuration key name
---@return any
function Target:get(key) end

---
---- Set the values of the target by name
---
---[Open in browser](https://xmake.io/api/scripts/target-instance#target-set)
---
---@param key string Configuration key name
---@param value any Configuration value
---@return nil
function Target:set(key, value) end

---
---- Add to the values of the target by name
---
---[Open in browser](https://xmake.io/api/scripts/target-instance#target-add)
---
---@param key string Configuration key name
---@param value any Value to add
---@return nil
function Target:add(key, value) end

---
---- Get the target program type
---
---[Open in browser](https://xmake.io/api/scripts/target-instance#target-kind)
---
---@return string
function Target:kind() end

---
---- Whether the current platform is one of the given platforms
---
---[Open in browser](https://xmake.io/api/scripts/target-instance#target-is-plat)
---
---@param plat Platform Platform name
---@return boolean
function Target:is_plat(plat) end

---
---- Is the current architecture one of the given architectures
---
---[Open in browser](https://xmake.io/api/scripts/target-instance#target-is-arch)
---
---@param arch Architecture Architecture name
---@return boolean
function Target:is_arch(arch) end

---
---- Is the current architecture a 64-bit one
---
---[Open in browser](https://xmake.io/api/scripts/target-instance#target-is-arch64)
---
---@return boolean
function Target:is_arch64() end

---
---- Get the target file path
---
---[Open in browser](https://xmake.io/api/scripts/target-instance#target-targetfile)
---
---@return string
function Target:targetfile() end

---
---- Get the artifact file of the target
---
---[Open in browser](https://xmake.io/api/scripts/target-instance#target-artifactfile)
---
---@param kind TargetKind Target kind
---@return string
function Target:artifactfile(kind) end

---
---- Get the output directory of the target file
---
---[Open in browser](https://xmake.io/api/scripts/target-instance#target-targetdir)
---
---@return string
function Target:targetdir() end

---
---- Get the base name of the target file
---
---[Open in browser](https://xmake.io/api/scripts/target-instance#target-basename)
---
---@return string
function Target:basename() end

---
---- Get the target file name
---
---[Open in browser](https://xmake.io/api/scripts/target-instance#target-filename)
---
---@return string
function Target:filename() end

---
---- Get the symbol file path of the target
---
---[Open in browser](https://xmake.io/api/scripts/target-instance#target-symbolfile)
---
---@return string
function Target:symbolfile() end

---
---- Get the installation directory of the target file
---
---[Open in browser](https://xmake.io/api/scripts/target-instance#target-installdir)
---
---@return string
function Target:installdir() end

---
---- Get auto-generated catalog
---
---[Open in browser](https://xmake.io/api/scripts/target-instance#target-autogendir)
---
---@return string
function Target:autogendir() end

---
---- Get the object file path
---
---[Open in browser](https://xmake.io/api/scripts/target-instance#target-objectfile)
---
---@param sourcefile string Source file path
---@return string
function Target:objectfile(sourcefile) end

---
---- Get all source files
---
---[Open in browser](https://xmake.io/api/scripts/target-instance#target-sourcebatches)
---
---@return table
function Target:sourcebatches() end

---
---- Get a list of all object files
---
---[Open in browser](https://xmake.io/api/scripts/target-instance#target-objectfiles)
---
---@return string[]
function Target:objectfiles() end

---
---- Get a list of all header files
---
---[Open in browser](https://xmake.io/api/scripts/target-instance#target-headerfiles)
---
---@return string[]
function Target:headerfiles() end

---
---- Get the xmake.lua directory where the target definition is located
---
---[Open in browser](https://xmake.io/api/scripts/target-instance#target-scriptdir)
---
---@return string
function Target:scriptdir() end

---
---- Check whether the target compilation configuration can obtain the given C++ function
---
---[Open in browser](https://xmake.io/api/scripts/target-instance#target-has-cxxfuncs)
---
---@param funcs string|table Function name or function name list
---@return boolean
function Target:has_cxxfuncs(funcs) end

---
---- Check whether the target compilation configuration can obtain the given C type
---
---[Open in browser](https://xmake.io/api/scripts/target-instance#target-has-ctypes)
---
---@param types string|table Type name or type name list
---@return boolean
function Target:has_ctypes(types) end

---
---- Check whether the target compilation configuration can get the given C++ type
---
---[Open in browser](https://xmake.io/api/scripts/target-instance#target-has-cxxtypes)
---
---@param types string|table Type name or type name list
---@return boolean
function Target:has_cxxtypes(types) end

---
---- Check whether the target compilation configuration can obtain the given C compilation flags
---
---[Open in browser](https://xmake.io/api/scripts/target-instance#target-has-cflags)
---
---@param flags string|table Compilation flags or flag list
---@return boolean
function Target:has_cflags(flags) end

---
---- Check whether the target compilation configuration can obtain the given C++ compilation flags
---
---[Open in browser](https://xmake.io/api/scripts/target-instance#target-has-cxxflags)
---
---@param flags string|table Compilation flags or flag list
---@return boolean
function Target:has_cxxflags(flags) end

---
---- Check whether the target compilation configuration can obtain the given C header file
---
---[Open in browser](https://xmake.io/api/scripts/target-instance#target-has-cincludes)
---
---@param includes string|table Include file or include file list
---@return boolean
function Target:has_cincludes(includes) end

---
---- Check whether the target compilation configuration can obtain the given C++ header file
---
---[Open in browser](https://xmake.io/api/scripts/target-instance#target-has-cxxincludes)
---
---@param includes string|table Include file or include file list
---@return boolean
function Target:has_cxxincludes(includes) end

---
---- Detect whether a given piece of C code can be compiled and linked
---
---[Open in browser](https://xmake.io/api/scripts/target-instance#target-check-csnippets)
---
---@param snippets string|table Code snippet or code snippet list
---@return boolean
function Target:check_csnippets(snippets) end

---
---- Detect if a given piece of C++ code can be compiled and linked
---
---[Open in browser](https://xmake.io/api/scripts/target-instance#target-check-cxxsnippets)
---
---@param snippets string|table Code snippet or code snippet list
---@return boolean
function Target:check_cxxsnippets(snippets) end

---
---- Detect type size
---
---[Open in browser](https://xmake.io/api/scripts/target-instance#target-check-sizeof)
---
---@param types string|table Type name or type name list
---@return number|nil
function Target:check_sizeof(types) end

---
---- Detect if specified C/C++ compiler feature
---
---[Open in browser](https://xmake.io/api/scripts/target-instance#target-has-features)
---
---@param features string|table Feature name or feature name list
---@return boolean
function Target:has_features(features) end
