---@meta
---[ping](https://xmake.io/api/scripts/extension-modules/net/ping)

---@class Ping
local Ping = {}

---
---- Execute ping detection on a list of hosts
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/net/ping#ping)
---
---@param hosts any Required. Host address string or array of host addresses
---@param opt any Optional. Option parameter table, supports:<br>- `force` - Whether to force refresh cache (default: false)
---@return Ping
function ping(hosts, opt) end
