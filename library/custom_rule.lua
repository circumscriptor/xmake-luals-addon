---@meta
---[custom_rule](https://xmake.io/api/description/custom-rule)

---
---[Open in browser](https://xmake.io/api/description/custom-rule#rule)
---
---@param name string Rule name string
---@return nil
function rule(name) end

---
---**Scoped: rule**
---
---[Open in browser](https://xmake.io/api/description/custom-rule#add-deps)
---
---@param deps string|string[] Dependency rule name string or array
---@param ... any Variable parameters, can pass multiple dependency names
---@param opt table? Options (-----------, order)
---@return nil
function add_deps(deps, ...) end

---
---**Scoped: rule**
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
---[Open in browser](https://xmake.io/api/description/custom-rule#set-extensions)
---
---@param extensions string|string[] File extension string or array
---@param ... any Variable parameters, can pass multiple extensions
---@return nil
function set_extensions(extensions, ...) end

---
---**Scoped: rule**
---
---[Open in browser](https://xmake.io/api/description/custom-rule#on-load)
---
---@param script fun(target: any) Load script function with target parameter
---@return nil
function on_load(script) end

---
---**Scoped: rule**
---
---[Open in browser](https://xmake.io/api/description/custom-rule#on-config)
---
---@param script fun(target: any) Configuration script function with target parameter
---@return nil
function on_config(script) end

---
---**Scoped: rule**
---
---[Open in browser](https://xmake.io/api/description/custom-rule#on-link)
---
---@param script fun(target: any) Link script function with target parameter
---@return nil
function on_link(script) end

---
---**Scoped: rule**
---
---[Open in browser](https://xmake.io/api/description/custom-rule#on-build)
---
---@param script fun(target: any) Build script function with target parameter
---@return nil
function on_build(script) end

---
---**Scoped: rule**
---
---[Open in browser](https://xmake.io/api/description/custom-rule#on-clean)
---
---@param script fun(target: any) Clean script function with target parameter
---@return nil
function on_clean(script) end

---
---**Scoped: rule**
---
---[Open in browser](https://xmake.io/api/description/custom-rule#on-package)
---
---@param script fun(target: any) Package script function with target parameter
---@return nil
function on_package(script) end

---
---**Scoped: rule**
---
---[Open in browser](https://xmake.io/api/description/custom-rule#on-install)
---
---@param script fun(target: any) Install script function with target parameter
---@return nil
function on_install(script) end

---
---**Scoped: rule**
---
---[Open in browser](https://xmake.io/api/description/custom-rule#on-uninstall)
---
---@param script fun(target: any) Uninstall script function with target parameter
---@return nil
function on_uninstall(script) end

---
---**Scoped: rule**
---
---[Open in browser](https://xmake.io/api/description/custom-rule#on-build-file)
---
---@param script fun(target: any, sourcefile: string, opt?: table) Build file script function with target, sourcefile and opt parameters
---@return nil
function on_build_file(script) end

---
---**Scoped: rule**
---
---batchcmds:call <Badge type="tip" text="v3.1.0" />
---
---[Open in browser](https://xmake.io/api/description/custom-rule#on-buildcmd-file)
---
---@param script fun(target: any, batchcmds: any, sourcefile: string, opt?: table) Build command file script function with target, batchcmds, sourcefile and opt parameters
---@return nil
function on_buildcmd_file(script) end

---
---**Scoped: rule**
---
---[Open in browser](https://xmake.io/api/description/custom-rule#on-build-files)
---
---@param script fun(target: any, sourcebatch: any, opt?: table) Build files script function with target, sourcebatch and opt parameters
---@return nil
function on_build_files(script) end

---
---**Scoped: rule**
---
---[Open in browser](https://xmake.io/api/description/custom-rule#on-buildcmd-files)
---
---@param script fun(target: any, batchcmds: any, sourcebatch: any, opt?: table) Build command files script function with target, batchcmds, sourcebatch and opt parameters
---@return nil
function on_buildcmd_files(script) end

---
---**Scoped: rule**
---
---[Open in browser](https://xmake.io/api/description/custom-rule#before-config)
---
---@param script fun(target: any) Before config script function with target parameter
---@return nil
function before_config(script) end

---
---**Scoped: rule**
---
---[Open in browser](https://xmake.io/api/description/custom-rule#before-link)
---
---@param script fun(target: any) Before link script function with target parameter
---@return nil
function before_link(script) end

---
---**Scoped: rule**
---
---[Open in browser](https://xmake.io/api/description/custom-rule#before-build)
---
---@param script fun(target: any) Before build script function with target parameter
---@return nil
function before_build(script) end

---
---**Scoped: rule**
---
---[Open in browser](https://xmake.io/api/description/custom-rule#before-clean)
---
---@param script fun(target: any) Before clean script function with target parameter
---@return nil
function before_clean(script) end

---
---**Scoped: rule**
---
---[Open in browser](https://xmake.io/api/description/custom-rule#before-package)
---
---@param script fun(target: any) Before package script function with target parameter
---@return nil
function before_package(script) end

---
---**Scoped: rule**
---
---[Open in browser](https://xmake.io/api/description/custom-rule#before-install)
---
---@param script fun(target: any) Before install script function with target parameter
---@return nil
function before_install(script) end

---
---**Scoped: rule**
---
---[Open in browser](https://xmake.io/api/description/custom-rule#before-uninstall)
---
---@param script fun(target: any) Before uninstall script function with target parameter
---@return nil
function before_uninstall(script) end

---
---**Scoped: rule**
---
---[Open in browser](https://xmake.io/api/description/custom-rule#before-build-file)
---
---@param script fun(target: any, sourcefile: string, opt?: table) Before build file script function with target, sourcefile and opt parameters
---@return nil
function before_build_file(script) end

---
---**Scoped: rule**
---
---[Open in browser](https://xmake.io/api/description/custom-rule#before-buildcmd-file)
---
---@param script fun(target: any, batchcmds: any, sourcefile: string, opt?: table) Before build command file script function with target, batchcmds, sourcefile and opt parameters
---@return nil
function before_buildcmd_file(script) end

---
---**Scoped: rule**
---
---[Open in browser](https://xmake.io/api/description/custom-rule#before-build-files)
---
---@param script fun(target: any, sourcebatch: any, opt?: table) Before build files script function with target, sourcebatch and opt parameters
---@return nil
function before_build_files(script) end

---
---**Scoped: rule**
---
---[Open in browser](https://xmake.io/api/description/custom-rule#before-buildcmd-files)
---
---@param script fun(target: any, batchcmds: any, sourcebatch: any, opt?: table) Before build command files script function with target, batchcmds, sourcebatch and opt parameters
---@return nil
function before_buildcmd_files(script) end

---
---**Scoped: rule**
---
---[Open in browser](https://xmake.io/api/description/custom-rule#after-config)
---
---@param script fun(target: any) After config script function with target parameter
---@return nil
function after_config(script) end

---
---**Scoped: rule**
---
---[Open in browser](https://xmake.io/api/description/custom-rule#after-link)
---
---@param script fun(target: any) After link script function with target parameter
---@return nil
function after_link(script) end

---
---**Scoped: rule**
---
---[Open in browser](https://xmake.io/api/description/custom-rule#after-build)
---
---@param script fun(target: any) After build script function with target parameter
---@return nil
function after_build(script) end

---
---**Scoped: rule**
---
---[Open in browser](https://xmake.io/api/description/custom-rule#after-clean)
---
---@param script fun(target: any) After clean script function with target parameter
---@return nil
function after_clean(script) end

---
---**Scoped: rule**
---
---[Open in browser](https://xmake.io/api/description/custom-rule#after-package)
---
---@param script fun(target: any) After package script function with target parameter
---@return nil
function after_package(script) end

---
---**Scoped: rule**
---
---[Open in browser](https://xmake.io/api/description/custom-rule#after-install)
---
---@param script fun(target: any) After install script function with target parameter
---@return nil
function after_install(script) end

---
---**Scoped: rule**
---
---[Open in browser](https://xmake.io/api/description/custom-rule#after-uninstall)
---
---@param script fun(target: any) After uninstall script function with target parameter
---@return nil
function after_uninstall(script) end

---
---**Scoped: rule**
---
---[Open in browser](https://xmake.io/api/description/custom-rule#after-build-file)
---
---@param script fun(target: any, sourcefile: string, opt?: table) After build file script function with target, sourcefile and opt parameters
---@return nil
function after_build_file(script) end

---
---**Scoped: rule**
---
---[Open in browser](https://xmake.io/api/description/custom-rule#after-buildcmd-file)
---
---@param script fun(target: any, batchcmds: any, sourcefile: string, opt?: table) After build command file script function with target, batchcmds, sourcefile and opt parameters
---@return nil
function after_buildcmd_file(script) end

---
---**Scoped: rule**
---
---[Open in browser](https://xmake.io/api/description/custom-rule#after-build-files)
---
---@param script fun(target: any, sourcebatch: any, opt?: table) After build files script function with target, sourcebatch and opt parameters
---@return nil
function after_build_files(script) end

---
---**Scoped: rule**
---
---[Open in browser](https://xmake.io/api/description/custom-rule#after-buildcmd-files)
---
---@param script fun(target: any, batchcmds: any, sourcebatch: any, opt?: table) After build command files script function with target, batchcmds, sourcebatch and opt parameters
---@return nil
function after_buildcmd_files(script) end

---
---[Open in browser](https://xmake.io/api/description/custom-rule#rule-end)
---
---@return nil
function rule_end() end
