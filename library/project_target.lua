---@meta
---[project_target](https://xmake.io/api/description/project-target)

---
---Define a project target
---
---[Open in browser](https://xmake.io/api/description/project-target#target)
---
---@param name string Target name string, used to identify the project target
---@param opt table? Options (-----------, kind)
---@return nil
function target(name, opt) end

---
---End target definition
---
---[Open in browser](https://xmake.io/api/description/project-target#target-end)
---
---@return nil
function target_end() end

---
---**Scoped: target**
---
---Set target kind
---
---[Open in browser](https://xmake.io/api/description/project-target#set-kind)
---
---@param kind string Target type string, specifies the type of compilation target
---@return nil
function set_kind(kind) end

---
---**Scoped: target**
---
---Strip target symbols
---
---[Open in browser](https://xmake.io/api/description/project-target#set-strip)
---
---@param strip string Strip mode string, optional values: debug, all
---@return nil
function set_strip(strip) end

---
---**Scoped: target**
---
---Enable or disable target
---
---[Open in browser](https://xmake.io/api/description/project-target#set-enabled)
---
---@param enabled boolean Whether to enable the target, true means enabled, false means disabled
---@return nil
function set_enabled(enabled) end

---
---**Scoped: target**
---
---Mark as default target
---
---[Open in browser](https://xmake.io/api/description/project-target#set-default)
---
---@param is_default boolean Whether to mark as default build target, true means default build, false means not default build
---@return nil
function set_default(is_default) end

---
---**Scoped: target**
---
---Set configuration options
---
---[Open in browser](https://xmake.io/api/description/project-target#set-options)
---
---@param options string|string[] Option name string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple option name strings
---@return nil
function set_options(options, ...) end

---
---**Scoped: target**
---
---Set symbol info
---
---[Open in browser](https://xmake.io/api/description/project-target#set-symbols)
---
---@param symbols string Symbol mode string, optional values: debug, hidden, none
---@param opt table? Options (-----------, symbols, public\)
---@return nil
function set_symbols(symbols, opt) end

---
---**Scoped: target**
---
---Set the base name of target file
---
---[Open in browser](https://xmake.io/api/description/project-target#set-basename)
---
---@param basename string Target file base name string
---@return nil
function set_basename(basename) end

---
---**Scoped: target**
---
---Set the full name of target file
---
---[Open in browser](https://xmake.io/api/description/project-target#set-filename)
---
---@param filename string Target file full name string, including prefix and suffix
---@return nil
function set_filename(filename) end

---
---**Scoped: target**
---
---Set the leading name of the target file
---
---[Open in browser](https://xmake.io/api/description/project-target#set-prefixname)
---
---@param prefixname string Target file prefix name string, such as "lib" or ""
---@return nil
function set_prefixname(prefixname) end

---
---**Scoped: target**
---
---Set the postname of the target file
---
---[Open in browser](https://xmake.io/api/description/project-target#set-suffixname)
---
---@param suffixname string Target file suffix name string, such as "-d" or ""
---@return nil
function set_suffixname(suffixname) end

---
---**Scoped: target**
---
---Set the extension of the target file
---
---[Open in browser](https://xmake.io/api/description/project-target#set-extension)
---
---@param extension string Target file extension string, such as ".dll" or ".so"
---@return nil
function set_extension(extension) end

---
---**Scoped: target**
---
---Set compilation warning level
---
---[Open in browser](https://xmake.io/api/description/project-target#set-warnings)
---
---@param warnings string Warning level string, optional values: none, less, more, all, error
---@param opt table? Options (-----------, warnings, public\)
---@return nil
function set_warnings(warnings, opt) end

---
---**Scoped: target**
---
---Set competition optimization level
---
---[Open in browser](https://xmake.io/api/description/project-target#set-optimize)
---
---@param optimize string Optimization level string, optional values: none, fast, faster, fastest, smallest, aggressive
---@return nil
function set_optimize(optimize) end

---
---**Scoped: target**
---
---Set source code language standards
---
---[Open in browser](https://xmake.io/api/description/project-target#set-languages)
---
---@param languages string|string[] Language standard string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple language standard strings
---@param opt table? Options (-----------, languages, public\)
---@return nil
function set_languages(languages, ...) end

---
---**Scoped: target**
---
---Set float-point compilation mode
---
---[Open in browser](https://xmake.io/api/description/project-target#set-fpmodels)
---
---@param fpmodels string|string[] Float-point mode string or array, optional values: fast, strict, except, precise
---@param ... any Variable parameters, can pass multiple float-point mode strings
---@param opt table? Options (-----------, fpmodels, public\)
---@return nil
function set_fpmodels(fpmodels, ...) end

---
---**Scoped: target**
---
---Set output directories for target files
---
---[Open in browser](https://xmake.io/api/description/project-target#set-targetdir)
---
---@param dir string Target file output directory
---@param opt table? Target directory options
---@return nil
function set_targetdir(dir, opt) end

---
---**Scoped: target**
---
---Set output directories for object files
---
---[Open in browser](https://xmake.io/api/description/project-target#set-objectdir)
---
---@param dir string Object file output directory
---@return nil
function set_objectdir(dir) end

---
---**Scoped: target**
---
---Set output directories for dependent files
---
---[Open in browser](https://xmake.io/api/description/project-target#set-dependir)
---
---@param dir string Dependent file output directory
---@return nil
function set_dependir(dir) end

---
---**Scoped: target**
---
---Add imports modules for the custom script
---
---[Open in browser](https://xmake.io/api/description/project-target#add-imports)
---
---@param name string Module name
---@param ... string Module names
---@return nil
function add_imports(name, ...) end

---
---**Scoped: target**
---
---Add custom compilation rule to target
---
---[Open in browser](https://xmake.io/api/description/project-target#add-rules)
---
---@param rules string|string[] Rule name string or array, such as "markdown"
---@param ... any Variable parameters, can pass multiple rule name strings
---@param opt table? Options (-----------, rules, public\)
---@return nil
function add_rules(rules, ...) end

---
---**Scoped: target**
---
---Run custom load target configuration script
---
---[Open in browser](https://xmake.io/api/description/project-target#on-load)
---
---@param script fun(target: any) Load script function, receives target parameter
---@return nil
function on_load(script) end

---
---**Scoped: target**
---
---custom configuration script
---
---[Open in browser](https://xmake.io/api/description/project-target#on-config)
---
---@param script fun(target: any) Configuration script function, receives target parameter
---@return nil
function on_config(script) end

---
---**Scoped: target**
---
---Run custom prepare phase script
---
---[Open in browser](https://xmake.io/api/description/project-target#on-prepare)
---
---@param script fun(target: any, opt?: table) Prepare phase script function, receives target, opt parameters
---@return nil
function on_prepare(script) end

---
---**Scoped: target**
---
---Run custom prepare phase single file script
---
---[Open in browser](https://xmake.io/api/description/project-target#on-prepare-file)
---
---@param script fun(target: any, sourcefile: string, opt?: table) Single file processing script function, receives target, sourcefile, opt parameters
---@return nil
function on_prepare_file(script) end

---
---**Scoped: target**
---
---Run custom prepare phase batch files script
---
---[Open in browser](https://xmake.io/api/description/project-target#on-prepare-files)
---
---@param script fun(target: any, jobgraph: any, sourcebatch: any, opt?: table) Batch file processing script function, receives target, jobgraph, sourcebatch, opt parameters
---@param opt table? Options (-----------, script, jobgraph)
---@return nil
function on_prepare_files(script, opt) end

---
---**Scoped: target**
---
---Run custom link target script
---
---[Open in browser](https://xmake.io/api/description/project-target#on-link)
---
---@param script fun(target: any) Link script function, receives target parameter
---@return nil
function on_link(script) end

---
---**Scoped: target**
---
---Run custom build target script
---
---[Open in browser](https://xmake.io/api/description/project-target#on-build)
---
---@param script fun(target: any) Build script function, receives target parameter
---@return nil
function on_build(script) end

---
---**Scoped: target**
---
---Run custom build single file script
---
---[Open in browser](https://xmake.io/api/description/project-target#on-build-file)
---
---@param script fun(target: any, sourcefile: string, opt?: table) Single file build script function, receives target, sourcefile, opt parameters
---@return nil
function on_build_file(script) end

---
---**Scoped: target**
---
---Run custom build files script
---
---[Open in browser](https://xmake.io/api/description/project-target#on-build-files)
---
---@param script fun(target: any, sourcebatch: any, opt?: table) Multi-file build script function, receives target, sourcebatch, opt parameters
---@return nil
function on_build_files(script) end

---
---**Scoped: target**
---
---Run custom clean files script
---
---[Open in browser](https://xmake.io/api/description/project-target#on-clean)
---
---@param script fun(target: any) Clean script function, receives target parameter
---@return nil
function on_clean(script) end

---
---**Scoped: target**
---
---Run custom package target script
---
---[Open in browser](https://xmake.io/api/description/project-target#on-package)
---
---@param script fun(target: any) Package script function, receives target parameter
---@return nil
function on_package(script) end

---
---**Scoped: target**
---
---Run custom install target file script
---
---[Open in browser](https://xmake.io/api/description/project-target#on-install)
---
---@param script fun(target: any) Install script function, receives target parameter
---@return nil
function on_install(script) end

---
---**Scoped: target**
---
---Run custom uninstall target file script
---
---[Open in browser](https://xmake.io/api/description/project-target#on-uninstall)
---
---@param script fun(target: any) Uninstall script function, receives target parameter
---@return nil
function on_uninstall(script) end

---
---**Scoped: target**
---
---Run custom run target script
---
---[Open in browser](https://xmake.io/api/description/project-target#on-run)
---
---@param script fun(target: any) Run script function, receives target parameter
---@return nil
function on_run(script) end

---
---**Scoped: target**
---
---Run custom script before prepare phase
---
---[Open in browser](https://xmake.io/api/description/project-target#before-prepare)
---
---@param script fun(target: any) Before prepare script function, receives target parameter
---@return nil
function before_prepare(script) end

---
---**Scoped: target**
---
---Run custom script before prepare phase single file
---
---[Open in browser](https://xmake.io/api/description/project-target#before-prepare-file)
---
---@param script fun(target: any, sourcefile: string, opt?: table) Before prepare single file script function, receives target, sourcefile, opt parameters
---@return nil
function before_prepare_file(script) end

---
---**Scoped: target**
---
---Run custom script before prepare phase batch files
---
---[Open in browser](https://xmake.io/api/description/project-target#before-prepare-files)
---
---@param script fun(target: any, sourcebatch: any, opt?: table) Before prepare batch files script function, receives target, sourcebatch, opt parameters
---@return nil
function before_prepare_files(script) end

---
---**Scoped: target**
---
---Run custom script before linking target
---
---[Open in browser](https://xmake.io/api/description/project-target#before-link)
---
---@param script fun(target: any) Before link script function, receives target parameter
---@return nil
function before_link(script) end

---
---**Scoped: target**
---
---Run custom script before building target
---
---[Open in browser](https://xmake.io/api/description/project-target#before-build)
---
---@param script fun(target: any) Before build script function, receives target parameter
---@return nil
function before_build(script) end

---
---**Scoped: target**
---
---Run custom script before building single file
---
---[Open in browser](https://xmake.io/api/description/project-target#before-build-file)
---
---@param script fun(target: any, sourcefile: string, opt?: table) Before build single file script function, receives target, sourcefile, opt parameters
---@return nil
function before_build_file(script) end

---
---**Scoped: target**
---
---Run custom script before building files
---
---[Open in browser](https://xmake.io/api/description/project-target#before-build-files)
---
---@param script fun(target: any, sourcebatch: any, opt?: table) Before build files script function, receives target, sourcebatch, opt parameters
---@return nil
function before_build_files(script) end

---
---**Scoped: target**
---
---Run custom script before cleaning target
---
---[Open in browser](https://xmake.io/api/description/project-target#before-clean)
---
---@param script fun(target: any) Before clean script function, receives target parameter
---@return nil
function before_clean(script) end

---
---**Scoped: target**
---
---Run custom script before packaging target
---
---[Open in browser](https://xmake.io/api/description/project-target#before-package)
---
---@param script fun(target: any) Before package script function, receives target parameter
---@return nil
function before_package(script) end

---
---**Scoped: target**
---
---Run custom script before installing target
---
---[Open in browser](https://xmake.io/api/description/project-target#before-install)
---
---@param script fun(target: any) Before install script function, receives target parameter
---@return nil
function before_install(script) end

---
---**Scoped: target**
---
---Run custom script before uninstalling target
---
---[Open in browser](https://xmake.io/api/description/project-target#before-uninstall)
---
---@param script fun(target: any) Before uninstall script function, receives target parameter
---@return nil
function before_uninstall(script) end

---
---**Scoped: target**
---
---Run custom script before running target
---
---[Open in browser](https://xmake.io/api/description/project-target#before-run)
---
---@param script fun(target: any) Before run script function, receives target parameter
---@return nil
function before_run(script) end

---
---**Scoped: target**
---
---Run custom script after prepare phase
---
---[Open in browser](https://xmake.io/api/description/project-target#after-prepare)
---
---@param script fun(target: any) After prepare script function, receives target parameter
---@return nil
function after_prepare(script) end

---
---**Scoped: target**
---
---Run custom script after prepare phase single file
---
---[Open in browser](https://xmake.io/api/description/project-target#after-prepare-file)
---
---@param script fun(target: any, sourcefile: string, opt?: table) After prepare single file script function, receives target, sourcefile, opt parameters
---@return nil
function after_prepare_file(script) end

---
---**Scoped: target**
---
---Run custom script after prepare phase batch files
---
---[Open in browser](https://xmake.io/api/description/project-target#after-prepare-files)
---
---@param script fun(target: any, sourcebatch: any, opt?: table) After prepare batch files script function, receives target, sourcebatch, opt parameters
---@return nil
function after_prepare_files(script) end

---
---**Scoped: target**
---
---Run custom script after linking target
---
---[Open in browser](https://xmake.io/api/description/project-target#after-link)
---
---@param script fun(target: any) After link script function, receives target parameter
---@return nil
function after_link(script) end

---
---**Scoped: target**
---
---Run custom script after building target
---
---[Open in browser](https://xmake.io/api/description/project-target#after-build)
---
---@param script fun(target: any) After build script function, receives target parameter
---@return nil
function after_build(script) end

---
---**Scoped: target**
---
---Run custom script after building single file
---
---[Open in browser](https://xmake.io/api/description/project-target#after-build-file)
---
---@param script fun(target: any, sourcefile: string, opt?: table) After build single file script function, receives target, sourcefile, opt parameters
---@return nil
function after_build_file(script) end

---
---**Scoped: target**
---
---Run custom script after building files
---
---[Open in browser](https://xmake.io/api/description/project-target#after-build-files)
---
---@param script fun(target: any, sourcebatch: any, opt?: table) After build files script function, receives target, sourcebatch, opt parameters
---@return nil
function after_build_files(script) end

---
---**Scoped: target**
---
---Run custom script after cleaning target
---
---[Open in browser](https://xmake.io/api/description/project-target#after-clean)
---
---@param script fun(target: any) After clean script function, receives target parameter
---@return nil
function after_clean(script) end

---
---**Scoped: target**
---
---Run custom script after packaging target
---
---[Open in browser](https://xmake.io/api/description/project-target#after-package)
---
---@param script fun(target: any) After package script function, receives target parameter
---@return nil
function after_package(script) end

---
---**Scoped: target**
---
---Run custom script after installing target
---
---[Open in browser](https://xmake.io/api/description/project-target#after-install)
---
---@param script fun(target: any) After install script function, receives target parameter
---@return nil
function after_install(script) end

---
---**Scoped: target**
---
---Run custom script after uninstalling target
---
---[Open in browser](https://xmake.io/api/description/project-target#after-uninstall)
---
---@param script fun(target: any) After uninstall script function, receives target parameter
---@return nil
function after_uninstall(script) end

---
---**Scoped: target**
---
---Run custom script after running target
---
---[Open in browser](https://xmake.io/api/description/project-target#after-run)
---
---@param script fun(target: any) After run script function, receives target parameter
---@return nil
function after_run(script) end

---
---**Scoped: target**
---
---Set pre-compiled c header file
---
---[Open in browser](https://xmake.io/api/description/project-target#set-pcheader)
---
---@param header string C precompiled header file path string
---@return nil
function set_pcheader(header) end

---
---**Scoped: target**
---
---Set pre-compiled c++ header file
---
---[Open in browser](https://xmake.io/api/description/project-target#set-pcxxheader)
---
---@param header string C++ precompiled header file path string
---@return nil
function set_pcxxheader(header) end

---
---**Scoped: target**
---
---Set pre-compiled objc header file
---
---[Open in browser](https://xmake.io/api/description/project-target#set-pmheader)
---
---@param header string ObjC precompiled header file path string
---@return nil
function set_pmheader(header) end

---
---**Scoped: target**
---
---Set pre-compiled objc++ header file
---
---[Open in browser](https://xmake.io/api/description/project-target#set-pmxxheader)
---
---@param header string ObjC++ precompiled header file path string
---@return nil
function set_pmxxheader(header) end

---
---**Scoped: target**
---
---Add target dependencies
---
---[Open in browser](https://xmake.io/api/description/project-target#add-deps)
---
---@param deps string|string[] Dependency target name string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple dependency target name strings
---@param opt table? Options (-----------, inherit)
---@return nil
function add_deps(deps, ...) end

---
---**Scoped: target**
---
---Add link libraries
---
---[Open in browser](https://xmake.io/api/description/project-target#add-links)
---
---@param links string|string[] Link library name string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple link library name strings
---@param opt table? Options (-----------, links, public\)
---@return nil
function add_links(links, ...) end

---
---**Scoped: target**
---
---Add system link libraries
---
---[Open in browser](https://xmake.io/api/description/project-target#add-syslinks)
---
---@param syslinks string|string[] System link library name string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple system link library name strings
---@param opt table? Options (-----------, syslinks, public\)
---@return nil
function add_syslinks(syslinks, ...) end

---
---**Scoped: target**
---
---Adjust link order
---
---[Open in browser](https://xmake.io/api/description/project-target#add-linkorders)
---
---@param linkorders string|string[] Link order string or array, such as "dep1", "dep2"
---@param ... any Variable parameters, can pass multiple link order strings
---@return nil
function add_linkorders(linkorders, ...) end

---
---**Scoped: target**
---
---Add link group
---
---[Open in browser](https://xmake.io/api/description/project-target#add-linkgroups)
---
---@param linkgroups string|string[] Link group name string or array, such as "group1", "group2"
---@param ... any Variable parameters, can pass multiple link group name strings
---@param opt table? Options (-----------, linkgroups, public\)
---@return nil
function add_linkgroups(linkgroups, ...) end

---
---**Scoped: target**
---
---Add source files
---
---[Open in browser](https://xmake.io/api/description/project-target#add-files)
---
---@param files string|string[] File path string or file path array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple file path strings
---@param opt table? Options (-----------, defines, languages)
---@return nil
function add_files(files, ...) end

---
---**Scoped: target**
---
---Remove source files
---
---[Open in browser](https://xmake.io/api/description/project-target#remove-files)
---
---@param files string|string[] File path string or file path array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple file path strings
---@return nil
function remove_files(files, ...) end

---
---**Scoped: target**
---
---Remove the specified file from the preceding list of header files
---
---[Open in browser](https://xmake.io/api/description/project-target#remove-headerfiles)
---
---@param headerfiles string|string[] Header file path string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple header file path strings
---@return nil
function remove_headerfiles(headerfiles, ...) end

---
---**Scoped: target**
---
---Add link search directories
---
---[Open in browser](https://xmake.io/api/description/project-target#add-linkdirs)
---
---@param linkdirs string|string[] Link library search directory string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple link library search directory strings
---@param opt table? Options (-----------, linkdirs, public\)
---@return nil
function add_linkdirs(linkdirs, ...) end

---
---**Scoped: target**
---
---Add load search directories for dynamic libraries
---
---[Open in browser](https://xmake.io/api/description/project-target#add-rpathdirs)
---
---@param rpathdirs string|string[] Runtime library search directory string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple runtime library search directory strings
---@param opt table? Options (-----------, rpathdirs, public\)
---@return nil
function add_rpathdirs(rpathdirs, ...) end

---
---**Scoped: target**
---
---Add include search directories
---
---[Open in browser](https://xmake.io/api/description/project-target#add-includedirs)
---
---@param includedirs string|string[] Header file search directory string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple header file search directory strings
---@param opt table? Options (-----------, includedirs, public\)
---@return nil
function add_includedirs(includedirs, ...) end

---
---**Scoped: target**
---
---Add system header file search directory
---
---[Open in browser](https://xmake.io/api/description/project-target#add-sysincludedirs)
---
---@param includedirs string|string[] System header file search directory string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple system header file search directory strings
---@param opt table? Options (-----------, includedirs, public\)
---@return nil
function add_sysincludedirs(includedirs, ...) end

---
---**Scoped: target**
---
---Add #embed search directory
---
---[Open in browser](https://xmake.io/api/description/project-target#add-embeddirs)
---
---@param embeddirs string|string[] #embed search directory string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple #embed search directory strings
---@param opt table? Options (-----------, embeddirs, public\)
---@return nil
function add_embeddirs(embeddirs, ...) end

---
---**Scoped: target**
---
---Add macro definition
---
---[Open in browser](https://xmake.io/api/description/project-target#add-defines)
---
---@param defines string|string[] Macro definition string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple macro definition strings
---@param opt table? Options (-----------, defines, public\)
---@return nil
function add_defines(defines, ...) end

---
---**Scoped: target**
---
---Add macro undefinition
---
---[Open in browser](https://xmake.io/api/description/project-target#add-undefines)
---
---@param undefines string|string[] Macro definition name string or array, such as "DEBUG"
---@param ... any Variable parameters, can pass multiple macro definition name strings
---@param opt table? Options (-----------, undefines, public\)
---@return nil
function add_undefines(undefines, ...) end

---
---**Scoped: target**
---
---Add c compilation flags
---
---[Open in browser](https://xmake.io/api/description/project-target#add-cflags)
---
---@param cflags string|string[] C compilation option string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple C compilation option strings
---@param opt table? Options (-----------, cflags, public\)
---@return nil
function add_cflags(cflags, ...) end

---
---**Scoped: target**
---
---Add c/c++ compilation flags
---
---[Open in browser](https://xmake.io/api/description/project-target#add-cxflags)
---
---@param flag string C/C++ compilation flag
---@param ... string C/C++ compilation flags
---@return nil
function add_cxflags(flag, ...) end

---
---**Scoped: target**
---
---Add c++ compilation flags
---
---[Open in browser](https://xmake.io/api/description/project-target#add-cxxflags)
---
---@param cxxflags string|string[] C++ compilation option string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple C++ compilation option strings
---@param opt table? Options (-----------, cxxflags, public\)
---@return nil
function add_cxxflags(cxxflags, ...) end

---
---**Scoped: target**
---
---Add objc compilation flags
---
---[Open in browser](https://xmake.io/api/description/project-target#add-mflags)
---
---@param mflags string|string[] ObjC compilation option string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple ObjC compilation option strings
---@param opt table? Options (-----------, mflags, public\)
---@return nil
function add_mflags(mflags, ...) end

---
---**Scoped: target**
---
---Add objc/objc++ compilation flags
---
---[Open in browser](https://xmake.io/api/description/project-target#add-mxflags)
---
---@param mxflags string|string[] ObjC/ObjC++ compilation option string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple ObjC/ObjC++ compilation option strings
---@param opt table? Options (-----------, mxflags, public\)
---@return nil
function add_mxflags(mxflags, ...) end

---
---**Scoped: target**
---
---Add objc++ compilation flags
---
---[Open in browser](https://xmake.io/api/description/project-target#add-mxxflags)
---
---@param mxxflags string|string[] ObjC++ compilation option string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple ObjC++ compilation option strings
---@param opt table? Options (-----------, mxxflags, public\)
---@return nil
function add_mxxflags(mxxflags, ...) end

---
---**Scoped: target**
---
---Add swift compilation flags
---
---[Open in browser](https://xmake.io/api/description/project-target#add-scflags)
---
---@param scflags string|string[] Swift compilation option string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple Swift compilation option strings
---@param opt table? Options (-----------, scflags, public\)
---@return nil
function add_scflags(scflags, ...) end

---
---**Scoped: target**
---
---Add asm compilation flags
---
---[Open in browser](https://xmake.io/api/description/project-target#add-asflags)
---
---@param asflags string|string[] Assembly compilation option string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple assembly compilation option strings
---@param opt table? Options (-----------, asflags, public\)
---@return nil
function add_asflags(asflags, ...) end

---
---**Scoped: target**
---
---Add go compilation flags
---
---[Open in browser](https://xmake.io/api/description/project-target#add-gcflags)
---
---@param gcflags string|string[] Go compilation option string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple Go compilation option strings
---@param opt table? Options (-----------, gcflags, public\)
---@return nil
function add_gcflags(gcflags, ...) end

---
---**Scoped: target**
---
---Add dlang compilation flags
---
---[Open in browser](https://xmake.io/api/description/project-target#add-dcflags)
---
---@param dcflags string|string[] D language compilation option string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple D language compilation option strings
---@param opt table? Options (-----------, dcflags, public\)
---@return nil
function add_dcflags(dcflags, ...) end

---
---**Scoped: target**
---
---Add rust compilation flags
---
---[Open in browser](https://xmake.io/api/description/project-target#add-rcflags)
---
---@param rcflags string|string[] Rust compilation option string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple Rust compilation option strings
---@param opt table? Options (-----------, rcflags, public\)
---@return nil
function add_rcflags(rcflags, ...) end

---
---**Scoped: target**
---
---Add fortran compilation flags
---
---[Open in browser](https://xmake.io/api/description/project-target#add-fcflags)
---
---@param fcflags string|string[] Fortran compilation option string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple Fortran compilation option strings
---@param opt table? Options (-----------, fcflags, public\)
---@return nil
function add_fcflags(fcflags, ...) end

---
---**Scoped: target**
---
---Add zig compilation flags
---
---[Open in browser](https://xmake.io/api/description/project-target#add-zcflags)
---
---@param zcflags string|string[] Zig compilation option string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple Zig compilation option strings
---@param opt table? Options (-----------, zcflags, public\)
---@return nil
function add_zcflags(zcflags, ...) end

---
---**Scoped: target**
---
---Add cuda compilation flags
---
---[Open in browser](https://xmake.io/api/description/project-target#add-cuflags)
---
---@param cuflags string|string[] CUDA compilation option string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple CUDA compilation option strings
---@param opt table? Options (-----------, cuflags, public\)
---@return nil
function add_cuflags(cuflags, ...) end

---
---**Scoped: target**
---
---Add cuda device link flags
---
---[Open in browser](https://xmake.io/api/description/project-target#add-culdflags)
---
---@param culdflags string|string[] CUDA device link option string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple CUDA device link option strings
---@param opt table? Options (-----------, culdflags, public\)
---@return nil
function add_culdflags(culdflags, ...) end

---
---**Scoped: target**
---
---Add gencode settings for cuda devices
---
---[Open in browser](https://xmake.io/api/description/project-target#add-cugencodes)
---
---@param cugencodes string|string[] CUDA device gencode setting string or array, such as "sm_30", "sm_50"
---@param ... any Variable parameters, can pass multiple CUDA device gencode setting strings
---@param opt table? Options (-----------, cugencodes, public\)
---@return nil
function add_cugencodes(cugencodes, ...) end

---
---**Scoped: target**
---
---Add NPU architectures for Huawei Ascend C
---
---[Open in browser](https://xmake.io/api/description/project-target#add-ascnpuarchs)
---
---@param archs string|string[] Ascend NPU architecture string or array, such as "dav-2201"
---@param ... any Variable parameters, can pass multiple NPU architecture strings
---@return nil
function add_ascnpuarchs(archs, ...) end

---
---**Scoped: target**
---
---Add static library link flags
---
---[Open in browser](https://xmake.io/api/description/project-target#add-ldflags)
---
---@param ldflags string|string[] Link option string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple link option strings
---@param opt table? Options (-----------, ldflags, public\)
---@return nil
function add_ldflags(ldflags, ...) end

---
---**Scoped: target**
---
---Add archive library flags
---
---[Open in browser](https://xmake.io/api/description/project-target#add-arflags)
---
---@param arflags string|string[] Static library archive option string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple static library archive option strings
---@param opt table? Options (-----------, arflags, public\)
---@return nil
function add_arflags(arflags, ...) end

---
---**Scoped: target**
---
---Add dynamic library link flags
---
---[Open in browser](https://xmake.io/api/description/project-target#add-shflags)
---
---@param shflags string|string[] Dynamic library link option string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple dynamic library link option strings
---@param opt table? Options (-----------, shflags, public\)
---@return nil
function add_shflags(shflags, ...) end

---
---**Scoped: target**
---
---Add option dependencies
---
---[Open in browser](https://xmake.io/api/description/project-target#add-options)
---
---@param name string Option name
---@param ... string Option names
---@return nil
function add_options(name, ...) end

---
---**Scoped: target**
---
---Add package dependencies
---
---[Open in browser](https://xmake.io/api/description/project-target#add-packages)
---
---@param packages string|string[] Package name string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple package name strings
---@param opt table? Options (-----------, packages, public\)
---@return nil
function add_packages(packages, ...) end

---
---**Scoped: target**
---
---Add language standards
---
---[Open in browser](https://xmake.io/api/description/project-target#add-languages)
---
---@param languages string|string[] Language standard string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple language standard strings
---@param opt table? Options (-----------, languages)
---@return nil
function add_languages(languages, ...) end

---
---**Scoped: target**
---
---Add vector extensions
---
---[Open in browser](https://xmake.io/api/description/project-target#add-vectorexts)
---
---@param vectorexts string|string[] Vector extension instruction string or array, such as "mmx", "neon", "avx"
---@param ... any Variable parameters, can pass multiple vector extension instruction strings
---@param opt table? Options (-----------, vectorexts, public\)
---@return nil
function add_vectorexts(vectorexts, ...) end

---
---**Scoped: target**
---
---Add frameworks
---
---[Open in browser](https://xmake.io/api/description/project-target#add-frameworks)
---
---@param frameworks string|string[] Framework name string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple framework name strings
---@param opt table? Options (-----------, frameworks, public\)
---@return nil
function add_frameworks(frameworks, ...) end

---
---**Scoped: target**
---
---Add framework search directories
---
---[Open in browser](https://xmake.io/api/description/project-target#add-frameworkdirs)
---
---@param frameworkdirs string|string[] Framework search directory string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple framework search directory strings
---@param opt table? Options (-----------, frameworkdirs, public\)
---@return nil
function add_frameworkdirs(frameworkdirs, ...) end

---
---**Scoped: target**
---
---Set toolset
---
---[Open in browser](https://xmake.io/api/description/project-target#set-toolset)
---
---@param toolname string Tool name string, such as "cc", "cxx", "ld", "ar"
---@param tool string Tool path string, such as "/usr/bin/gcc"
---@return nil
function set_toolset(toolname, tool) end

---
---**Scoped: target**
---
---Set up the toolchain
---
---[Open in browser](https://xmake.io/api/description/project-target#set-toolchains)
---
---@param toolchains string|string[] Toolchain name string or array, such as "gcc", "clang", "msvc", "ndk[gcc]", "mingw[clang]@llvm-mingw", "msvc[vs=2025]"
---@param ... any Variable parameters, can pass multiple toolchain name strings
---@param opt table? Options (-----------, toolchains, vs)
---@return nil
function set_toolchains(toolchains, ...) end

---
---**Scoped: target**
---
---Set the compilation platform for the specified target
---
---[Open in browser](https://xmake.io/api/description/project-target#set-plat)
---
---@param plat string Platform name string, such as "linux", "macosx", "windows", "android"
---@return nil
function set_plat(plat) end

---
---**Scoped: target**
---
---Set the compilation architecture of the specified target
---
---[Open in browser](https://xmake.io/api/description/project-target#set-arch)
---
---@param arch string Architecture name string, such as "x86", "x64", "arm64", "armv7"
---@return nil
function set_arch(arch) end

---
---**Scoped: target**
---
---Set custom configuration values
---
---[Open in browser](https://xmake.io/api/description/project-target#set-values)
---
---@param name string Configuration name string, such as "markdown_flags"
---@param values any Configuration value, can be any type
---@param ... any Variable parameters, can pass multiple configuration values
---@return nil
function set_values(name, values, ...) end

---
---**Scoped: target**
---
---Add custom configuration values
---
---[Open in browser](https://xmake.io/api/description/project-target#add-values)
---
---@param name string Configuration name string, such as "markdown_flags"
---@param values any Configuration value, can be any type
---@param ... any Variable parameters, can pass multiple configuration values
---@return nil
function add_values(name, values, ...) end

---
---**Scoped: target**
---
---Set the running directory
---
---[Open in browser](https://xmake.io/api/description/project-target#set-rundir)
---
---@param rundir string Running directory path string
---@return nil
function set_rundir(rundir) end

---
---**Scoped: target**
---
---Set the list of run parameters
---
---[Open in browser](https://xmake.io/api/description/project-target#set-runargs)
---
---@param runargs string|string[] Run argument string or array, such as "-x", "--arg1=val"
---@param ... any Variable parameters, can pass multiple run argument strings
---@return nil
function set_runargs(runargs, ...) end

---
---**Scoped: target**
---
---Add runtime environment variables
---
---[Open in browser](https://xmake.io/api/description/project-target#add-runenvs)
---
---@param name string Environment variable name string, such as "PATH", "LD_LIBRARY_PATH"
---@param values string|string[] Environment variable value string or array, supports multiple values
---@param ... any Variable parameters, can pass multiple environment variable values
---@return nil
function add_runenvs(name, values, ...) end

---
---**Scoped: target**
---
---Set the runtime environment variable
---
---[Open in browser](https://xmake.io/api/description/project-target#set-runenv)
---
---@param name string Environment variable name string, such as "PATH", "LD_LIBRARY_PATH"
---@param value string Environment variable value string
---@return nil
function set_runenv(name, value) end

---
---**Scoped: target**
---
---Set the installation directory
---
---[Open in browser](https://xmake.io/api/description/project-target#set-installdir)
---
---@param installdir string Installation directory path string
---@return nil
function set_installdir(installdir) end

---
---**Scoped: target**
---
---Set the installation prefix subdirectory
---
---[Open in browser](https://xmake.io/api/description/project-target#set-prefixdir)
---
---@param prefixdir string Installation prefix subdirectory path string
---@return nil
function set_prefixdir(prefixdir) end

---
---**Scoped: target**
---
---Add installation files
---
---[Open in browser](https://xmake.io/api/description/project-target#add-installfiles)
---
---@param installfiles string|string[] Installation file path string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple installation file path strings
---@param opt table? Options (-----------, installfiles, prefixdir)
---@return nil
function add_installfiles(installfiles, ...) end

---
---**Scoped: target**
---
---Add header files
---
---[Open in browser](https://xmake.io/api/description/project-target#add-headerfiles)
---
---@param headerfiles string|string[] Header file path string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple header file path strings
---@param opt table? Options (-----------, headerfiles, prefixdir)
---@return nil
function add_headerfiles(headerfiles, ...) end

---
---**Scoped: target**
---
---Set the output directory of configuration files
---
---[Open in browser](https://xmake.io/api/description/project-target#set-configdir)
---
---@param configdir string Template configuration file output directory path string
---@return nil
function set_configdir(configdir) end

---
---**Scoped: target**
---
---Set template configuration variables
---
---[Open in browser](https://xmake.io/api/description/project-target#set-configvar)
---
---@param name string Configuration variable name string, such as "HAS_FOO"
---@param value any Configuration variable value, can be any type
---@return nil
function set_configvar(name, value) end

---
---**Scoped: target**
---
---Add template configuration files
---
---[Open in browser](https://xmake.io/api/description/project-target#add-configfiles)
---
---@param configfiles string|string[] Configuration file path string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple configuration file path strings
---@param opt table? Options (-----------, configfiles, prefixdir)
---@return nil
function add_configfiles(configfiles, ...) end

---
---**Scoped: target**
---
---Set build policy
---
---[Open in browser](https://xmake.io/api/description/project-target#set-policy)
---
---@param policy string Policy name string, such as "check.auto_ignore_flags", "build.warning"
---@param value boolean Policy value, true means enable, false means disable
---@return nil
function set_policy(policy, value) end

---
---**Scoped: target**
---
---Set the runtime library of the compilation target
---
---[Open in browser](https://xmake.io/api/description/project-target#set-runtimes)
---
---@param runtimes string|string[] Runtime library string or array, such as "MT", "MD", "MTd", "MDd"
---@param ... any Variable parameters, can pass multiple runtime library strings
---@return nil
function set_runtimes(runtimes, ...) end

---
---**Scoped: target**
---
---Set target group
---
---[Open in browser](https://xmake.io/api/description/project-target#set-group)
---
---@param group string Group name string, such as "test", "libs", "tools"
---@return nil
function set_group(group) end

---
---**Scoped: target**
---
---Add Source file groups
---
---[Open in browser](https://xmake.io/api/description/project-target#add-filegroups)
---
---@param name string Group name string, such as "source", "header", "test"
---@param files string|string[] Source file path string or array, supports wildcard matching patterns
---@param ... any Variable parameters, can pass multiple source file path strings
---@return nil
function add_filegroups(name, files, ...) end

---
---**Scoped: target**
---
---Enabling or disabling exceptions
---
---[Open in browser](https://xmake.io/api/description/project-target#set-exceptions)
---
---@param exceptions string|string[] Exception mode string or array, such as "cxx", "objc", "no-cxx"
---@param ... any Variable parameters, can pass multiple exception mode strings
---@return nil
function set_exceptions(exceptions, ...) end

---
---**Scoped: target**
---
---Set encodings
---
---[Open in browser](https://xmake.io/api/description/project-target#set-encodings)
---
---@param encodings string|string[] Encoding string or array, such as "utf-8", "gb2312"
---@param ... any Variable parameters, can pass multiple encoding strings
---@return nil
function set_encodings(encodings, ...) end

---
---**Scoped: target**
---
---forceincludes
---
---[Open in browser](https://xmake.io/api/description/project-target#add-forceincludes)
---
---@param includes string|string[] Header file path string or array, such as "config.h"
---@param ... any Variable parameters, can pass multiple header file path strings
---@param opt table? Options (-----------, includes, public\)
---@return nil
function add_forceincludes(includes, ...) end

---
---**Scoped: target**
---
---Adding Extra Files
---
---[Open in browser](https://xmake.io/api/description/project-target#add-extrafiles)
---
---@param extrafiles string|string[] Extra file path string or array, such as "assets/other.txt"
---@param ... any Variable parameters, can pass multiple extra file path strings
---@return nil
function add_extrafiles(extrafiles, ...) end

---
---**Scoped: target**
---
---Add test case
---
---[Open in browser](https://xmake.io/api/description/project-target#add-tests)
---
---@param tests string|string[] Test case name string or array, such as "test1", "test2"
---@param ... any Other test configuration parameters, optional
---@param opt table? Options (-----------, tests, runargs)
---@return nil
function add_tests(tests, ...) end
