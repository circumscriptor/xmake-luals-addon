---@meta
---[hashset](https://xmake.io/api/scripts/extension-modules/core/base/hashset)

---@class Hashset
local Hashset = {}

---
---- Insert an element
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/hashset#hashset-insert)
---
---@param value any Required. Element to insert
---@return any
function Hashset:insert(value) end

---
---- Remove an element
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/hashset#hashset-remove)
---
---@param value any Required. Element to remove
---@return nil
function Hashset:remove(value) end

---
---- Check if element exists
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/hashset#hashset-has)
---
---@param value any Required. Element to check
---@return any
function Hashset:has(value) end

---
---- Get set size
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/hashset#hashset-size)
---
---@return any
function Hashset:size() end

---
---- Check if set is empty
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/hashset#hashset-empty)
---
---@return any
function Hashset:empty() end

---
---- Clear the set
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/hashset#hashset-clear)
---
---@return any
function Hashset:clear() end

---
---- Clone the set
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/hashset#hashset-clone)
---
---@return any
function Hashset:clone() end

---
---- Convert to array
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/hashset#hashset-to-array)
---
---@return any
function Hashset:to_array() end

---
---- Iterate over set elements
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/hashset#hashset-items)
---
---@return any
function Hashset:items() end

---
---- Iterate over set elements in order
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/hashset#hashset-orderitems)
---
---@return any
function Hashset:orderitems() end
