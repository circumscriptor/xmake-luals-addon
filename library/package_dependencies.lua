---@meta
---[package_dependencies](https://xmake.io/api/description/package-dependencies)

---
---**Scoped: package**
---
---- Define package configuration
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#package)
---
---@param name string Package name string
---@param opt? PackageAttr|fun() Configuration options
---@return nil
function package(name, opt) end

---
---**Scoped: package**
---
---- Set package homepage
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#set-homepage)
---
---@param url string Package homepage URL string
---@return nil
function set_homepage(url) end

---
---**Scoped: package**
---
---- Set package description
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#set-description)
---
---@param description string Package description string
---@return nil
function set_description(description) end

---
---**Scoped: package**
---
---- Set package kind
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#set-kind)
---
---@param kind TargetKind Package type: "library", "binary", "toolchain"
---@param opt? PackageKindOption Configuration options
---@return nil
function set_kind(kind, opt) end

---
---**Scoped: package**
---
---- Set package urls
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#set-urls)
---
---@param urls string|string[] Package source URL string or array
---@param ... string|UrlOption Variable parameters, can pass multiple URLs
---@return nil
function set_urls(urls, ...) end

---
---**Scoped: package**
---
---- Add package urls
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#add-urls)
---
---@param urls string|string[] Package source URL string or array
---@param ... string|UrlOption Variable parameters, can pass multiple URLs
---@return nil
function add_urls(urls, ...) end

---
---**Scoped: package**
---
---- Add package versions
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#add-versions)
---
---@param version string Package version string
---@param hash string SHA256 hash value for verification
---@return nil
function add_versions(version, hash) end

---
---**Scoped: package**
---
---- Adding a list of package versions
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#add-versionfiles)
---
---@param file string Version file path containing version and hash pairs
---@return nil
function add_versionfiles(file) end

---
---**Scoped: package**
---
---- Set the source directory of the package
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#set-sourcedir)
---
---@param sourcedir string Package source directory path
---@return nil
function set_sourcedir(sourcedir) end

---
---**Scoped: package**
---
---- Add package patches
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#add-patches)
---
---@param version string Package version for which patch applies
---@param url string Patch file URL
---@param hash string SHA256 hash value for patch verification
---@return nil
function add_patches(version, url, hash) end

---
---**Scoped: package**
---
---- Add package links
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#add-links)
---
---@param links string|string[] Library link name string or array
---@param ... any Variable parameters, can pass multiple link names
---@return nil
function add_links(links, ...) end

---
---**Scoped: package**
---
---- Add system library links
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#add-syslinks)
---
---@param syslinks string|string[] System library name string or array
---@param ... any Variable parameters, can pass multiple system library names
---@return nil
function add_syslinks(syslinks, ...) end

---
---**Scoped: package**
---
---- Adjust the link order within the package
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#add-linkorders)
---
---@param orders string|string[] Link order string or array
---@param ... any Variable parameters, can pass multiple order specifications
---@return nil
function add_linkorders(orders, ...) end

---
---**Scoped: package**
---
---- Configure the link group of the package
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#add-linkgroups)
---
---@param groups string|string[] Link group name string or array
---@param ... string|LinkGroupOption Variable parameters, can pass multiple group names
---@return nil
function add_linkgroups(groups, ...) end

---
---**Scoped: package**
---
---- Add frameworks
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#add-frameworks)
---
---@param frameworks string|string[] Framework name string or array
---@param ... any Variable parameters, can pass multiple framework names
---@return nil
function add_frameworks(frameworks, ...) end

---
---**Scoped: package**
---
---- Add link directories
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#add-linkdirs)
---
---@param dirs string|string[] Link directory path string or array
---@param ... any Variable parameters, can pass multiple directory paths
---@return nil
function add_linkdirs(dirs, ...) end

---
---**Scoped: package**
---
---- Add include directories
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#add-includedirs)
---
---@param dirs string|string[] Include directory path string or array
---@param ... any Variable parameters, can pass multiple directory paths
---@return nil
function add_includedirs(dirs, ...) end

---
---**Scoped: package**
---
---- Add executable file directory
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#add-bindirs)
---
---@param dirs string|string[] Executable directory path string or array
---@param ... any Variable parameters, can pass multiple directory paths
---@return nil
function add_bindirs(dirs, ...) end

---
---**Scoped: package**
---
---- Add definition
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#add-defines)
---
---@param defines string|string[] Macro definition string or array
---@param ... any Variable parameters, can pass multiple definitions
---@return nil
function add_defines(defines, ...) end

---
---**Scoped: package**
---
---- Add package schemes
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#add-schemes)
---
---@param schemes string|string[] Scheme name string or array
---@param ... any Variable parameters, can pass multiple scheme names
---@return nil
function add_schemes(schemes, ...) end

---
---**Scoped: package**
---
---- Add package configs
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#add-configs)
---
---@param name string Configuration parameter name
---@param opt? ConfigOption Configuration options
---@return nil
function add_configs(name, opt) end

---
---**Scoped: package**
---
---- Add external package sources
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#add-extsources)
---
---@param sources string|string[] External source string or array, format: "pkgconfig::name" or "brew::name"
---@param ... any Variable parameters, can pass multiple external sources
---@return nil
function add_extsources(sources, ...) end

---
---**Scoped: package**
---
---- Add package dependencies
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#add-deps)
---
---@param deps string|string[] Dependency package name string or array
---@param ... any Variable parameters, can pass multiple dependency names
---@return nil
function add_deps(deps, ...) end

---
---**Scoped: package**
---
---- Add package components
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#add-components)
---
---@param components string|string[] Component name string or array
---@param ... string|ComponentOption Variable parameters, can pass multiple component names
---@return nil
function add_components(components, ...) end

---
---**Scoped: package**
---
---- Inherit package configuration
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#set-base)
---
---@param package string Base package name to inherit from
---@return nil
function set_base(package) end

---
---**Scoped: package**
---
---- Load package configuration
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#on-load)
---
---@param script fun(target: any, ...: any) Package load script function with package parameter
---@return nil
function on_load(script) end

---
---**Scoped: package**
---
---- Fetch package libraries
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#on-fetch)
---
---@param platforms string|string[] Platform filter string or array, optional
---@param ... any Variable parameters, can pass multiple platform filters
---@param script fun(target: any, ...: any) Fetch script function with package and opt parameters
---@return nil
function on_fetch(platforms, script, ...) end

---
---**Scoped: package**
---
---- Check whether the package supports the current platform
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#on-check)
---
---@param platforms string|string[] Platform filter string or array, optional
---@param ... any Variable parameters, can pass multiple platform filters
---@param script fun(target: any, ...: any) Check script function with package parameter
---@return nil
function on_check(platforms, script, ...) end

---
---**Scoped: package**
---
---- Installation package
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#on-install)
---
---@param platforms string|string[] Platform filter string or array, optional
---@param ... any Variable parameters, can pass multiple platform filters
---@param script fun(target: any, ...: any) Install script function with package parameter
---@return nil
function on_install(platforms, script, ...) end

---
---**Scoped: package**
---
---- Custom download package
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#on-download)
---
---@param script fun(target: any, ...: any) Download script function with package and opt parameters
---@return nil
function on_download(script) end

---
---**Scoped: package**
---
---- Test package
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#on-test)
---
---@param script fun(target: any, ...: any) Test script function with package parameter
---@return nil
function on_test(script) end

---
---**Scoped: package**
---
---- Define package component
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#on-component)
---
---@param component string Component name string, optional (if not provided, applies to all components)
---@param script fun(target: any, ...: any) Component configuration script function with package and component parameters
---@return nil
function on_component(component, script) end
