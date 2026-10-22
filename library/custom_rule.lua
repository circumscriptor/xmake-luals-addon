---@meta
---[custom_rule](https://xmake.io/api/description/custom-rule)

---
---**Scoped: rule**
---
---- Defining rules
---
---[Open in browser](https://xmake.io/api/description/custom-rule#rule)
---
---@param name string Rule name string
---@param opt? RuleAttr|fun() Configuration options
---@return nil
function rule(name, opt) end

---
---**Scoped: rule**
---
---- Adding rule dependencies
---
---[Open in browser](https://xmake.io/api/description/custom-rule#add-deps)
---
---@param deps string|string[] Dependency rule name string or array
---@param ... string|RuleDependencyOption Variable parameters, can pass multiple dependency names
---@return nil
function add_deps(deps, ...) end

---
---**Scoped: rule**
---
---- Add imported modules for all custom scripts
---
---[Open in browser](https://xmake.io/api/description/custom-rule#add-imports)
---
---@param modules string|string[] Module name string or array
---@param ... any Variable parameters, can pass multiple module names
---@return nil
function add_imports(modules, ...) end

---
---**Scoped: rule**
---
---- Setting the file extension type supported by the rule
---
---[Open in browser](https://xmake.io/api/description/custom-rule#set-extensions)
---
---@param extensions string|string[] File extension string or array
---@param ... any Variable parameters, can pass multiple extensions
---@return nil
function set_extensions(extensions, ...) end

---
---**Scoped: rule**
---
---- Custom load script
---
---[Open in browser](https://xmake.io/api/description/custom-rule#on-load)
---
---@param script fun(target: any, ...: any) Load script function with target parameter
---@return nil
function on_load(script) end

---
---**Scoped: rule**
---
---- custom configuration script
---
---[Open in browser](https://xmake.io/api/description/custom-rule#on-config)
---
---@param script fun(target: any, ...: any) Configuration script function with target parameter
---@return nil
function on_config(script) end

---
---**Scoped: rule**
---
---- Custom link script
---
---[Open in browser](https://xmake.io/api/description/custom-rule#on-link)
---
---@param script fun(target: any, ...: any) Link script function with target parameter
---@return nil
function on_link(script) end

---
---**Scoped: rule**
---
---- Custom compilation script
---
---[Open in browser](https://xmake.io/api/description/custom-rule#on-build)
---
---@param script fun(target: any, ...: any) Build script function with target parameter
---@return nil
function on_build(script) end

---
---**Scoped: rule**
---
---- Custom cleanup script
---
---[Open in browser](https://xmake.io/api/description/custom-rule#on-clean)
---
---@param script fun(target: any, ...: any) Clean script function with target parameter
---@return nil
function on_clean(script) end

---
---**Scoped: rule**
---
---- Custom packaging script
---
---[Open in browser](https://xmake.io/api/description/custom-rule#on-package)
---
---@param script fun(target: any, ...: any) Package script function with target parameter
---@return nil
function on_package(script) end

---
---**Scoped: rule**
---
---- Custom installation script
---
---[Open in browser](https://xmake.io/api/description/custom-rule#on-install)
---
---@param script fun(target: any, ...: any) Install script function with target parameter
---@return nil
function on_install(script) end

---
---**Scoped: rule**
---
---- Custom Uninstall Script
---
---[Open in browser](https://xmake.io/api/description/custom-rule#on-uninstall)
---
---@param script fun(target: any, ...: any) Uninstall script function with target parameter
---@return nil
function on_uninstall(script) end

---
---**Scoped: rule**
---
---- Customizing the build script to process one source file at a time
---
---[Open in browser](https://xmake.io/api/description/custom-rule#on-build-file)
---
---@param script fun(target: any, ...: any) Build file script function with target, sourcefile and opt parameters
---@return nil
function on_build_file(script) end

---
---**Scoped: rule**
---
---- Custom batch compile script, process one source file at a time
---
---[Open in browser](https://xmake.io/api/description/custom-rule#on-buildcmd-file)
---
---@param script fun(target: any, ...: any) Build command file script function with target, batchcmds, sourcefile and opt parameters
---@return nil
function on_buildcmd_file(script) end

---
---**Scoped: rule**
---
---- Customizing the build script to process multiple source files at once
---
---[Open in browser](https://xmake.io/api/description/custom-rule#on-build-files)
---
---@param script fun(target: any, ...: any) Build files script function with target, sourcebatch and opt parameters
---@return nil
function on_build_files(script) end

---
---**Scoped: rule**
---
---- Customize batch compiling script, process multiple source files at once
---
---[Open in browser](https://xmake.io/api/description/custom-rule#on-buildcmd-files)
---
---@param script fun(target: any, ...: any) Build command files script function with target, batchcmds, sourcebatch and opt parameters
---@return nil
function on_buildcmd_files(script) end

---
---**Scoped: rule**
---
---- Custom pre-configuration script
---
---[Open in browser](https://xmake.io/api/description/custom-rule#before-config)
---
---@param script fun(target: any, ...: any) Before config script function with target parameter
---@return nil
function before_config(script) end

---
---**Scoped: rule**
---
---- Custom pre-link script
---
---[Open in browser](https://xmake.io/api/description/custom-rule#before-link)
---
---@param script fun(target: any, ...: any) Before link script function with target parameter
---@return nil
function before_link(script) end

---
---**Scoped: rule**
---
---- Custom pre-compilation script
---
---[Open in browser](https://xmake.io/api/description/custom-rule#before-build)
---
---@param script fun(target: any, ...: any) Before build script function with target parameter
---@return nil
function before_build(script) end

---
---**Scoped: rule**
---
---- Custom pre-cleanup script
---
---[Open in browser](https://xmake.io/api/description/custom-rule#before-clean)
---
---@param script fun(target: any, ...: any) Before clean script function with target parameter
---@return nil
function before_clean(script) end

---
---**Scoped: rule**
---
---- Custom the pre-package script
---
---[Open in browser](https://xmake.io/api/description/custom-rule#before-package)
---
---@param script fun(target: any, ...: any) Before package script function with target parameter
---@return nil
function before_package(script) end

---
---**Scoped: rule**
---
---- Custom pre-installation script
---
---[Open in browser](https://xmake.io/api/description/custom-rule#before-install)
---
---@param script fun(target: any, ...: any) Before install script function with target parameter
---@return nil
function before_install(script) end

---
---**Scoped: rule**
---
---- Custom pre-uninstall script
---
---[Open in browser](https://xmake.io/api/description/custom-rule#before-uninstall)
---
---@param script fun(target: any, ...: any) Before uninstall script function with target parameter
---@return nil
function before_uninstall(script) end

---
---**Scoped: rule**
---
---- Custom pre-compilation script to process one source file at a time
---
---[Open in browser](https://xmake.io/api/description/custom-rule#before-build-file)
---
---@param script fun(target: any, ...: any) Before build file script function with target, sourcefile and opt parameters
---@return nil
function before_build_file(script) end

---
---**Scoped: rule**
---
---- Customize the pre-compilation batch script, process one source file at a time
---
---[Open in browser](https://xmake.io/api/description/custom-rule#before-buildcmd-file)
---
---@param script fun(target: any, ...: any) Before build command file script function with target, batchcmds, sourcefile and opt parameters
---@return nil
function before_buildcmd_file(script) end

---
---**Scoped: rule**
---
---- Customize pre-compilation scripts to process multiple source files at once
---
---[Open in browser](https://xmake.io/api/description/custom-rule#before-build-files)
---
---@param script fun(target: any, ...: any) Before build files script function with target, sourcebatch and opt parameters
---@return nil
function before_build_files(script) end

---
---**Scoped: rule**
---
---- Customize the pre-compilation batch script to process multiple source files at once
---
---[Open in browser](https://xmake.io/api/description/custom-rule#before-buildcmd-files)
---
---@param script fun(target: any, ...: any) Before build command files script function with target, batchcmds, sourcebatch and opt parameters
---@return nil
function before_buildcmd_files(script) end

---
---**Scoped: rule**
---
---- Custom post-configuration script
---
---[Open in browser](https://xmake.io/api/description/custom-rule#after-config)
---
---@param script fun(target: any, ...: any) After config script function with target parameter
---@return nil
function after_config(script) end

---
---**Scoped: rule**
---
---- Custom post-linking script
---
---[Open in browser](https://xmake.io/api/description/custom-rule#after-link)
---
---@param script fun(target: any, ...: any) After link script function with target parameter
---@return nil
function after_link(script) end

---
---**Scoped: rule**
---
---- Custom post-compilation script
---
---[Open in browser](https://xmake.io/api/description/custom-rule#after-build)
---
---@param script fun(target: any, ...: any) After build script function with target parameter
---@return nil
function after_build(script) end

---
---**Scoped: rule**
---
---- Custom post-cleaning script
---
---[Open in browser](https://xmake.io/api/description/custom-rule#after-clean)
---
---@param script fun(target: any, ...: any) After clean script function with target parameter
---@return nil
function after_clean(script) end

---
---**Scoped: rule**
---
---- Custom post-packaging script
---
---[Open in browser](https://xmake.io/api/description/custom-rule#after-package)
---
---@param script fun(target: any, ...: any) After package script function with target parameter
---@return nil
function after_package(script) end

---
---**Scoped: rule**
---
---- Custom post-installation script
---
---[Open in browser](https://xmake.io/api/description/custom-rule#after-install)
---
---@param script fun(target: any, ...: any) After install script function with target parameter
---@return nil
function after_install(script) end

---
---**Scoped: rule**
---
---- Custom post-uninstallation Script
---
---[Open in browser](https://xmake.io/api/description/custom-rule#after-uninstall)
---
---@param script fun(target: any, ...: any) After uninstall script function with target parameter
---@return nil
function after_uninstall(script) end

---
---**Scoped: rule**
---
---- Custom post-compilation scripts to process one source file at a time
---
---[Open in browser](https://xmake.io/api/description/custom-rule#after-build-file)
---
---@param script fun(target: any, ...: any) After build file script function with target, sourcefile and opt parameters
---@return nil
function after_build_file(script) end

---
---**Scoped: rule**
---
---- Customize the compiled batch script, process one source file at a time
---
---[Open in browser](https://xmake.io/api/description/custom-rule#after-buildcmd-file)
---
---@param script fun(target: any, ...: any) After build command file script function with target, batchcmds, sourcefile and opt parameters
---@return nil
function after_buildcmd_file(script) end

---
---**Scoped: rule**
---
---- Customize the compiled script to process multiple source files at once
---
---[Open in browser](https://xmake.io/api/description/custom-rule#after-build-files)
---
---@param script fun(target: any, ...: any) After build files script function with target, sourcebatch and opt parameters
---@return nil
function after_build_files(script) end

---
---**Scoped: rule**
---
---- Customize the compiled batch script to process multiple source files at once
---
---[Open in browser](https://xmake.io/api/description/custom-rule#after-buildcmd-files)
---
---@param script fun(target: any, ...: any) After build command files script function with target, batchcmds, sourcebatch and opt parameters
---@return nil
function after_buildcmd_files(script) end

---
---**Scoped: rule**
---
---- End definition rules
---
---[Open in browser](https://xmake.io/api/description/custom-rule#rule-end)
---
---@return nil
function rule_end() end
