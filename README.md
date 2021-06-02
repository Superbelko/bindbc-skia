# bindbc-skia
This project provides both static and dynamic bindings to the [Skia library](https://skia.org). They are `@nogc` and `nothrow` compatible and can be compiled for compatibility with `-betterC`.

## Usage
By default, `bindbc-skia` is configured to compile as a dynamic binding that is not `-betterC` compatible. The dynamic binding has no link-time dependency on the Skia library, so the Skia shared library must be manually loaded at runtime. When configured as a static binding, there is a link-time dependency on the Skia library through either the static library or the appropriate file for linking with shared libraries on your platform (see below).

When using DUB to manage your project, the static binding can be enabled via a DUB `subConfiguration` statement in your project's package file. `-betterC` compatibility is also enabled via subconfigurations.

To use Skia, add `bindbc-skia` as a dependency to your project's package config file. For example, the following is configured to use Skia as a dynamic binding that is not `-betterC` compatible:

__dub.json__
```
dependencies {
    "bindbc-skia": "~>1.0.0",
}
```

__dub.sdl__
```
dependency "bindbc-skia" version="~>1.0.0"
```

### The dynamic binding
The dynamic binding requires no special configuration when using DUB to manage your project. There is no link-time dependency. At runtime, the Skia shared library is required to be on the shared library search path of the user's system. On Windows, this is typically handled by distributing the Skia DLL with your program. On other systems, it usually means the user must install the Skia runtime library through a package manager.

To load the shared library, you need to call the `loadSkia` function. This returns a member of the `SkiaSupport` enumeration (See [the README for `bindbc.loader`](https://github.com/BindBC/bindbc-loader/blob/master/README.md) for the error handling API):

* `SkiaSupport.noLibrary` indicating that the library failed to load (it couldn't be found)
* `SkiaSupport.badLibrary` indicating that one or more symbols in the library failed to load
* a member of `SkiaSupport` indicating a version number that matches the version of Skia that `bindbc-skia` was configured at compile-time to load. By default, that is `SkiaSupport.skia10`, but can be configured via a version identifier (see below). This value will match the global manifest constant, `skiaSupport`.

```d
import bindbc.skia;

/*
This version attempts to load the Skia shared library using well-known variations
of the library name for the host system.
*/
SkiaSupport ret = loadSkia();
if(ret != skiaSupport) {

    // Handle error. For most use cases, its reasonable to use the the error handling API in
    // bindbc-loader to retrieve error messages for logging and then abort. If necessary, it's
    // possible to determine the root cause via the return value:

    if(ret == SkiaSupport.noLibrary) {
        // Skia shared library failed to load
    }
    else if(SkiaSupport.badLibrary) {
        // One or more symbols failed to load. The likely cause is that the
        // shared library is for a lower version than bindbc-skia was configured
        // to load (via SKIA_10, SKIA_11 etc.)
    }
}
/*
This version attempts to load the Skia library using a user-supplied file name.
Usually, the name and/or path used will be platform specific, as in this example
which attempts to load `skia.dll` from the `libs` subdirectory, relative
to the executable, only on Windows.
*/
// version(Windows) loadSkia("libs/skia.dll")
```
By default, the `bindbc-skia` binding is configured to compile to load Skia lowest version. This ensures the widest level of compatibility at runtime. This behavior can be overridden via the `-version` compiler switch or the `versions` DUB directive with the desired Skia version number. It is recommended that you always select the minimum version you require _and no higher_.

## The static binding
The static binding has a link-time dependency on either the shared or the static Skia library. On Windows, you can link with the static library or, to use the shared library (`skia.dll`), with the import library. On other systems, you can link with either the static library or directly with the shared library. This requires the Skia development package be installed on your system at compile time, either by compiling the Skia source yourself, downloading the Skia precompiled binaries for Windows, or installing via a system package manager.

When linking with the static library, there is no runtime dependency on Skia. When linking with the shared library (or the import library on Windows), the runtime dependency is the same as the dynamic binding, the difference being that the shared library is no longer loaded manually---loading is handled automatically by the system when the program is launched.

Enabling the static binding can be done in two ways.

### Via the compiler's `-version` switch or DUB's `versions` directive
Pass the `BindSkia_Static` version to the compiler and link with the appropriate library. Note that `BindSkia_Static` will also enable the static binding for any satellite libraries used.

When using the compiler command line or a build system that doesn't support DUB, this is the only option. The `-version=BindSkia_Static` option should be passed to the compiler when building your program. All of the required C libraries, as well as the `bindbc-skia` and `bindbc-loader` static libraries must also be passed to the compiler on the command line or via your build system's configuration.

When using DUB, its `versions` directive is an option. For example, when using the static binding:

__dub.json__
```
"dependencies": {
    "bindbc-skia": "~>1.0.0"
},
"versions": ["BindSkia_Static"],
"libs": ["skia"]
```

__dub.sdl__
```
dependency "bindbc-skia" version="~>1.0.0"
versions "BindSkia_Static"
libs "skia"
```

### Via DUB subconfigurations
Instead of using DUB's `versions` directive, a `subConfiguration` can be used. Enable the `static` subconfiguration for the `bindbc-skia` dependency:

__dub.json__
```
"dependencies": {
    "bindbc-skia": "~>1.0.0"
},
"subConfigurations": {
    "bindbc-skia": "static"
},
"libs": ["skia"]
```

__dub.sdl__
```
dependency "bindbc-skia" version="~>1.0.0"
subConfiguration "bindbc-skia" "static"
libs "skia"
```

This has the benefit that it completely excludes from the build any source modules related to the dynamic binding, i.e. they will never be passed to the compiler.

## `betterC` support
`betterC` support is enabled via the `dynamicBC` and `staticBC` subconfigurations, for dynamic and static bindings respectively. To enable the static binding with `-betterC` support:

__dub.json__
```
"dependencies": {
    "bindbc-skia": "~>1.0.0"
},
"subConfigurations": {
    "bindbc-skia": "staticBC"
},
"libs": ["skia"]
```

__dub.sdl__
```
dependency "bindbc-skia" version="~>1.0.0"
subConfiguration "bindbc-skia" "staticBC"
libs "skia"
```

When not using DUB to manage your project, first use DUB to compile the BindBC libraries with the `dynamicBC` or `staticBC` configuration, then pass `-betterC` to the compiler when building your project.
