---@meta
---[path](https://xmake.io/api/scripts/builtin-modules/path)

---@class Path
path = {}

---
---**Scoped: path**
---
---- Create a new path instance
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/path#path.new)
---
---@param p string Required. Path string
---@param transform? fun(target: any, ...: any) Optional. Path transformation function
---@return any
function path.new(p, transform) end

---
---**Scoped: path**
---
---- Normalize the path
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/path#path.normalize)
---
---@param p string Required. Path string
---@return any
function path.normalize(p) end

---
---**Scoped: path**
---
---- Stitching path
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/path#path.join)
---
---@param paths string|string[] Path string or array
---@param ... any Variable arguments, can pass multiple path strings
---@return any
function path.join(paths, ...) end

---
---**Scoped: path**
---
---- Convert path to the path style of the current platform
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/path#path.translate)
---
---@param path string Path string to convert
---@return any
function path.translate(path) end

---
---**Scoped: path**
---
---- Get the file name with no suffix at the end of the path
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/path#path.basename)
---
---@param path string Path string
---@return string
function path.basename(path) end

---
---**Scoped: path**
---
---- Get the file name with the last suffix of the path
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/path#path.filename)
---
---@param path string Path string
---@return string
function path.filename(path) end

---
---**Scoped: path**
---
---- Get the suffix of the path
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/path#path.extension)
---
---@param path string Path string
---@param level? number Optional. Extension level, default is 1
---@return any
function path.extension(path, level) end

---
---**Scoped: path**
---
---- Get the directory name of the path
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/path#path.directory)
---
---@param path string Path string
---@return any
function path.directory(path) end

---
---**Scoped: path**
---
---- Convert to relative path
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/path#path.relative)
---
---@param path string Path string to convert
---@param rootdir string Root directory for relative conversion
---@return any
function path.relative(path, rootdir) end

---
---**Scoped: path**
---
---- Convert to absolute path
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/path#path.absolute)
---
---@param path string Path string to convert
---@param rootdir string Root directory for absolute conversion
---@return any
function path.absolute(path, rootdir) end

---
---**Scoped: path**
---
---- Determine if it is an absolute path
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/path#path.is-absolute)
---
---@param path string Path string to check
---@return boolean
function path.is_absolute(path) end

---
---**Scoped: path**
---
---- Split the path by the separator
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/path#path.split)
---
---@param path string Path string to split
---@return any
function path.split(path) end

---
---**Scoped: path**
---
---- Get the path separator of the current platform
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/path#path.sep)
---
---@return any
function path.sep() end

---
---**Scoped: path**
---
---- Get if the last character is a separator
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/path#path.islastsep)
---
---@param path string Path string to check
---@return any
function path.islastsep(path) end

---
---**Scoped: path**
---
---- Split an environment variable value into an array of paths
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/path#path.splitenv)
---
---@param envpath string Environment variable path string
---@return any
function path.splitenv(envpath) end

---
---**Scoped: path**
---
---- Join path array into an environment variable string
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/path#path.joinenv)
---
---@param paths array Array of path strings
---@return any
function path.joinenv(paths) end

---
---**Scoped: path**
---
---- Get the environment variable path separator of the current platform
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/path#path.envsep)
---
---@return any
function path.envsep() end

---
---**Scoped: path**
---
---- Convert path pattern to lua pattern
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/path#path.pattern)
---
---@param path string Path string to convert
---@return any
function path.pattern(path) end

---
---**Scoped: path**
---
---- Convert path to Unix style
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/path#path.unix)
---
---@param path string Path string
---@return any
function path.unix(path) end

---
---**Scoped: path**
---
---- Convert path to Cygwin style
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/path#path.cygwin)
---
---@param path string Path string
---@return any
function path.cygwin(path) end

---
---**Scoped: path**
---
---- Check if a value is a path instance
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/path#path.instance-of)
---
---@param p any The value to check
---@return any
function path.instance_of(p) end
