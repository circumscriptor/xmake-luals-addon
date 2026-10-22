---@meta
---[xpack_interfaces](https://xmake.io/api/description/xpack-interfaces)

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-version)
---
---@param version string Package version string
---@return nil
function set_version(version) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-homepage)
---
---@param homepage string Homepage URL string
---@return nil
function set_homepage(homepage) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-title)
---
---@param title string Package title string
---@return nil
function set_title(title) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-description)
---
---@param description string Package description string
---@return nil
function set_description(description) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-author)
---
---@param author string Author information string
---@return nil
function set_author(author) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-maintainer)
---
---@param maintainer string Maintainer information string
---@return nil
function set_maintainer(maintainer) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-copyright)
---
---@param copyright string Copyright information string
---@return nil
function set_copyright(copyright) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-license)
---
---@param license string License name string
---@return nil
function set_license(license) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-licensefile)
---
---@param licensefile string License file path string
---@return nil
function set_licensefile(licensefile) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-company)
---
---@param company string Company name string
---@return nil
function set_company(company) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-inputkind)
---
---@param inputkind string Input source type: "binary" or "source"
---@return nil
function set_inputkind(inputkind) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-formats)
---
---@param formats string|string[] Package format name string or array
---@param ... any Variable parameters, can pass multiple format names
---@return nil
function set_formats(formats, ...) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-basename)
---
---@param basename string Package base name string
---@return nil
function set_basename(basename) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-extension)
---
---@param extension string Package file extension string
---@return nil
function set_extension(extension) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#add-targets)
---
---@param targets string|string[] Target name string or array
---@param ... any Variable parameters, can pass multiple target names
---@return nil
function add_targets(targets, ...) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#add-components)
---
---@param components string|string[] Component name string or array
---@param ... any Variable parameters, can pass multiple component names
---@return nil
function add_components(components, ...) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-bindir)
---
---@param bindir string Binary directory path string
---@return nil
function set_bindir(bindir) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-libdir)
---
---@param libdir string Library directory path string
---@return nil
function set_libdir(libdir) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-includedir)
---
---@param includedir string Include directory path string
---@return nil
function set_includedir(includedir) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-prefixdir)
---
---@param prefixdir string Prefix directory path string
---@return nil
function set_prefixdir(prefixdir) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-specfile)
---
---@param specfile string Spec file path string
---@return nil
function set_specfile(specfile) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-specvar)
---
---@param name string Variable name string
---@param value string Variable value string
---@return nil
function set_specvar(name, value) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-iconfile)
---
---@param iconfile string Icon file path string
---@return nil
function set_iconfile(iconfile) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#add-sourcefiles)
---
---@param files string|string[] Source file pattern string or array
---@param ... any Variable parameters, can pass multiple file patterns
---@param opt table? Options (-----------, prefixdir, rootdir)
---@return nil
function add_sourcefiles(files, ...) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#add-installfiles)
---
---@param files string|string[] Install file pattern string or array
---@param ... any Variable parameters, can pass multiple file patterns
---@param opt table? Options (-----------, prefixdir, rootdir)
---@return nil
function add_installfiles(files, ...) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#add-buildrequires)
---
---@param requires string|string[] Build requirement name string or array
---@param ... any Variable parameters, can pass multiple requirement names
---@return nil
function add_buildrequires(requires, ...) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#on-load)
---
---@param script fun(package: any) Load script function with package parameter
---@return nil
function on_load(script) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#before-package)
---
---@param script fun(package: any) Before package script function with package parameter
---@return nil
function before_package(script) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#on-package)
---
---@param script fun(package: any) Package script function with package parameter
---@return nil
function on_package(script) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#after-package)
---
---@param script fun(package: any) After package script function with package parameter
---@return nil
function after_package(script) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#on-buildcmd)
---
---@param script fun(package: any, batchcmds: any) Build script function with package and batchcmds parameters
---@return nil
function on_buildcmd(script) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#before-buildcmd)
---
---@param script fun(package: any, batchcmds: any) Before build script function with package and batchcmds parameters
---@return nil
function before_buildcmd(script) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#after-buildcmd)
---
---@param script fun(package: any, batchcmds: any) After build script function with package and batchcmds parameters
---@return nil
function after_buildcmd(script) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#before-installcmd)
---
---@param script fun(package: any, batchcmds: any) Before install script function with package and batchcmds parameters
---@return nil
function before_installcmd(script) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#on-installcmd)
---
---@param script fun(package: any, batchcmds: any) Install script function with package and batchcmds parameters
---@return nil
function on_installcmd(script) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#after-installcmd)
---
---@param script fun(package: any, batchcmds: any) After install script function with package and batchcmds parameters
---@return nil
function after_installcmd(script) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#before-uninstallcmd)
---
---@param script fun(package: any, batchcmds: any) Before uninstall script function with package and batchcmds parameters
---@return nil
function before_uninstallcmd(script) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#on-uninstallcmd)
---
---@param script fun(package: any, batchcmds: any) Uninstall script function with package and batchcmds parameters
---@return nil
function on_uninstallcmd(script) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#after-uninstallcmd)
---
---@param script fun(package: any, batchcmds: any) After uninstall script function with package and batchcmds parameters
---@return nil
function after_uninstallcmd(script) end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-displayicon)
---
---@return nil
function set_displayicon() end

---
---**Scoped: xpack-interfaces**
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-nsis-displayicon)
---
---@param iconfile string Icon file path string
---@return nil
function set_nsis_displayicon(iconfile) end
