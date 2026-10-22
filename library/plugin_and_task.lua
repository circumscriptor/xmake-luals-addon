---@meta
---[plugin_and_task](https://xmake.io/api/description/plugin-and-task)

---
---**Scoped: plugin-and-task**
---
---[Open in browser](https://xmake.io/api/description/plugin-and-task#task)
---
---@param name string Task name string
---@return nil
function task(name) end

---
---**Scoped: plugin-and-task**
---
---[Open in browser](https://xmake.io/api/description/plugin-and-task#task-end)
---
---@return nil
function task_end() end

---
---**Scoped: plugin-and-task**
---
---[Open in browser](https://xmake.io/api/description/plugin-and-task#set-menu)
---
---@param options table Menu options table
---@return nil
function set_menu(options) end

---
---**Scoped: plugin-and-task**
---
---[Open in browser](https://xmake.io/api/description/plugin-and-task#set-category)
---
---@param category string Category name string
---@return nil
function set_category(category) end

---
---**Scoped: plugin-and-task**
---
---[Open in browser](https://xmake.io/api/description/plugin-and-task#on-run)
---
---@param script function Task execution function
---@return nil
function on_run(script) end
