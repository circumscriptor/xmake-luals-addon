---@meta
---[utf8](https://xmake.io/api/scripts/builtin-modules/utf8)

---@class Utf8
utf8 = {}

---
---**Scoped: utf8**
---
---- Returns the number of UTF-8 characters in the string
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/utf8#utf8.len)
---
---@param s string s parameter
---@param i number i parameter
---@param j number j parameter
---@param lax boolean lax parameter
---@return any
function utf8.len(s, i, j, lax) end

---
---**Scoped: utf8**
---
---- Receives zero or more integers, converts each one to its corresponding UTF-8 byte sequence
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/utf8#utf8.char)
---
---@param ... any ... parameter
---@return any
function utf8.char(...) end

---
---**Scoped: utf8**
---
---- Returns the codepoints (as integers) from all characters in the string
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/utf8#utf8.codepoint)
---
---@param s string s parameter
---@param i number i parameter
---@param j number j parameter
---@return any
function utf8.codepoint(s, i, j) end

---
---**Scoped: utf8**
---
---- Returns an iterator (a function) that iterates over all characters in the string
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/utf8#utf8.codes)
---
---@param s string s parameter
---@param lax boolean lax parameter
---@return any
function utf8.codes(s, lax) end

---
---**Scoped: utf8**
---
---- Returns the position (in bytes) where the encoding of the n-th character of the string starts
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/utf8#utf8.offset)
---
---@param s string s parameter
---@param n number n parameter
---@param i number i parameter
---@return any
function utf8.offset(s, n, i) end

---
---**Scoped: utf8**
---
---- Returns the substring of s that starts at character i and continues until character j
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/utf8#utf8.sub)
---
---@param s string s parameter
---@param i number i parameter
---@param j number j parameter
---@return any
function utf8.sub(s, i, j) end

---
---**Scoped: utf8**
---
---- Returns a string with the characters of s in reverse order
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/utf8#utf8.reverse)
---
---@param s string s parameter
---@return any
function utf8.reverse(s) end

---
---**Scoped: utf8**
---
---- Returns the position (in characters) of the last occurrence of pattern in the string s
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/utf8#utf8.lastof)
---
---@param s string s parameter
---@param pattern string pattern parameter
---@param plain boolean plain parameter
---@return any
function utf8.lastof(s, pattern, plain) end

---
---**Scoped: utf8**
---
---- Returns the start and end position (in characters) of the first occurrence of pattern in the string s
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/utf8#utf8.find)
---
---@param s string s parameter
---@param pattern string pattern parameter
---@param init number init parameter
---@param plain boolean plain parameter
---@return any
function utf8.find(s, pattern, init, plain) end

---
---**Scoped: utf8**
---
---- Returns the display width of the string s (usually for terminal alignment)
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/utf8#utf8.width)
---
---@param s string s parameter
---@return any
function utf8.width(s) end

---
---**Scoped: utf8**
---
---- Returns the internal numerical codes of the characters s[i], s[i+1], ..., s[j]
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/utf8#utf8.byte)
---
---@param s string s parameter
---@param i number i parameter
---@param j number j parameter
---@return any
function utf8.byte(s, i, j) end
