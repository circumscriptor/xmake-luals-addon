---@meta
---[pipe](https://xmake.io/api/scripts/extension-modules/core/base/pipe)

---@class Pipe
local Pipe = {}

---
---- Read data from pipe
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/pipe#pipe-read)
---
---@param buff Bytes Required. bytes buffer object to store the read data
---@param size number Required. Number of bytes to read
---@param opt table Optional. Option parameters
---@return any
function Pipe:read(buff, size, opt) end

---
---- Write data to pipe
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/pipe#pipe-write)
---
---@param data string|Bytes Required. Data to write, can be string or bytes object
---@param opt table Optional. Option parameters
---@return any
function Pipe:write(data, opt) end

---
---- Connect to named pipe (server-side)
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/pipe#pipe-connect)
---
---@param opt table Optional. Option parameters
---@return any
function Pipe:connect(opt) end

---
---- Wait for pipe events
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/pipe#pipe-wait)
---
---@param events number Required. Events to wait for
---@param timeout number Required. Timeout in milliseconds, -1 means wait indefinitely
---@return any
function Pipe:wait(events, timeout) end

---
---- Close the pipe
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/pipe#pipe-close)
---
---@return any
function Pipe:close() end

---
---- Get pipe name
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/pipe#pipe-name)
---
---@return string
function Pipe:name() end
