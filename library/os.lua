---@meta
---[os](https://xmake.io/api/scripts/builtin-modules/os)

---
---**Scoped: os**
---
---- Check file access permissions
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.access)
---
---@param path string File or directory path
---@param mode string Access mode: 'r' (read), 'w' (write), 'x' (execute)
---@return any
function os.access(path, mode) end

---
---**Scoped: os**
---
---- Copy files or directories
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.cp)
---
---@param source string Source path or pattern
---@param destination string Destination path
---@param options? table Options table (optional)
---@return any
function os.cp(source, destination, options) end

---
---**Scoped: os**
---
---- Move to rename a file or directory
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.mv)
---
---@param source string Source path or pattern
---@param destination string Destination path
---@return any
function os.mv(source, destination) end

---
---**Scoped: os**
---
---- Delete files or directory trees
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.rm)
---
---@param path string File or directory path
---@param options? table Optional options table, supports `async` and `detach` parameters
---@return any
function os.rm(path, options) end

---
---**Scoped: os**
---
---- Try copying files or directories
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.trycp)
---
---@param source string Source path or pattern
---@param destination string Destination path
---@return any
function os.trycp(source, destination) end

---
---**Scoped: os**
---
---- Try moving a file or directory
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.trymv)
---
---@param source string Source path or pattern
---@param destination string Destination path
---@return any
function os.trymv(source, destination) end

---
---**Scoped: os**
---
---- Try deleting files or directories
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.tryrm)
---
---@param path string File or directory path
---@return any
function os.tryrm(path) end

---
---**Scoped: os**
---
---- Enter the specified directory
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.cd)
---
---@param path string Directory path
---@return any
function os.cd(path) end

---
---**Scoped: os**
---
---- delete only the directory
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.rmdir)
---
---@param path string Directory path
---@return string
function os.rmdir(path) end

---
---**Scoped: os**
---
---- Create a directory
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.mkdir)
---
---@param path string Directory path
---@param ... any Variable arguments, can pass multiple directory paths
---@return string
function os.mkdir(path, ...) end

---
---**Scoped: os**
---
---- Create an empty file or update file timestamp
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.touch)
---
---@param path string File path
---@param ... any Variable arguments, can pass multiple file paths
---@return any
function os.touch(path, ...) end

---
---**Scoped: os**
---
---- Determine if it is a directory
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.isdir)
---
---@param path string Directory path
---@return string
function os.isdir(path) end

---
---**Scoped: os**
---
---- Determine if it is a file
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.isfile)
---
---@param path string File path
---@return string
function os.isfile(path) end

---
---**Scoped: os**
---
---- Determine if a file or directory exists
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.exists)
---
---@param path string File or directory path
---@return any
function os.exists(path) end

---
---**Scoped: os**
---
---- Determine if it is a symbolic link
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.islink)
---
---@param path string Symbolic link path
---@return any
function os.islink(path) end

---
---**Scoped: os**
---
---- Traverse to get all the directories under the specified directory
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.dirs)
---
---@param pattern string File pattern
---@return string[]
function os.dirs(pattern) end

---
---**Scoped: os**
---
---- Traverse to get all the files in the specified directory
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.files)
---
---@param pattern string File pattern
---@param options? table Optional options table, supports `async` parameter
---@return string[]
function os.files(pattern, options) end

---
---**Scoped: os**
---
---- Traverse to get all files and directories under the specified directory
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.filedirs)
---
---@param pattern string File pattern
---@return string[]
function os.filedirs(pattern) end

---
---**Scoped: os**
---
---- Exit the program
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.exit)
---
---@param code number Exit code
---@return any
function os.exit(code) end

---
---**Scoped: os**
---
---- Test if a file is executable
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.isexec)
---
---@param path string File path
---@return any
function os.isexec(path) end

---
---**Scoped: os**
---
---- Quietly running native shell commands
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.run)
---
---@param command string Command string
---@param ... any Variable arguments for command
---@return any
function os.run(command, ...) end

---
---**Scoped: os**
---
---- Quietly running native shell commands with parameter list
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.runv)
---
---@param program string Program name
---@param args table Arguments table
---@param options? table Options table (optional)
---@return any
function os.runv(program, args, options) end

---
---**Scoped: os**
---
---- Run native shell commands and echo them only in verbose mode
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.vrun)
---
---@param command string Command string
---@param ... any Variable arguments for command
---@return any
function os.vrun(command, ...) end

---
---**Scoped: os**
---
---- Run native shell commands with an argument list and echo them only in verbose mode
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.vrunv)
---
---@param program string Program name
---@param args table Arguments table
---@param options? table Optional options table. Supports the options of `os.runv` and `os.execv`; set `{dryrun = true}` to skip execution
---@return any
function os.vrunv(program, args, options) end

