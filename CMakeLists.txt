cmake_minimum_required(VERSION 3.10.0 FATAL_ERROR)

SET(DC_BUILD_SYSTEM_PATH ${CMAKE_SOURCE_DIR}/build-system)
include(${DC_BUILD_SYSTEM_PATH}/build-system.cmake)

#add_compile_options(--coverage)
#link_libraries(gcov)


project(demo-project LANGUAGES CXX)

conan_basic_setup(TARGETS NO_OUTPUT_DIRS)

add_subdirectory(DemoLib)
add_subdirectory(DemoExe)

