---@meta
---Automatically generated xmake type definitions schema

---Supported OperatingSystem
---@alias OperatingSystem string|"windows"|"linux"|"android"|"macosx"|"ios"|"freebsd"|"bsd"

---Supported Host
---@alias Host string|"windows"|"linux"|"macosx"

---Supported Subhost
---@alias Subhost string|"msys"|"cygwin"

---Supported TargetKind
---@alias TargetKind string|"phony"|"binary"|"static"|"shared"|"object"|"headeronly"

---Supported Runtime
---@alias Runtime string|"MT"|"MD"|"MTd"|"MDd"|"c++_static"|"c++_shared"|"stdc++_static"|"stdc++_shared"

---Supported StripMode
---@alias StripMode string|"debug"|"all"

---Supported SymbolInfo
---@alias SymbolInfo string|"debug"|"debug,edit"|"debug,embed"|"hidden"

---Supported WarningLevel
---@alias WarningLevel string|"none"|"less"|"more"|"extra"|"pedantic"|"all"|"allextra"|"everything"|"error"

---Supported OptimizationLevel
---@alias OptimizationLevel string|"none"|"fast"|"faster"|"fastest"|"smallest"|"aggressive"

---Supported FloatPointModel
---@alias FloatPointModel string|"fast"|"strict"|"except"|"precise"

---Supported ToolType
---@alias ToolType string|"cc"|"cxx"|"mm"|"mxx"|"gc"|"as"|"sc"|"rc"|"dc"|"fc"|"rust"|"strip"|"ld"|"sh"|"ar"|"dcld"|"dcsh"

---Supported ExceptionType
---@alias ExceptionType string|"cxx"|"no-cxx"|"objc"|"no-objc"

---Supported LanguageStandard
---@alias LanguageStandard string|"ansi"|"c89"|"gnu89"|"c90"|"gnu90"|"c99"|"gnu99"|"c11"|"c17"|"clatest"|"cxx98"|"gnuxx98"|"cxx03"|"gnuxx03"|"cxx11"|"gnuxx11"|"cxx14"|"gnuxx14"|"cxx1z"|"gnuxx1z"|"cxx17"|"gnuxx17"|"cxx20"|"gnuxx20"|"cxx2a"|"gnuxx2a"|"cxx23"|"gnuxx23"|"cxx2b"|"gnuxx2b"|"cxxlatest"|"gnuxxlatest"

---Supported Platform
---@alias Platform string|"android"|"appletvos"|"applexros"|"bsd"|"cross"|"cygwin"|"haiku"|"harmony"|"iphoneos"|"linux"|"macosx"|"mingw"|"msys"|"solaris"|"wasm"|"watchos"|"windows"

---Supported Architecture
---@alias Architecture string|"android"|"appletvos"|"applexros"|"bsd"|"cross"|"cygwin"|"haiku"|"harmony"|"iphoneos"|"linux"|"macosx"|"mingw"|"msys"|"solaris"|"wasm"|"watchos"|"windows"

---Supported CompilationMode
---@alias CompilationMode string|"asan"|"check"|"coverage"|"debug"|"lsan"|"minsizerel"|"msan"|"profile"|"release"|"releasedbg"|"tsan"|"ubsan"|"valgrind"

---Supported Toolchain
---@alias Toolchain string|"armcc"|"armclang"|"ascendc"|"c51"|"circle"|"clang"|"clang-12"|"clang-13"|"clang-14"|"clang-15"|"clang-16"|"clang-17"|"clang-18"|"clang-19"|"clang-20"|"clang-21"|"clang-22"|"clang-23"|"clang-cl"|"cosmocc"|"cross"|"cuda"|"dlang"|"dmd"|"dotnet"|"dpcpp"|"emcc"|"envs"|"fasm"|"filc"|"flang"|"fpc"|"gcc"|"gcc-10"|"gcc-11"|"gcc-12"|"gcc-13"|"gcc-14"|"gcc-15"|"gcc-16"|"gcc-4.8"|"gcc-4.9"|"gcc-8"|"gcc-9"|"gdc"|"gfortran"|"gnu-rm"|"go"|"hdk"|"iararm"|"icc"|"icx"|"ifort"|"ifx"|"iverilog"|"kotlin-native"|"ldc"|"llvm"|"masm32"|"mingw"|"msvc"|"muslcc"|"nasm"|"ndk"|"nim"|"rust"|"sdcc"|"swift"|"ti-c2000"|"ti-c6000"|"tinycc"|"verilator"|"wasi"|"xcode"|"yasm"|"zig"|"zigcc"

