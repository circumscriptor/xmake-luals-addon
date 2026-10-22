---@meta
---[custom_toolchain](https://xmake.io/api/description/custom-toolchain)

---
---[Open in browser](https://xmake.io/api/description/custom-toolchain#toolchain)
---
---@param name string Toolchain name string
---@return nil
function toolchain(name) end

---
---**Scoped: toolchain**
---
---[Open in browser](https://xmake.io/api/description/custom-toolchain#set-kind)
---
---@param kind string Toolchain type: "standalone"
---@return nil
function set_kind(kind) end

---
---**Scoped: toolchain**
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
---[Open in browser](https://xmake.io/api/description/custom-toolchain#set-sdkdir)
---
---@param sdkdir string SDK directory path string
---@return nil
function set_sdkdir(sdkdir) end

---
---**Scoped: toolchain**
---
---[Open in browser](https://xmake.io/api/description/custom-toolchain#set-bindir)
---
---@param bindir string Binary directory path string
---@return nil
function set_bindir(bindir) end

---
---**Scoped: toolchain**
---
---[Open in browser](https://xmake.io/api/description/custom-toolchain#on-check)
---
---@param script fun(toolchain: any) Check script function with toolchain parameter
---@return nil
function on_check(script) end

---
---**Scoped: toolchain**
---
---[Open in browser](https://xmake.io/api/description/custom-toolchain#on-load)
---
---@param script fun(toolchain: any) Load script function with toolchain parameter, or a string referring to a sibling `.lua` file (v3.0.9 and above)
---@return nil
function on_load(script) end

---
---[Open in browser](https://xmake.io/api/description/custom-toolchain#toolchain-end)
---
---@return nil
function toolchain_end() end
