CMakeBundleUtilitiesExample
===========================

Small project illustrating how CMake module BundleUtilites can be used.

It contains:
 * MyApp: main executable built using `MACOSX_BUNDLE` property and installed in `<bundle>/Contents/MacOS`
 * MyOtherApp: an other executable installed in `<bundle>/Contents/bin` folder.
 * MyLib: a library linked by both `MyApp` and `MyOtherApp`. It is installed in '<bundle>/Contents/lib/MyLib' folder.
 * MyLib4Plugin: a library linked by `MyPlugin` and installed in `<bundle>/Contents/lib/MyLib4Plugin`
 * MyPlugin: a plugin linked against both `MyLib4Plugin` and `MyLib` and installed in `<bundle>/Contents/lib/MyPlugin`

Options:

* `PACKAGE_WITH_RPATH` (default: ON) Allow to fixup the bundle
using either `@rpath` or `@executable_path/..`

* `AUTOMATIC_PACKAGE_FIXUP` (default: ON) By turning off, the user will have to
manually invoke the script `CMake/MyCPackBundleFixup/MyCPackBundleFixup.cmake`. This
is particularly useful when debugging the fixup process. An example of call:
```
$ cd CMakeBundleUtilitiesExample-build
$ DESTDIR=/Volumes/Dashboards/Experimental/CMakeBundleUtilitiesExample-build/_CPack_Packages/Darwin/DragNDrop/MyApp-0.0.1-Darwin ../../Support/CMake\ 2.8-11-rc3.app/Contents/bin/cmake  -P CMake/MyCPackBundleFixup/MyCPackBundleFixup.cmake

```