---
---**Scoped: os**
---
---- Echo running native shell commands
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.exec)
---
---@param command string Command string
---@param ... any Variable arguments for command
---@return any
function os.exec(command, ...) end

---
---**Scoped: os**
---
---- Echo running native shell commands with parameter list
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.execv)
---
---@param program string Program name
---@param args table Arguments table
---@param options? table Options table (optional)
---@return any
function os.execv(program, args, options) end

---
---**Scoped: os**
---
---- Quietly running native shell commands and getting output
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.iorun)
---
---@param command string Command string
---@param ... any Variable arguments for command
---@return any
function os.iorun(command, ...) end

---
---**Scoped: os**
---
---- Run the native shell command quietly and get the output with a list of parameters
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.iorunv)
---
---@param program string Program name
---@param args table Arguments table
---@param options? table Options table (optional)
---@return any
function os.iorunv(program, args, options) end

---
---**Scoped: os**
---
---- Get temporary directory
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.tmpdir)
---
---@return string
function os.tmpdir() end

---
---**Scoped: os**
---
---- Get temporary file path
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.tmpfile)
---
---@return string
function os.tmpfile() end

---
---**Scoped: os**
---
---- Get the current directory path
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.curdir)
---
---@return string
function os.curdir() end

---
---**Scoped: os**
---
---- Get file size
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.filesize)
---
---@param filepath string File path
---@return any
function os.filesize(filepath) end

---
---**Scoped: os**
---
---- Get the path of the current description script
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.scriptdir)
---
---@return string
function os.scriptdir() end

---
---**Scoped: os**
---
---- Get the xmake installation main program script directory
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.programdir)
---
---@return string
function os.programdir() end

---
---**Scoped: os**
---
---- Get the path of the xmake executable
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.programfile)
---
---@return string
function os.programfile() end

---
---**Scoped: os**
---
---- Get the project home directory
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.projectdir)
---
---@return string
function os.projectdir() end

---
---**Scoped: os**
---
---- Get current system architecture
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.arch)
---
---@return string
function os.arch() end

---
---**Scoped: os**
---
---- Get the operating system of the current host
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.host)
---
---@return any
function os.host() end

---
---**Scoped: os**
---
---- Get Subsystem host
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.subhost)
---
---@return any
function os.subhost() end

---
---**Scoped: os**
---
---- Get Subsystem host architecture
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.subarch)
---
---@return any
function os.subarch() end

---
---**Scoped: os**
---
---- Test if a given host is the current
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.is-host)
---
---@param host string Host name
---@param ... any Variable arguments, can pass multiple hosts
---@return boolean
function os.is_host(host, ...) end

---
---**Scoped: os**
---
---- Test if a given arch is the current
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.is-arch)
---
---@param arch string Architecture name
---@param ... any Variable arguments, can pass multiple architectures
---@return boolean
function os.is_arch(arch, ...) end

---
---**Scoped: os**
---
---- Test if a given sub host is the current
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.is-subhost)
---
---@param subhost string Sub host name
---@param ... any Variable arguments, can pass multiple sub hosts
---@return boolean
function os.is_subhost(subhost, ...) end

---
---**Scoped: os**
---
---- Test if a given sub arch is the current
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.is-subarch)
---
---@param subarch string Sub architecture name
---@param ... any Variable arguments, can pass multiple sub architectures
---@return boolean
function os.is_subarch(subarch, ...) end

---
---**Scoped: os**
---
---- Create a symlink to a file or directory
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.ln)
---
---@param source string Source file or directory path
---@param target string Target symlink path
---@return any
function os.ln(source, target) end

---
---**Scoped: os**
---
---- Read the content of a symlink
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.readlink)
---
---@param path string Symlink path
---@return any
function os.readlink(path) end

---
---**Scoped: os**
---
---- Raise an exception and abort the current script
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.raise)
---
---@param message string Error message
---@return any
function os.raise(message) end

---
---**Scoped: os**
---
---- Similar to [os.raise](#os-raise) but you can specify the level of the error
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.raiselevel)
---
---@param level number Error level
---@param message string Error message
---@return any
function os.raiselevel(level, message) end

---
---**Scoped: os**
---
---- Get features
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.features)
---
---@return any
function os.features() end

---
---**Scoped: os**
---
---- Get all current environment variables
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.getenvs)
---
---@return any
function os.getenvs() end

