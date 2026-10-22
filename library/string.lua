---@meta
---[string](https://xmake.io/api/scripts/builtin-modules/string)

---
---**Scoped: string**
---
---- Determine if the beginning of the string matches
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/string#string.startswith)
---
---@param str string String to check
---@param prefix string Prefix string to match
---@return any
function string.startswith(str, prefix) end

---
---**Scoped: string**
---
---- Determine if the end of the string matches
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/string#string.endswith)
---
---@param str string String to check
---@param suffix string Suffix string to match
---@return any
function string.endswith(str, suffix) end

---
---**Scoped: string**
---
---- Split string by separator
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/string#string.split)
---
---@param str string String to split
---@param separator string Separator string
---@param options? table Split options table (optional)
---@return any
function string.split(str, separator, options) end

---
---**Scoped: string**
---
---- Remove the left and right whitespace characters of the string
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/string#string.trim)
---
---@param str string String to trim
---@return any
function string.trim(str) end

---
---**Scoped: string**
---
---- Remove the whitespace character to the left of the string
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/string#string.ltrim)
---
---@param str string String to trim
---@return any
function string.ltrim(str) end

---
---**Scoped: string**
---
---- Remove the whitespace character to the right of the string
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/string#string.rtrim)
---
---@param str string String to trim
---@return any
function string.rtrim(str) end

---
---**Scoped: string**
---
---- Find the position of the last occurrence of a substring
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/string#string.lastof)
---
---@param str string String to search
---@param pattern string Pattern to match
---@param plain? boolean Optional. Whether to use plain text matching, default is false
---@return any
function string.lastof(str, pattern, plain) end

---
---**Scoped: string**
---
---- Replace text in a string
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/string#string.replace)
---
---@param str string String to process
---@param old string Old string to replace
---@param new string New replacement string
---@param opt? table Optional. Options table, supports `{plain = true}` for plain text replacement
---@return any
function string.replace(str, old, new, opt) end

---
---**Scoped: string**
---
---- Serialize an object to a string
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/string#string.serialize)
---
---@param object any Object to serialize
---@param opt? table Optional. Options table, supports `{strip = true, binary = false, indent = true}`
---@return any
function string.serialize(object, opt) end

---
---**Scoped: string**
---
---- Deserialize a string to an object
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/string#string.deserialize)
---
---@param str string String to deserialize
---@return any
function string.deserialize(str) end

---
---**Scoped: string**
---
---- Generate a case-insensitive matching pattern
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/string#string.ipattern)
---
---@param pattern string Lua pattern string
---@param brackets? boolean Optional. Whether to also convert letters inside brackets `[]`, default is false
---@return any
function string.ipattern(pattern, brackets) end

---
---**Scoped: string**
---
---- Compute the Levenshtein (edit) distance between two strings
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/string#string.levenshtein)
---
---@param str1 string First string
---@param str2 string Second string
---@param opt? table Optional. Options table, supports `{sub = 1, ins = 1, del = 1}` for substitution/insertion/deletion costs
---@return any
function string.levenshtein(str1, str2, opt) end
