---@meta
---[list](https://xmake.io/api/scripts/extension-modules/core/base/list)

---@class List
local List = {}

---
---- Add element to the end of the list
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/list#list-push)
---
---@param item any Required. The element to add
---@return any
function List:push(item) end

---
---- Remove element from the end of the list
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/list#list-pop)
---
---@return any
function List:pop() end

---
---- Add element to the beginning of the list
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/list#list-unshift)
---
---@param item any Required. The element to add
---@return any
function List:unshift(item) end

---
---- Remove element from the beginning of the list
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/list#list-shift)
---
---@return any
function List:shift() end

---
---- Insert an element
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/list#list-insert)
---
---@param item any Required. The element to insert
---@param after any Optional. Insert after this element; if nil, inserts at the end
---@return any
function List:insert(item, after) end

---
---- Insert element at the beginning
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/list#list-insert-first)
---
---@param item any Required. The element to insert
---@return any
function List:insert_first(item) end

---
---- Insert element at the end
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/list#list-insert-last)
---
---@param item any Required. The element to insert
---@return any
function List:insert_last(item) end

---
---- Remove specified element
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/list#list-remove)
---
---@param item any Required. The element to remove
---@return nil
function List:remove(item) end

---
---- Remove element from the beginning
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/list#list-remove-first)
---
---@return nil
function List:remove_first() end

---
---- Remove element from the end
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/list#list-remove-last)
---
---@return nil
function List:remove_last() end

---
---- Get the first element
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/list#list-first)
---
---@return any
function List:first() end

---
---- Get the last element
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/list#list-last)
---
---@return any
function List:last() end

---
---- Get the next element
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/list#list-next)
---
---@param current any Optional. The current element; if nil, returns the first element
---@return any
function List:next(current) end

---
---- Get the previous element
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/list#list-prev)
---
---@param current any Optional. The current element; if nil, returns the last element
---@return any
function List:prev(current) end

---
---- Get list size
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/list#list-size)
---
---@return any
function List:size() end

---
---- Check if list is empty
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/list#list-empty)
---
---@return any
function List:empty() end

---
---- Clear the list
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/list#list-clear)
---
---@return any
function List:clear() end

---
---- Iterate forward through the list
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/list#list-items)
---
---@return any
function List:items() end

---
---- Iterate backward through the list
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/list#list-ritems)
---
---@return any
function List:ritems() end
