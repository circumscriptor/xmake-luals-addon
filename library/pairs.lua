---@meta
---[pairs](https://xmake.io/api/scripts/builtin-modules/pairs)

---
---**Scoped: pairs**
---
---- Used to traverse the dictionary
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/pairs#pairs)
---
---@param t table Table to traverse
---@param f? fun(target: any, ...: any) Function to process values (optional)
---@param ... any Variable arguments for function (optional)
---@return any
function pairs(t, f, ...) end
