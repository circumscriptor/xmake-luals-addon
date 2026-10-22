---@meta
---[custom_toolchain](https://xmake.io/api/description/custom-toolchain)

---
---**Scoped: toolchain**
---
---- Define toolchain
---
---[Open in browser](https://xmake.io/api/description/custom-toolchain#toolchain)
---
---@param name string Toolchain name string
---@param opt? ToolchainAttr|fun() Configuration options
---@return nil
function toolchain(name, opt) end

---
---**Scoped: toolchain**
---
---- Set toolchain type
---
---[Open in browser](https://xmake.io/api/description/custom-toolchain#set-kind)
---
---@param kind TargetKind Toolchain type: "standalone"
---@return nil
function set_kind(kind) end

---
---**Scoped: toolchain**
---
---- Set Tool Set
---
---[Open in browser](https://xmake.io/api/description/custom-toolchain#set-toolset)
---
---@param tool string Tool name string (cc, cxx, ld, sh, ar, ex, strip, mm, mxx, as)
---@param tools string|string[] Tool program name string or array
---@param ... any Variable parameters, can pass multiple tool names
---@return nil
function set_toolset(tool, tools, ...) end

---
---**Scoped: toolchain**
---
---- Set toolchain sdk directory path
---
---[Open in browser](https://xmake.io/api/description/custom-toolchain#set-sdkdir)
---
---@param sdkdir string SDK directory path string
---@return nil
function set_sdkdir(sdkdir) end

---
---**Scoped: toolchain**
---
---- Set toolchain bin directory path
---
---[Open in browser](https://xmake.io/api/description/custom-toolchain#set-bindir)
---
---@param bindir string Binary directory path string
---@return nil
function set_bindir(bindir) end

---
---**Scoped: toolchain**
---
---- Detection toolchain
---
---[Open in browser](https://xmake.io/api/description/custom-toolchain#on-check)
---
---@param script fun(target: any, ...: any) Check script function with toolchain parameter
---@return nil
function on_check(script) end

---
---**Scoped: toolchain**
---
---- Load toolchain
---
---[Open in browser](https://xmake.io/api/description/custom-toolchain#on-load)
---
---@param script fun(target: any, ...: any) Load script function with toolchain parameter, or a string referring to a sibling `.lua` file (v3.0.9 and above)
---@return nil
function on_load(script) end

---
---**Scoped: toolchain**
---
---- End definition toolchain
---
---[Open in browser](https://xmake.io/api/description/custom-toolchain#toolchain-end)
---
---@return nil
function toolchain_end() end
