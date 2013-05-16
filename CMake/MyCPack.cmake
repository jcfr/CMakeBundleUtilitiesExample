
if(APPLE)
  set(CMAKE_INSTALL_NAME_TOOL "" CACHE FILEPATH "" FORCE)
  
  message(STATUS "CMAKE_INSTALL_PREFIX:${CMAKE_INSTALL_PREFIX}")
  option(PACKAGE_USING_RPATH "Package using @rpath or @executable_path/.." TRUE)
  if(PACKAGE_USING_RPATH)
    set(fixup_path @rpath)
  else()
    set(fixup_path @executable_path/..)
  endif()
  set(_cpack_bundle_fixup_directory ${CMAKE_BINARY_DIR}/CMake/MyCPackBundleFixup)
  configure_file(
    "${CMAKE_SOURCE_DIR}/CMake/MyCPackBundleFixup.cmake.in"
    "${_cpack_bundle_fixup_directory}/MyCPackBundleFixup.cmake"
    @ONLY)
  # HACK - For a given directory, "install(SCRIPT ...)" rule will be evaluated first,
  #        let's make sure the following install rule is evaluated within its own directory.
  #        Otherwise, the associated script will be executed before any other relevant install rules.
  file(WRITE ${_cpack_bundle_fixup_directory}/CMakeLists.txt
    "install(SCRIPT \"${_cpack_bundle_fixup_directory}/MyCPackBundleFixup.cmake\")")

  option(AUTOMATIC_PACKAGE_FIXUP "Automatically call MyCPackBundleFixup.cmake" TRUE)
  if(AUTOMATIC_PACKAGE_FIXUP)
    add_subdirectory(${_cpack_bundle_fixup_directory} ${_cpack_bundle_fixup_directory}-binary)
  endif()

endif()

# Install the current project
set(CPACK_INSTALL_CMAKE_PROJECTS "${CPACK_INSTALL_CMAKE_PROJECTS};${CMAKE_BINARY_DIR};${PROJECT_NAME};ALL;/")

# -------------------------------------------------------------------------
# Package properties
# -------------------------------------------------------------------------
set(CPACK_MONOLITHIC_INSTALL ON)

set(CPACK_PACKAGE_NAME ${${PROJECT_NAME}_APPLICATION_NAME})
set(CPACK_PACKAGE_VENDOR "Kitware Inc.")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "CMake bundle utilities example")
set(CPACK_PACKAGE_VERSION_MAJOR "0")
set(CPACK_PACKAGE_VERSION_MINOR "0")
set(CPACK_PACKAGE_VERSION_PATCH "1")
set(CPACK_PACKAGE_VERSION "0.0.1")

set(CPACK_PACKAGE_INSTALL_DIRECTORY "${CPACK_PACKAGE_NAME} ${CPACK_PACKAGE_VERSION}")

set(APPLICATION_NAME "${${PROJECT_NAME}_APPLICATION_NAME}")
set(EXECUTABLE_NAME "${${PROJECT_NAME}_APPLICATION_NAME}")
set(CPACK_PACKAGE_EXECUTABLES "..\\\\${EXECUTABLE_NAME}" "${APPLICATION_NAME}")

# -------------------------------------------------------------------------
# Disable source generator enabled by default
# -------------------------------------------------------------------------
set(CPACK_SOURCE_TBZ2 OFF CACHE BOOL "Enable to build TBZ2 source packages" FORCE)
set(CPACK_SOURCE_TGZ  OFF CACHE BOOL "Enable to build TGZ source packages" FORCE)
set(CPACK_SOURCE_TZ   OFF CACHE BOOL "Enable to build TZ source packages" FORCE)

# -------------------------------------------------------------------------
# Enable generator
# -------------------------------------------------------------------------
if(UNIX)
  set(CPACK_GENERATOR "TGZ")
  if(APPLE)
    set(CPACK_GENERATOR "DragNDrop")
  endif()
elseif(WIN32)
  set(CPACK_GENERATOR "NSIS")
endif()

include(CPack)
