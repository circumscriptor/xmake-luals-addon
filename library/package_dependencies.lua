---@meta
---[package_dependencies](https://xmake.io/api/description/package-dependencies)

---
---[Open in browser](https://xmake.io/api/description/package-dependencies#package)
---
---@param name string Package name string
---@return nil
function package(name) end

---
---**Scoped: package**
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#set-homepage)
---
---@param url string Package homepage URL string
---@return nil
function set_homepage(url) end

---
---**Scoped: package**
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#set-description)
---
---@param description string Package description string
---@return nil
function set_description(description) end

---
---**Scoped: package**
---
---library
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#set-kind)
---
---@param kind string Package type: "library", "binary", "toolchain"
---@param opt table? Options (-----------, kind, headeronly)
---@return nil
function set_kind(kind, opt) end

---
---**Scoped: package**
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#set-urls)
---
---@param urls string|string[] Package source URL string or array
---@param ... any Variable parameters, can pass multiple URLs
---@param opt table? Options (-----------, urls, excludes)
---@return nil
function set_urls(urls, ...) end

---
---**Scoped: package**
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#add-urls)
---
---@param urls string|string[] Package source URL string or array
---@param ... any Variable parameters, can pass multiple URLs
---@param opt table? Options (-----------, urls, alias)
---@return nil
function add_urls(urls, ...) end

---
---**Scoped: package**
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
---[Open in browser](https://xmake.io/api/description/package-dependencies#add-versionfiles)
---
---@param file string Version file path containing version and hash pairs
---@return nil
function add_versionfiles(file) end

---
---**Scoped: package**
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#set-sourcedir)
---
---@param sourcedir string Package source directory path
---@return nil
function set_sourcedir(sourcedir) end

---
---**Scoped: package**
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
---[Open in browser](https://xmake.io/api/description/package-dependencies#add-links)
---
---@param links string|string[] Library link name string or array
---@param ... any Variable parameters, can pass multiple link names
---@return nil
function add_links(links, ...) end

---
---**Scoped: package**
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
---[Open in browser](https://xmake.io/api/description/package-dependencies#add-linkorders)
---
---@param orders string|string[] Link order string or array
---@param ... any Variable parameters, can pass multiple order specifications
---@return nil
function add_linkorders(orders, ...) end

---
---**Scoped: package**
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#add-linkgroups)
---
---@param groups string|string[] Link group name string or array
---@param ... any Variable parameters, can pass multiple group names
---@param opt table? Options (-----------, groups, group)
---@return nil
function add_linkgroups(groups, ...) end

---
---**Scoped: package**
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
---[Open in browser](https://xmake.io/api/description/package-dependencies#add-linkdirs)
---
---@param dirs string|string[] Link directory path string or array
---@param ... any Variable parameters, can pass multiple directory paths
---@return nil
function add_linkdirs(dirs, ...) end

---
---**Scoped: package**
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
---[Open in browser](https://xmake.io/api/description/package-dependencies#add-bindirs)
---
---@param dirs string|string[] Executable directory path string or array
---@param ... any Variable parameters, can pass multiple directory paths
---@return nil
function add_bindirs(dirs, ...) end

---
---**Scoped: package**
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
---[Open in browser](https://xmake.io/api/description/package-dependencies#add-schemes)
---
---@param schemes string|string[] Scheme name string or array
---@param ... any Variable parameters, can pass multiple scheme names
---@return nil
function add_schemes(schemes, ...) end

---
---**Scoped: package**
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#add-configs)
---
---@param name string Configuration parameter name
---@param opt table? Options (-----------, description, default)
---@return nil
function add_configs(name, opt) end

---
---**Scoped: package**
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
---[Open in browser](https://xmake.io/api/description/package-dependencies#add-deps)
---
---@param deps string|string[] Dependency package name string or array
---@param ... any Variable parameters, can pass multiple dependency names
---@return nil
function add_deps(deps, ...) end

---
---**Scoped: package**
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#add-components)
---
---@param components string|string[] Component name string or array
---@param ... any Variable parameters, can pass multiple component names
---@param opt table? Options (-----------, components)
---@return nil
function add_components(components, ...) end

---
---**Scoped: package**
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#set-base)
---
---@param package string Base package name to inherit from
---@return nil
function set_base(package) end

---
---**Scoped: package**
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#on-load)
---
---@param script fun(package: any) Package load script function with package parameter
---@return nil
function on_load(script) end

---
---**Scoped: package**
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#on-fetch)
---
---@param platforms string|string[] Platform filter string or array, optional
---@param ... any Variable parameters, can pass multiple platform filters
---@param script fun(package: any, opt?: table) Fetch script function with package and opt parameters
---@return nil
function on_fetch(platforms, ...) end

---
---**Scoped: package**
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#on-check)
---
---@param platforms string|string[] Platform filter string or array, optional
---@param ... any Variable parameters, can pass multiple platform filters
---@param script fun(package: any) Check script function with package parameter
---@return nil
function on_check(platforms, ...) end

---
---**Scoped: package**
---
---Platform filtering
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#on-install)
---
---@param platforms string|string[] Platform filter string or array, optional
---@param ... any Variable parameters, can pass multiple platform filters
---@param script fun(package: any) Install script function with package parameter
---@return nil
function on_install(platforms, ...) end

---
---**Scoped: package**
---
---Platform Filtering
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#on-download)
---
---@param script fun(package: any, opt?: table) Download script function with package and opt parameters
---@return nil
function on_download(script) end

---
---**Scoped: package**
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#on-test)
---
---@param script fun(package: any) Test script function with package parameter
---@return nil
function on_test(script) end

---
---**Scoped: package**
---
---Configuring component link information
---
---[Open in browser](https://xmake.io/api/description/package-dependencies#on-component)
---
---@param component string Component name string, optional (if not provided, applies to all components)
---@param script fun(package: any, component: any) Component configuration script function with package and component parameters
---@return nil
function on_component(component, script) end
