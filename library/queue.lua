---@meta
---[queue](https://xmake.io/api/scripts/extension-modules/core/base/queue)

---@class Queue
local Queue = {}

---
---- Enqueue (add element to the end)
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/queue#queue-push)
---
---@param item any Required. Element to add to the queue
---@return any
function Queue:push(item) end

---
---- Dequeue (remove and return element from the front)
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/queue#queue-pop)
---
---@return any
function Queue:pop() end

---
---- Peek at the front element
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/queue#queue-first)
---
---@return any
function Queue:first() end

---
---- Peek at the rear element
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/queue#queue-last)
---
---@return any
function Queue:last() end

---
---- Get queue size
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/queue#queue-size)
---
---@return any
function Queue:size() end

---
---- Check if queue is empty
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/queue#queue-empty)
---
---@return any
function Queue:empty() end

---
---- Clear the queue
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/queue#queue-clear)
---
---@return any
function Queue:clear() end

---
---- Clone the queue
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/queue#queue-clone)
---
---@return any
function Queue:clone() end

---
---- Iterate forward through the queue
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/queue#queue-items)
---
---@return any
function Queue:items() end

---
---- Iterate backward through the queue
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/queue#queue-ritems)
---
---@return any
function Queue:ritems() end
