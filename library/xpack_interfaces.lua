---@meta
---[xpack_interfaces](https://xmake.io/api/description/xpack-interfaces)

---
---**Scoped: xpack-interfaces**
---
---- Set package version
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-version)
---
---@param version string Package version string
---@return nil
function set_version(version) end

---
---**Scoped: xpack-interfaces**
---
---- Set homepage information
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-homepage)
---
---@param homepage string Homepage URL string
---@return nil
function set_homepage(homepage) end

---
---**Scoped: xpack-interfaces**
---
---- Set title information
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-title)
---
---@param title string Package title string
---@return nil
function set_title(title) end

---
---**Scoped: xpack-interfaces**
---
---- Set detailed description
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-description)
---
---@param description string Package description string
---@return nil
function set_description(description) end

---
---**Scoped: xpack-interfaces**
---
---- Set author information
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-author)
---
---@param author string Author information string
---@return nil
function set_author(author) end

---
---**Scoped: xpack-interfaces**
---
---- Set maintainer information
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-maintainer)
---
---@param maintainer string Maintainer information string
---@return nil
function set_maintainer(maintainer) end

---
---**Scoped: xpack-interfaces**
---
---- Set the copyright information of the package
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-copyright)
---
---@param copyright string Copyright information string
---@return nil
function set_copyright(copyright) end

---
---**Scoped: xpack-interfaces**
---
---- Set the package licence
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-license)
---
---@param license string License name string
---@return nil
function set_license(license) end

---
---**Scoped: xpack-interfaces**
---
---- Set the license file of the package
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-licensefile)
---
---@param licensefile string License file path string
---@return nil
function set_licensefile(licensefile) end

---
---**Scoped: xpack-interfaces**
---
---- Set the company to which the package belongs
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-company)
---
---@param company string Company name string
---@return nil
function set_company(company) end

---
---**Scoped: xpack-interfaces**
---
---- Set the packaged input source type
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-inputkind)
---
---@param inputkind string Input source type: "binary" or "source"
---@return nil
function set_inputkind(inputkind) end

---
---**Scoped: xpack-interfaces**
---
---- Set packaging format
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
---- Set package file name
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-basename)
---
---@param basename string Package base name string
---@return nil
function set_basename(basename) end

---
---**Scoped: xpack-interfaces**
---
---- Set the extension of the installation package
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-extension)
---
---@param extension string Package file extension string
---@return nil
function set_extension(extension) end

---
---**Scoped: xpack-interfaces**
---
---- Associated target program
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
---- Add installation package components
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
---- Set the binary installation directory of the package
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-bindir)
---
---@param bindir string Binary directory path string
---@return nil
function set_bindir(bindir) end

---
---**Scoped: xpack-interfaces**
---
---- Set the library installation directory of the package
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-libdir)
---
---@param libdir string Library directory path string
---@return nil
function set_libdir(libdir) end

---
---**Scoped: xpack-interfaces**
---
---- Set the package header file installation directory
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-includedir)
---
---@param includedir string Include directory path string
---@return nil
function set_includedir(includedir) end

---
---**Scoped: xpack-interfaces**
---
---- Set the installation prefix directory of the package
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-prefixdir)
---
---@param prefixdir string Prefix directory path string
---@return nil
function set_prefixdir(prefixdir) end

---
---**Scoped: xpack-interfaces**
---
---- Set package spec file path
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-specfile)
---
---@param specfile string Spec file path string
---@return nil
function set_specfile(specfile) end

---
---**Scoped: xpack-interfaces**
---
---- Set custom variables in the package spec file
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
---- Set icon file path
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-iconfile)
---
---@param iconfile string Icon file path string
---@return nil
function set_iconfile(iconfile) end

---
---**Scoped: xpack-interfaces**
---
---- Add source files
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#add-sourcefiles)
---
---@param files string|string[] Source file pattern string or array
---@param ... string|InstallFilesOption Variable parameters, can pass multiple file patterns
---@return nil
function add_sourcefiles(files, ...) end

