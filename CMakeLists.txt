cmake_minimum_required(VERSION 2.8.9)

include(CMake/CMakeOSXVariablesHelper.cmake)

project(CMakeBundleUtilitiesExample)

set(${PROJECT_NAME}_APPLICATION_NAME MyApp)

set(DEFAULT_LIB_DIR "lib")
set(MyApp_BIN_DIR "bin")
set(MyOtherApp_BIN_DIR "bin")
set(MyLib_LIB_DIR "lib/MyLib")
set(MyLib4Plugin_LIB_DIR "lib/MyLib4Plugin")
set(MyPlugin_LIB_DIR "lib/MyPlugin")

set(PROJECT_INSTALL_ROOT "./")
set(PROJECT_BUNDLE_LOCATION "MyApp.app/Contents")
if(APPLE)
  set(PROJECT_INSTALL_ROOT "${PROJECT_BUNDLE_LOCATION}/")
endif()

add_subdirectory(MyLib)
add_subdirectory(MyApp)
add_subdirectory(MyOtherApp)
add_subdirectory(MyLib4Plugin)
add_subdirectory(MyPlugin)

include(${CMAKE_SOURCE_DIR}/CMake/MyCPack.cmake)

