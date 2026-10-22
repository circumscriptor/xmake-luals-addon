---@meta
---[semver](https://xmake.io/api/scripts/extension-modules/core/base/semver)

---@class Semver
local Semver = {}

---
---- Get a value from the informations table
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/semver#semver-get)
---
---@param key string Required. Information key
---@return any
function Semver:get(key) end

---
---- Get the major version
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/semver#semver-major)
---
---@return any
function Semver:major() end

---
---- Get the minor version
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/semver#semver-minor)
---
---@return any
function Semver:minor() end

---
---- Get the patch version
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/semver#semver-patch)
---
---@return any
function Semver:patch() end

---
---- Get the build version
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/semver#semver-build)
---
---@return any
function Semver:build() end

---
---- Get the prerelease version
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/semver#semver-prerelease)
---
---@return any
function Semver:prerelease() end

---
---- Get the raw string
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/semver#semver-rawstr)
---
---@return any
function Semver:rawstr() end

---
---- Get the short version string
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/semver#semver-shortstr)
---
---@return any
function Semver:shortstr() end
