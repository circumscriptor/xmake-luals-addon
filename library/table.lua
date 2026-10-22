---@meta
---[table](https://xmake.io/api/scripts/builtin-modules/table)

---
---**Scoped: table**
---
---- Merge multiple tables and return
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/table#table.join)
---
---@param tables table Table to merge
---@param ... any Variable arguments, can pass multiple tables
---@return any
function table.join(tables, ...) end

---
---**Scoped: table**
---
---- Combine multiple tables into the first table
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/table#table.join2)
---
---@param target table Target table to merge into
---@param tables table Table to merge
---@param ... any Variable arguments, can pass multiple tables
---@return any
function table.join2(target, tables, ...) end

---
---**Scoped: table**
---
---- Deduplicate the contents of the table
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/table#table.unique)
---
---@param tbl table Table to deduplicate
---@return any
function table.unique(tbl) end

---
---**Scoped: table**
---
---- Get the slice of the table
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/table#table.slice)
---
---@param tbl table Table to slice
---@param start number Start index
---@param stop? number Stop index (optional)
---@param step? number Step size (optional)
---@return any
function table.slice(tbl, start, stop, step) end

---
---**Scoped: table**
---
---- Determine that the table contains the specified value
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/table#table.contains)
---
---@param tbl table Table to check
---@param values any Values to check for
---@param ... any Variable arguments, can pass multiple values
---@return any
function table.contains(tbl, values, ...) end

---
---**Scoped: table**
---
---- Get an ordered list of keys
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/table#table.orderkeys)
---
---@param tbl table Table to get keys from
---@return any
function table.orderkeys(tbl) end

---
---**Scoped: table**
---
---- Get all keys of a table
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/table#table.keys)
---
---@param tbl table Table to get keys from
---@return any
function table.keys(tbl) end

---
---**Scoped: table**
---
---- Get all values of a table
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/table#table.values)
---
---@param tbl table Table to get values from
---@return any
function table.values(tbl) end

---
---**Scoped: table**
---
---- Iterate key/value pairs in sorted key order
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/table#table.orderpairs)
---
---@param tbl table Table to iterate
---@param callback? fun(target: any, ...: any) Optional. Custom sort function
---@return any
function table.orderpairs(tbl, callback) end

---
---**Scoped: table**
---
---- Clone a table
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/table#table.clone)
---
---@param tbl table Table to clone
---@param depth? number Optional. Clone depth, default is 1 (shallow copy), set to -1 for deep copy
---@return any
function table.clone(tbl, depth) end

---
---**Scoped: table**
---
---- Wrap a value into an array
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/table#table.wrap)
---
---@param value any Value to wrap
---@return any
function table.wrap(value) end

---
---**Scoped: table**
---
---- Unwrap a single-element array
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/table#table.unwrap)
---
---@param array table Array to unwrap
---@return any
function table.unwrap(array) end

---
---**Scoped: table**
---
---- Reverse an array
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/table#table.reverse)
---
---@param arr table Array to reverse
---@return any
function table.reverse(arr) end

---
---**Scoped: table**
---
---- Append elements to the end of an array
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/table#table.append)
---
---@param array table Target array
---@param ... any Elements to append
---@return any
function table.append(array, ...) end

---
---**Scoped: table**
---
---- Swap two elements in an array
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/table#table.swap)
---
---@param array table Target array
---@param i number Index of the first element
---@param j number Index of the second element
---@return any
function table.swap(array, i, j) end

---
---**Scoped: table**
---
---- Check if a table is empty
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/table#table.empty)
---
---@param tbl table Table to check
---@return any
function table.empty(tbl) end

---
---**Scoped: table**
---
---- Check if a table is an array
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/table#table.is-array)
---
---@param tbl table Table to check
---@return boolean
function table.is_array(tbl) end

---
---**Scoped: table**
---
---- Check if a table is a dictionary
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/table#table.is-dictionary)
---
---@param tbl table Table to check
---@return boolean
function table.is_dictionary(tbl) end

---
---**Scoped: table**
---
---- Find indices or keys for a given value
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/table#table.find)
---
---@param tbl table Table to search
---@param value any Value to find
---@return any
function table.find(tbl, value) end

---
---**Scoped: table**
---
---- Find indices or keys matching a predicate
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/table#table.find-if)
---
---@param tbl table Table to search
---@param pred fun(target: any, ...: any) Predicate function, receives `(key, value)`, returns true for matches
---@return any
function table.find_if(tbl, pred) end

---
---**Scoped: table**
---
---- Find the first index of a given value
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/table#table.find-first)
---
---@param tbl table Array to search
---@param value any Value to find
---@return any
function table.find_first(tbl, value) end

---
---**Scoped: table**
---
---- Find the first index matching a predicate
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/table#table.find-first-if)
---
---@param tbl table Array to search
---@param pred fun(target: any, ...: any) Predicate function, receives `(index, value)`, returns true for matches
---@return any
function table.find_first_if(tbl, pred) end

---
---**Scoped: table**
---
---- Remove elements matching a predicate
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/table#table.remove-if)
---
---@param tbl table Table to modify
---@param pred fun(target: any, ...: any) Predicate function, receives `(key, value)`, returns true to remove
---@return nil
function table.remove_if(tbl, pred) end

---
---**Scoped: table**
---
---- Shallow join objects into a new table (without expanding sub-tables)
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/table#table.shallow-join)
---
---@param ... any Objects to join
---@return any
function table.shallow_join(...) end

---
---**Scoped: table**
---
---- Shallow join objects into the first table (without expanding sub-tables)
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/table#table.shallow-join2)
---
---@param target table Target table
---@param ... any Objects to join
---@return any
function table.shallow_join2(target, ...) end

---
---**Scoped: table**
---
---- Reverse deduplicate an array
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/table#table.reverse-unique)
---
---@param array table Array to deduplicate
---@param barrier? fun(target: any, ...: any) Optional. Barrier function
---@return any
function table.reverse_unique(array, barrier) end

---
---**Scoped: table**
---
---- Collect data from an iterator into an array
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/table#table.to-array)
---
---@param iterator fun(target: any, ...: any) Iterator function
---@param state any Iterator state
---@param var any Iterator variable
---@return any
function table.to_array(iterator, state, var) end

---
---**Scoped: table**
---
---- Inherit interfaces and create a new instance
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/table#table.inherit)
---
---@param ... any Classes or tables to inherit from
---@return any
function table.inherit(...) end

---
---**Scoped: table**
---
---- Lock a table to prevent unwrapping
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/table#table.wrap-lock)
---
---@param value table Table to lock
---@return any
function table.wrap_lock(value) end

---
---**Scoped: table**
---
---- Unlock a table to allow unwrapping
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/table#table.wrap-unlock)
---
---@param value table Table to unlock
---@return any
function table.wrap_unlock(value) end

---
---**Scoped: table**
---
---- Pack arguments into a table
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/table#table.pack)
---
---@param ... any Arguments to pack
---@return any
function table.pack(...) end

---
---**Scoped: table**
---
---- Unpack a table into multiple return values
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/table#table.unpack)
---
---@param tbl table Table to unpack
---@param i? number Optional. Start index, default is 1
---@param j? number Optional. End index, default is #tbl
---@return any
function table.unpack(tbl, i, j) end
