SET(CMAKE_SYSTEM_NAME Linux)
SET(CMAKE_SYSTEM_VERSION 1)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(CMAKE_SYSROOT "${CONAN_USER_GCC_8.5.0_GLIBC_2.27_ARMHF_SYSROOT}")
SET(CMAKE_C_COMPILER   ${CONAN_USER_GCC_8.5.0_GLIBC_2.27_ARMHF_C_COMPILER})
SET(CMAKE_CXX_COMPILER ${CONAN_USER_GCC_8.5.0_GLIBC_2.27_ARMHF_CXX_COMPILER})

SET(CMAKE_C_FLAGS   "-fPIC -mfloat-abi=hard -O0 -ggdb -Wall -Wno-psabi -Wno-unused-variable -Wno-unused-value -Wno-parentheses -fvisibility=hidden -rdynamic" CACHE STRING "" FORCE)
SET(CMAKE_CXX_FLAGS "-fPIC -mfloat-abi=hard -O0 -ggdb -Wall -Wno-psabi -Wno-unused-variable -Wno-unused-value -Wno-parentheses -std=c++11 -fvisibility=hidden -rdynamic" CACHE STRING "" FORCE)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
