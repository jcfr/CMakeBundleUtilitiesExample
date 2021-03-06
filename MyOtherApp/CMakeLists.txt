
project(MyOtherApp)

include_directories(${CMAKE_SOURCE_DIR}/MyLib)

add_executable(${PROJECT_NAME} ${PROJECT_NAME}.cpp)
target_link_libraries(${PROJECT_NAME} MyLib)

set_target_properties(${PROJECT_NAME} PROPERTIES
  RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/${${PROJECT_NAME}_BIN_DIR}"
  LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/${${PROJECT_NAME}_BIN_DIR}"
  ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/${${PROJECT_NAME}_BIN_DIR}"
  )
  
if(APPLE)
  set(link_flags "-Wl,-rpath,@loader_path/../")
  set_target_properties(${PROJECT_NAME}
    PROPERTIES
      LINK_FLAGS ${link_flags}
    )
endif()

install(TARGETS ${PROJECT_NAME}
  RUNTIME DESTINATION ${PROJECT_INSTALL_ROOT}${${PROJECT_NAME}_BIN_DIR} COMPONENT RuntimeLibraries
  LIBRARY DESTINATION ${PROJECT_INSTALL_ROOT}${${PROJECT_NAME}_BIN_DIR} COMPONENT RuntimeLibraries
  ARCHIVE DESTINATION ${PROJECT_INSTALL_ROOT}${${PROJECT_NAME}_BIN_DIR} COMPONENT Development
  )
