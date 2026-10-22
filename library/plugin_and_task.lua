---@meta
---[plugin_and_task](https://xmake.io/api/description/plugin-and-task)

---
---**Scoped: plugin-and-task**
---
---- Defining plugins or tasks
---
---[Open in browser](https://xmake.io/api/description/plugin-and-task#task)
---
---@param name string Task name string
---@param opt? TaskAttr|fun() Configuration options
---@return nil
function task(name, opt) end

---
---**Scoped: plugin-and-task**
---
---- End defining plugins or tasks
---
---[Open in browser](https://xmake.io/api/description/plugin-and-task#task-end)
---
---@return nil
function task_end() end

---
---**Scoped: plugin-and-task**
---
---- Setting the task menu
---
---[Open in browser](https://xmake.io/api/description/plugin-and-task#set-menu)
---
---@param options table Menu options table
---@return nil
function set_menu(options) end

---
---**Scoped: plugin-and-task**
---
---- Setting task categories
---
---[Open in browser](https://xmake.io/api/description/plugin-and-task#set-category)
---
---@param category string Category name string
---@return nil
function set_category(category) end

---
---**Scoped: plugin-and-task**
---
---- Setting up a task to run a script
---
---[Open in browser](https://xmake.io/api/description/plugin-and-task#on-run)
---
---@param script fun(target: any, ...: any) Task execution function
---@return nil
function on_run(script) end
