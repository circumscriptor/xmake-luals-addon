---@meta
---[graph](https://xmake.io/api/scripts/extension-modules/core/base/graph)

---@class Graph
local Graph = {}

---
---- Clear the graph
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/graph#graph-clear)
---
---@return any
function Graph:clear() end

---
---- Check if the graph is empty
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/graph#graph-empty)
---
---@return any
function Graph:empty() end

---
---- Check if the graph is directed
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/graph#graph-is-directed)
---
---@return boolean
function Graph:is_directed() end

---
---- Get all vertices
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/graph#graph-vertices)
---
---@return any
function Graph:vertices() end

---
---- Get vertex at the given index
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/graph#graph-vertex)
---
---@param idx number Vertex index (1-based)
---@return any
function Graph:vertex(idx) end

---
---- Check if the graph has the given vertex
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/graph#graph-has-vertex)
---
---@param v any Vertex value to check
---@return boolean
function Graph:has_vertex(v) end

---
---- Add an isolated vertex
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/graph#graph-add-vertex)
---
---@param v any Vertex value to add
---@return nil
function Graph:add_vertex(v) end

---
---- Remove the given vertex
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/graph#graph-remove-vertex)
---
---@param v any Vertex value to remove
---@return nil
function Graph:remove_vertex(v) end

---
---- Get all edges
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/graph#graph-edges)
---
---@return any
function Graph:edges() end

---
---- Get adjacent edges of the given vertex
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/graph#graph-adjacent-edges)
---
---@param v any Vertex value
---@return any
function Graph:adjacent_edges(v) end

---
---- Add an edge
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/graph#graph-add-edge)
---
---@param from any Source vertex
---@param to any Target vertex
---@return nil
function Graph:add_edge(from, to) end

---
---- Check if the graph has the given edge
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/graph#graph-has-edge)
---
---@param from any Source vertex
---@param to any Target vertex
---@return boolean
function Graph:has_edge(from, to) end

---
---- Perform topological sort
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/graph#graph-topo-sort)
---
---@return any
function Graph:topo_sort() end

---
---- Reset partial topological sort state
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/graph#graph-partial-topo-sort-reset)
---
---@return any
function Graph:partial_topo_sort_reset() end

---
---- Get next node in topological order
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/graph#graph-partial-topo-sort-next)
---
---@return any
function Graph:partial_topo_sort_next() end

---
---- Remove node and update in-degrees
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/graph#graph-partial-topo-sort-remove)
---
---@param node any Node to remove from the sort
---@return any
function Graph:partial_topo_sort_remove(node) end

---
---- Find cycle in the graph
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/graph#graph-find-cycle)
---
---@return any
function Graph:find_cycle() end

---
---- Clone the graph
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/graph#graph-clone)
---
---@return any
function Graph:clone() end

---
---- Reverse the graph
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/graph#graph-reverse)
---
---@return any
function Graph:reverse() end

---
---- Dump graph information
---
---[Open in browser](https://xmake.io/api/scripts/extension-modules/core/base/graph#graph-dump)
---
---@return any
function Graph:dump() end
