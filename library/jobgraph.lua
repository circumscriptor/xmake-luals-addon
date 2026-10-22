---@meta
---[jobgraph](https://xmake.io/api/scripts/extension-modules/async/jobgraph)

---@class Jobgraph
local Jobgraph = {}

---
---- Add a job node to the job graph.
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/async/jobgraph#jobgraph-add)
---
---@param name string Job name string
---@param jobfunc fun(target: any, ...: any) Job function
---@param options table Options table (optional)
---@return nil
function Jobgraph:add(name, jobfunc, options) end

---
---- Add dependency orders.
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/async/jobgraph#jobgraph-add-orders)
---
---@param jobname string Job name string
---@param ... any Variable arguments for dependency jobs
---@return nil
function Jobgraph:add_orders(jobname, ...) end

---
---- Group jobs for batch dependency management. You can use a callback to add jobs to a group.
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/async/jobgraph#jobgraph-group)
---
---@param groupname string Group name string
---@param callback fun(target: any, ...: any) Callback function to add jobs to group
---@return any
function Jobgraph:group(groupname, callback) end
