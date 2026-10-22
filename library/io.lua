---@meta
---[io](https://xmake.io/api/scripts/builtin-modules/io)

---
---**Scoped: io**
---
---- Open file for reading and writing
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/io#io.open)
---
---@param filename string File path string
---@param mode string Open mode string
---@param options? table Options table (optional)
---@return any
function io.open(filename, mode, options) end

---
---**Scoped: io**
---
---- Load all table contents from the specified path file deserialization
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/io#io.load)
---
---@param filename string File path string
---@return any
function io.load(filename) end

---
---**Scoped: io**
---
---- Serialize all table contents to the specified path file
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/io#io.save)
---
---@param filename string File path string
---@param data table Table data to serialize
---@return any
function io.save(filename, data) end

---
---**Scoped: io**
---
---- Read everything from the specified path file
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/io#io.readfile)
---
---@param filename string File path string
---@param options? table Options table (optional)
---@return string
function io.readfile(filename, options) end

---
---**Scoped: io**
---
---- Write all content to the specified path file
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/io#io.writefile)
---
---@param filename string File path string
---@param data string Data string to write
---@param options? table Options table (optional)
---@return string
function io.writefile(filename, data, options) end

---
---**Scoped: io**
---
---- Full text replaces the contents of the specified path file
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/io#io.gsub)
---
---@param filename string File path string
---@param pattern string Pattern string
---@param replacement string Replacement string
---@param options? table Options table (optional)
---@return any
function io.gsub(filename, pattern, replacement, options) end

---
---**Scoped: io**
---
---- Read and display the tail content of the file
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/io#io.tail)
---
---@param filename string File path string
---@param lines number Number of lines to read
---@return any
function io.tail(filename, lines) end

---
---**Scoped: io**
---
---- read and display all contents of the file
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/io#io.cat)
---
---@param filename string File path string
---@return any
function io.cat(filename) end

---
---**Scoped: io**
---
---- Formatted output content to file with newline
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/io#io.print)
---
---@param filename string File path string
---@param formatstring string Format string
---@param ... any Variable arguments for formatting
---@return any
function io.print(filename, formatstring, ...) end

---
---**Scoped: io**
---
---- Formatted output to file without line breaks
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/io#io.printf)
---
---@param filename string File path string
---@param formatstring string Format string
---@param ... any Variable arguments for formatting
---@return any
function io.printf(filename, formatstring, ...) end

---
---**Scoped: io**
---
---- Read all lines from file
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/io#io.lines)
---
---@param filename string File path string
---@param options? table Options table (optional)
---@return any
function io.lines(filename, options) end

---
---**Scoped: io**
---
---- Get a std file
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/io#io.stdfile)
---
---@param stdname string Standard file name string
---@return string
function io.stdfile(stdname) end

---
---**Scoped: io**
---
---- Open a lock of a file
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/io#io.openlock)
---
---@param filename string File path string
---@return any
function io.openlock(filename) end

---
---**Scoped: io**
---
---- Replace text of the given file and return the replaced data
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/io#io.replace)
---
---@param filename string File path string
---@param pattern string Pattern string
---@param replacement string Replacement string
---@param options? table Options table (optional)
---@return any
function io.replace(filename, pattern, replacement, options) end

---
---**Scoped: io**
---
---- Insert text before a line number in a file
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/io#io.insert)
---
---@param filepath string File path string
---@param lineidx number Line number to insert before
---@param text string Text content to insert
---@param options? table Options table (optional)
---@return any
function io.insert(filepath, lineidx, text, options) end

---
---**Scoped: io**
---
---- Read data from standard input
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/io#io.read)
---
---@param fmt? string Optional. Read format, e.g. `"*l"` (read a line), `"*n"` (read a number), `"*a"` (read all)
---@return any
function io.read(fmt) end

---
---**Scoped: io**
---
---- Write data to standard output
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/io#io.write)
---
---@param ... any Content to write
---@return any
function io.write(...) end

---
---**Scoped: io**
---
---- Flush standard output buffer
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/io#io.flush)
---
---@return any
function io.flush() end

---
---**Scoped: io**
---
---- Check if standard input is readable
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/io#io.readable)
---
---@return any
function io.readable() end

---
---**Scoped: io**
---
---- Check if a file is a terminal device
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/io#io.isatty)
---
---@param file? file Optional. File object, defaults to stdout
---@return any
function io.isatty(file) end

---
---**Scoped: io**
---
---- Close a file
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/io#io.close)
---
---@param file? file Optional. File object, defaults to stdout
---@return any
function io.close(file) end

---
---**Scoped: io**
---
---- Convert file encoding
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/io#io.convert)
---
---@param inputfile string Input file path
---@param outputfile string Output file path
---@param opt? table Optional. Options table
---@return any
function io.convert(inputfile, outputfile, opt) end
