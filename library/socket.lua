---@meta
---[socket](https://xmake.io/api/scripts/extension-modules/core/base/socket)

---@class Socket
local Socket = {}

---
---- Bind socket to address
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/socket#socket-bind)
---
---@param addr string Required. IP address
---@param port number Required. Port number
---@return any
function Socket:bind(addr, port) end

---
---- Start listening for connections
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/socket#socket-listen)
---
---@param backlog number Optional. Maximum length of the pending connection queue, default 10
---@return any
function Socket:listen(backlog) end

---
---- Accept client connection
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/socket#socket-accept)
---
---@param opt table Optional. Option parameters
---@return any
function Socket:accept(opt) end

---
---- Connect to remote address
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/socket#socket-connect)
---
---@param addr string Required. Target IP address
---@param port number Required. Target port number
---@param opt table Optional. Option parameters
---@return any
function Socket:connect(addr, port, opt) end

---
---- Send data
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/socket#socket-send)
---
---@param data string|Bytes Required. Data to send, can be string or bytes object
---@param opt table Optional. Option parameters
---@return any
function Socket:send(data, opt) end

---
---- Receive data
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/socket#socket-recv)
---
---@param buff Bytes Required. bytes buffer object
---@param size number Required. Number of bytes to receive
---@param opt table Optional. Option parameters
---@return any
function Socket:recv(buff, size, opt) end

---
---- Send datagram (UDP)
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/socket#socket-sendto)
---
---@param data string|Bytes Required. Data to send, can be string or bytes object
---@param addr string Required. Target IP address
---@param port number Required. Target port number
---@param opt table Optional. Option parameters
---@return any
function Socket:sendto(data, addr, port, opt) end

---
---- Receive datagram (UDP)
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/socket#socket-recvfrom)
---
---@param buff Bytes Required. bytes buffer object
---@param size number Required. Number of bytes to receive
---@param opt table Optional. Option parameters
---@return any
function Socket:recvfrom(buff, size, opt) end

---
---- Wait for socket events
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/socket#socket-wait)
---
---@param events number Required. Events to wait for, supports the following event constants
---@param timeout number Required. Timeout (milliseconds), -1 means infinite wait
---@return any
function Socket:wait(events, timeout) end

---
---- Close socket
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/socket#socket-close)
---
---@return any
function Socket:close() end

---
---- Control socket options
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/socket#socket-ctrl)
---
---@param code number Required. Control code constant
---@param value number Required. Control value
---@return any
function Socket:ctrl(code, value) end
