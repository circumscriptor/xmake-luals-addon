---@meta
---[tools](https://xmake.io/api/scripts/extension-modules/package/tools)

---@class Tools
local Tools = {}

---
---> Import: `import("package.tools.cmake")`
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/package/tools#cmake)
---
---@param package package Required. Package instance object
---@param configs table Required. CMake configuration parameter list
---@param opt table Optional. Option parameters, supports the following:<br>- `cxflags` - C/C++ compile flags<br>- `cflags` - C compile flags<br>- `packagedeps` - Package dependencies list
---@return any
function Tools:cmake(package, configs, opt) end

---
---> Import: `import("package.tools.autoconf")`
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/package/tools#autoconf)
---
---@param package package Required. Package instance object
---@param configs table Required. Configuration parameter list
---@param opt table Optional. Option parameters, supports the following:<br>- `packagedeps` - Package dependencies list
---@return any
function Tools:autoconf(package, configs, opt) end

---
---> Import: `import("package.tools.meson")`
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/package/tools#meson)
---
---@param package package Required. Package instance object
---@param configs table Required. Meson configuration parameter list
---@param opt table Optional. Option parameters, supports the following:<br>- `packagedeps` - Package dependencies list
---@return any
function Tools:meson(package, configs, opt) end

---
---> Import: `import("package.tools.make")`
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/package/tools#make)
---
---@param package package Required. Package instance object
---@param configs table Required. Configuration parameter list
---@param opt table Optional. Option parameters, supports the following:<br>- `packagedeps` - Package dependencies list
---@return any
function Tools:make(package, configs, opt) end

---
---> Import: `import("package.tools.ninja")`
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/package/tools#ninja)
---
---@param package package Required. Package instance object
---@param configs table Required. Configuration parameter list
---@param opt table Optional. Option parameters, supports the following:<br>- `packagedeps` - Package dependencies list
---@return any
function Tools:ninja(package, configs, opt) end

---
---> Import: `import("package.tools.msbuild")`
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/package/tools#msbuild)
---
---@param package package Required. Package instance object
---@param configs table Required. MSBuild configuration parameter list
---@param opt table Optional. Option parameters, supports the following:<br>- `packagedeps` - Package dependencies list
---@return any
function Tools:msbuild(package, configs, opt) end

---
---> Import: `import("package.tools.xmake")`
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/package/tools#xmake)
---
---@param package package Required. Package instance object
---@param opt table Optional. Option parameters
---@return any
function Tools:xmake(package, opt) end

---
---- [xmake-repo package scripts](https://github.com/xmake-io/xmake-repo)
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/package/tools#References)
---
---@return any
function Tools:References() end
