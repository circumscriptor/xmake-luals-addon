---@meta
---[hash](https://xmake.io/api/scripts/builtin-modules/hash)

---@class Hash
hash = {}

---
---**Scoped: hash**
---
---- Calculate the MD5 hash value of a file or binary data
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/hash#hash.md5)
---
---@param input string|Bytes File path (string) or binary data (bytes)
---@return any
function hash.md5(input) end

---
---**Scoped: hash**
---
---- Calculate the SHA1 hash value of a file or binary data
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/hash#hash.sha1)
---
---@param input string|Bytes File path (string) or binary data (bytes)
---@return any
function hash.sha1(input) end

---
---**Scoped: hash**
---
---- Calculate the SHA256 hash value of a file or binary data
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/hash#hash.sha256)
---
---@param input string|Bytes File path (string) or binary data (bytes)
---@return any
function hash.sha256(input) end

---
---**Scoped: hash**
---
---- Generate a UUID based on a name
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/hash#hash.uuid)
---
---@param name string Name string for UUID generation
---@return any
function hash.uuid(name) end

---
---**Scoped: hash**
---
---- Calculate the 32-bit xxHash hash value of a file or binary data
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/hash#hash.xxhash32)
---
---@param input string|Bytes File path (string) or binary data (bytes)
---@return any
function hash.xxhash32(input) end

---
---**Scoped: hash**
---
---- Calculate the 64-bit xxHash hash value of a file or binary data
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/hash#hash.xxhash64)
---
---@param input string|Bytes File path (string) or binary data (bytes)
---@return any
function hash.xxhash64(input) end

---
---**Scoped: hash**
---
---- Calculate the 128-bit xxHash hash value of a file or binary data
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/hash#hash.xxhash128)
---
---@param input string|Bytes File path (string) or binary data (bytes)
---@return any
function hash.xxhash128(input) end

---
---**Scoped: hash**
---
---- Generate a 32-bit hash value from a string
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/hash#hash.strhash32)
---
---@param input string String
---@return any
function hash.strhash32(input) end

---
---**Scoped: hash**
---
---- Generate a 64-bit hash value from a string
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/hash#hash.strhash64)
---
---@param input string String
---@return any
function hash.strhash64(input) end

---
---**Scoped: hash**
---
---- Generate a 128-bit hash value from a string
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/hash#hash.strhash128)
---
---@param input string String
---@return any
function hash.strhash128(input) end

---
---**Scoped: hash**
---
---- Generate a 32-bit random hash value
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/hash#hash.rand32)
---
---@return any
function hash.rand32() end

---
---**Scoped: hash**
---
---- Generate a 64-bit random hash value
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/hash#hash.rand64)
---
---@return any
function hash.rand64() end

---
---**Scoped: hash**
---
---- Generate a 128-bit random hash value
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/hash#hash.rand128)
---
---@return any
function hash.rand128() end
