---@meta
---[linuxos](https://xmake.io/api/scripts/builtin-modules/linuxos)

---@class Linuxos
linuxos = {}

---
---**Scoped: linuxos**
---
---- Get linux system name
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/linuxos#linuxos.name)
---
---@return string
function linuxos.name() end

---
---**Scoped: linuxos**
---
---- Get linux system version
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/linuxos#linuxos.version)
---
---@return string
function linuxos.version() end

---
---**Scoped: linuxos**
---
---- Get linux system kernel version
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/linuxos#linuxos.kernelver)
---
---@return any
function linuxos.kernelver() end