---
---**Scoped: os**
---
---- Set environment variables. Replace the current envs by a new one and return old envs
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.setenvs)
---
---@param envs table Environment variables table
---@return any
function os.setenvs(envs) end

---
---**Scoped: os**
---
---- Add environment variables to current envs, return the all old envs
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.addenvs)
---
---@param envs table Environment variables table to add
---@return any
function os.addenvs(envs) end

---
---**Scoped: os**
---
---- Join environment variables. Similar to [os.addenvs](#os-addenvs) but with two envs variable
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.joinenvs)
---
---@param envs1 table First environment variables table
---@param envs2 table Second environment variables table
---@return any
function os.joinenvs(envs1, envs2) end

---
---**Scoped: os**
---
---- Get system environment variables
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.getenv)
---
---@param name string Environment variable name
---@return any
function os.getenv(name) end

---
---**Scoped: os**
---
---- Set system environment variables
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.setenv)
---
---@param name string Environment variable name
---@param value string Environment variable value
---@return any
function os.setenv(name, value) end

---
---**Scoped: os**
---
---- Add values to one environment variable
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.addenv)
---
---@param name string Environment variable name
---@param value string Value to add
---@return any
function os.addenv(name, value) end

---
---**Scoped: os**
---
---- Setting environment variables with a given separator
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.setenvp)
---
---@param name string Environment variable name
---@param value string Environment variable value
---@param separator string Separator string
---@return any
function os.setenvp(name, value, separator) end

---
---**Scoped: os**
---
---- Add values to one environment variable with a given separator
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.addenvp)
---
---@param name string Environment variable name
---@param value string Value to add
---@param separator string Separator string
---@return any
function os.addenvp(name, value, separator) end

---
---**Scoped: os**
---
---- Get the working directory
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.workingdir)
---
---@return string
function os.workingdir() end

---
---**Scoped: os**
---
---- Test if xmake is running as root
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.isroot)
---
---@return any
function os.isroot() end

---
---**Scoped: os**
---
---- Test if the os has a case sensitive filesystem
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.fscase)
---
---@return any
function os.fscase() end

---
---**Scoped: os**
---
---- Get current terminal (windows-terminal, vscode, ... )
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.term)
---
---@return any
function os.term() end

---
---**Scoped: os**
---
---- Get current shell  (pwsh, cmd, ...)
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.shell)
---
---@return any
function os.shell() end

---
---**Scoped: os**
---
---- Get cpu information
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.cpuinfo)
---
---@param key? string CPU info key (optional)
---@return any
function os.cpuinfo(key) end

---
---**Scoped: os**
---
---- Get memory information
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.meminfo)
---
---@param key? string Memory info key (optional)
---@return any
function os.meminfo(key) end

---
---**Scoped: os**
---
---- Get default parallel jobs
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.default-njob)
---
---@return any
function os.default_njob() end

---
---**Scoped: os**
---
---- Parse command line string into argument list
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.argv)
---
---@param command string Command line string
---@param options? table Options table (optional)
---@return any
function os.argv(command, options) end

---
---**Scoped: os**
---
---- Convert argument list to command line string
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.args)
---
---@param args table Arguments array
---@param options? table Options table (optional)
---@return any
function os.args(args, options) end

---
---**Scoped: os**
---
---- Get monotonic clock time (milliseconds)
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.mclock)
---
---@return any
function os.mclock() end

---
---**Scoped: os**
---
---- Get the current process ID
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.getpid)
---
---@return any
function os.getpid() end

---
---**Scoped: os**
---
---- Get user ID information
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.uid)
---
---@param name? string Optional. User name
---@return any
function os.uid(name) end

---
---**Scoped: os**
---
---- Get group ID information
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.gid)
---
---@param name? string Optional. Group name
---@return any
function os.gid(name) end

---
---**Scoped: os**
---
---- Get the null device path
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.nuldev)
---
---@param input? boolean Optional. Whether to get the input null device path
---@return any
function os.nuldev(input) end

---
---**Scoped: os**
---
---- Get content from the system clipboard
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.pbpaste)
---
---@return any
function os.pbpaste() end

---
---**Scoped: os**
---
---- Copy content to the system clipboard
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.pbcopy)
---
---@param data string String to copy to clipboard
---@return any
function os.pbcopy(data) end

---
---**Scoped: os**
---
---- Get the project file path
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.projectfile)
---
---@return string
function os.projectfile() end

---
---**Scoped: os**
---
---- Register an exit callback function
---
---[Open in browser](https://xmake.io/api/scripts/builtin-modules/os#os.atexit)
---
---@param on_exit fun(target: any, ...: any) Callback function to execute on exit
---@return any
function os.atexit(on_exit) end
