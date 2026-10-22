---@meta
---[bloom_filter](https://xmake.io/api/scripts/extension-modules/core/base/bloom_filter)

---@class Bloom_filter
local Bloom_filter = {}

---
---- Add an item to the Bloom filter
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/bloom_filter#filter-set)
---
---@param item string Required. String item to add to the filter
---@return nil
function Bloom_filter:set(item) end

---
---- Check if an item exists in the Bloom filter
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/bloom_filter#filter-get)
---
---@param item string Required. String item to check
---@return any
function Bloom_filter:get(item) end

---
---- Get the Bloom filter data as a bytes object
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/bloom_filter#filter-data)
---
---@return any
function Bloom_filter:data() end

---
---- Set the Bloom filter data from a bytes object
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/bloom_filter#filter-data-set)
---
---@param data Bytes Required. Bytes object containing the filter data
---@return any
function Bloom_filter:data_set(data) end

---
---- Clear all items from the Bloom filter
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/bloom_filter#filter-clear)
---
---@return any
function Bloom_filter:clear() end

---
---- Get the internal C data handle
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/bloom_filter#filter-cdata)
---
---@return any
function Bloom_filter:cdata() end