---Supported BuildPolicy
---@alias BuildPolicy string|"build.across_targets_in_parallel"|"build.always_update_configfiles"|"build.c++.clang.fallbackscanner"|"build.c++.dynamic_debugging"|"build.c++.gcc.fallbackscanner"|"build.c++.gcc.modules.cxx11abi"|"build.c++.modules"|"build.c++.modules.clang.fallbackscanner"|"build.c++.modules.culling"|"build.c++.modules.fallbackscanner"|"build.c++.modules.gcc.cxx11abi"|"build.c++.modules.gcc.fallbackscanner"|"build.c++.modules.hide_dependencies"|"build.c++.modules.msvc.fallbackscanner"|"build.c++.modules.non_cascading_changes"|"build.c++.modules.reuse"|"build.c++.modules.reuse.nocheck"|"build.c++.modules.reuse.strict"|"build.c++.modules.std"|"build.c++.modules.tryreuse"|"build.c++.modules.tryreuse.discriminate_on_defines"|"build.c++.modules.two_phases"|"build.c++.msvc.fallbackscanner"|"build.c++.msvc.runtime"|"build.ccache"|"build.ccache.global_storage"|"build.cuda.devlink"|"build.distcc.remote_only"|"build.fence"|"build.intermediate_directory"|"build.jobgraph"|"build.linker.output"|"build.merge_archive"|"build.optimization.lto"|"build.progress_show_target"|"build.progress_style"|"build.release.strip"|"build.rpath"|"build.sanitizer.address"|"build.sanitizer.leak"|"build.sanitizer.memory"|"build.sanitizer.thread"|"build.sanitizer.undefined"|"build.warning"|"check.auto_ignore_flags"|"check.auto_map_flags"|"check.target_package_licenses"|"compatibility.version"|"diagnosis.check_build_deps"|"generator.compile_commands"|"generator.vsxmake.root_sln"|"install.rpath"|"install.strip_packagelibs"|"network.mode"|"package.build.ccache"|"package.cmake_generator.ninja"|"package.download.http_headers"|"package.fetch_only"|"package.host.install_locally"|"package.include_external_headers"|"package.inherit_external_configs"|"package.install_always"|"package.install_locally"|"package.install_only"|"package.keep_source"|"package.librarydeps.strict_compatibility"|"package.merge_staticlibs"|"package.msbuild.multi_tool_task"|"package.precompiled"|"package.requires_lock"|"package.resolve_depconflict"|"package.strict_compatibility"|"package.sync_requires_to_deps"|"package.xmake.pass_depconfs"|"platform.longpaths"|"preprocessor.gcc.directives_only"|"preprocessor.linemarkers"|"run.autobuild"|"run.windows_error_dialog"|"test.return_zero_on_failure"|"test.stop_on_first_failure"|"windows.manifest.uac"|"windows.manifest.uac.ui"

---@class AccessSpecifier
---@field public boolean
---@field private boolean
---@field interface boolean
---@field inherit boolean

---@class CompilationOption
---@field rule string
---@field force CompilationOption
---@field defines string
---@field languages LanguageStandard
---@field includedirs string
---@field cflags string

---@class CompilationFlagAttr
---@field public boolean
---@field private boolean
---@field interface boolean
---@field force boolean
---@field tools string|string[]

---@class ToolchainOption
---@field vs string
---@field plat Platform
---@field arch Architecture
---@field clang boolean
---@field gcc boolean
---@field vs_sdkver string
---@field vs_toolset string

---@class InstallFilesOption
---@field prefixdir string
---@field rootdir string
---@field filename string
---@field install boolean

---@class ConfigvarOption
---@field quote boolean
---@field escape boolean

---@class ConfigfilesOption
---@field filename string
---@field prefixdir string
---@field rootdir string
---@field onlycopy boolean
---@field pattern string
---@field variables table<string, any>

---@class FilegroupsOption
---@field rootdir string
---@field files string[]
---@field mode string|"plain"|"tree"

---@class TargetAttr
---@field kind TargetKind
---@field files string|string[]
---@field includedirs string|string[]

---@class SourceBatch
---@field sourcekind string
---@field rulename string
---@field sourcefiles string[]
---@field objectfiles string[]
---@field dependfiles string[]

---@class SnippetOption
---@field tryrun boolean
---@field output boolean
---@field number boolean

---@class RuleDependencyOption
---@field order boolean

---@class RootDirOption
---@field rootdir string

---@class VersionOption
---@field build string
---@field soname string|boolean

---@class PackageRequireOption
---@field optional boolean
---@field system boolean
---@field verify boolean
---@field debug boolean
---@field private boolean
---@field configs table<string, any>
---@field alias string

---@class RequireConfOption
---@field configs table<string, any>
---@field override boolean
---@field version string
---@field debug boolean

---@class PackageKindOption
---@field headeronly boolean

---@class UrlOption
---@field alias string
---@field excludes string[]
---@field version fun()
---@field http_headers table<string, string>

---@class LinkGroupOption
---@field name string
---@field group boolean

---@class ConfigOption
---@field description string
---@field default string|boolean|number
---@field values string[]
---@field type string
---@field readonly boolean

---@class ComponentOption
---@field deps string|string[]

---@class DependencyAttr
---@field inherit boolean

---@class FileAttr
---@field defines string|string[]
---@field languages string|string[]
---@field includedirs string|string[]
---@field rules string|string[]
---@field force boolean|CompilationFlagAttr
---@field sourcekind string
---@field flags string|string[]

---@class TestOption
---@field runargs string|string[]
---@field runenvs table<string, string>
---@field timeout number

---@class PrepareFilesOption
---@field jobgraph boolean

---@class Rect