---
---**Scoped: xpack-interfaces**
---
---- Add binary files
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#add-installfiles)
---
---@param files string|string[] Install file pattern string or array
---@param ... string|InstallFilesOption Variable parameters, can pass multiple file patterns
---@return nil
function add_installfiles(files, ...) end

---
---**Scoped: xpack-interfaces**
---
---- Add package build dependencies
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
---- Custom loading script
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#on-load)
---
---@param script fun(target: any, ...: any) Load script function with package parameter
---@return nil
function on_load(script) end

---
---**Scoped: xpack-interfaces**
---
---- Customize the script before packaging
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#before-package)
---
---@param script fun(target: any, ...: any) Before package script function with package parameter
---@return nil
function before_package(script) end

---
---**Scoped: xpack-interfaces**
---
---- Custom packaging script
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#on-package)
---
---@param script fun(target: any, ...: any) Package script function with package parameter
---@return nil
function on_package(script) end

---
---**Scoped: xpack-interfaces**
---
---- Customize the script after packaging
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#after-package)
---
---@param script fun(target: any, ...: any) After package script function with package parameter
---@return nil
function after_package(script) end

---
---**Scoped: xpack-interfaces**
---
---- Custom build script
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#on-buildcmd)
---
---@param script fun(target: any, ...: any) Build script function with package and batchcmds parameters
---@return nil
function on_buildcmd(script) end

---
---**Scoped: xpack-interfaces**
---
---- Customize pre-build scripts
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#before-buildcmd)
---
---@param script fun(target: any, ...: any) Before build script function with package and batchcmds parameters
---@return nil
function before_buildcmd(script) end

---
---**Scoped: xpack-interfaces**
---
---- Customize the script after the build
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#after-buildcmd)
---
---@param script fun(target: any, ...: any) After build script function with package and batchcmds parameters
---@return nil
function after_buildcmd(script) end

---
---**Scoped: xpack-interfaces**
---
---- Add script before installation
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#before-installcmd)
---
---@param script fun(target: any, ...: any) Before install script function with package and batchcmds parameters
---@return nil
function before_installcmd(script) end

---
---**Scoped: xpack-interfaces**
---
---- Custom installation script
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#on-installcmd)
---
---@param script fun(target: any, ...: any) Install script function with package and batchcmds parameters
---@return nil
function on_installcmd(script) end

---
---**Scoped: xpack-interfaces**
---
---- Add post-installation scripts
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#after-installcmd)
---
---@param script fun(target: any, ...: any) After install script function with package and batchcmds parameters
---@return nil
function after_installcmd(script) end

---
---**Scoped: xpack-interfaces**
---
---- Add script before uninstallation
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#before-uninstallcmd)
---
---@param script fun(target: any, ...: any) Before uninstall script function with package and batchcmds parameters
---@return nil
function before_uninstallcmd(script) end

---
---**Scoped: xpack-interfaces**
---
---- Custom uninstall script
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#on-uninstallcmd)
---
---@param script fun(target: any, ...: any) Uninstall script function with package and batchcmds parameters
---@return nil
function on_uninstallcmd(script) end

---
---**Scoped: xpack-interfaces**
---
---- Add script after uninstallation
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#after-uninstallcmd)
---
---@param script fun(target: any, ...: any) After uninstall script function with package and batchcmds parameters
---@return nil
function after_uninstallcmd(script) end

---
---**Scoped: xpack-interfaces**
---
---Set the icon shown in Windows Add/Remove Programs for NSIS and Inno Setup installers.
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-displayicon)
---
---@return nil
function set_displayicon() end

---
---**Scoped: xpack-interfaces**
---
---- Set the display icon of NSIS
---
---[Open in browser](https://xmake.io/api/description/xpack-interfaces#set-nsis-displayicon)
---
---@param iconfile string Icon file path string
---@return nil
function set_nsis_displayicon(iconfile) end
