include(CMakeParseArguments)
include (GoogleTest)

include(${CMAKE_SOURCE_DIR}/env_project.cmake)
include(${CMAKE_SOURCE_DIR}/env_project_${DC_PLATFORM}.cmake OPTIONAL)

include(${CMAKE_SOURCE_DIR}/env_personal.cmake OPTIONAL)
include(${CMAKE_SOURCE_DIR}/env_personal_${DC_PLATFORM}.cmake OPTIONAL)

if(NOT DC_PLATFORM)
    message(FATAL_ERROR "DC_PLATFORM not set, you can set it on the command line or in env_personal.cmake")
endif()

if(NOT DC_LOCAL_FILE_CACHE_PATH)
    message(FATAL_ERROR "DC_LOCAL_FILE_CACHE_PATH not set, you can set it on the command line or in env_personal.cmake")
endif()

if(NOT DC_LOCAL_FILE_CACHE_PATH MATCHES "^/")
    #the file cache is a relative path. Putting it in the build out dir
    SET(DC_LOCAL_FILE_CACHE_PATH ${DC_OUTPUT_PATH}/${DC_LOCAL_FILE_CACHE_PATH})
endif()

IF(NOT DC_ARTIFACTORY)
    message(FATAL_ERROR "DC_ARTIFACTORY not set, you can set it on the command line or in env_personal.cmake")
ENDIF()

IF(NOT DC_ARTIFACTORY_USER)
    message(FATAL_ERROR "DC_ARTIFACTORY_USER not set, you can set it on the command line or in env_personal.cmake")
ENDIF()

IF(NOT DC_ARTIFACTORY_KEY)
    message(FATAL_ERROR "DC_ARTIFACTORY_KEY not set, you can set it on the command line or in env_personal.cmake")
ENDIF()

include(${CMAKE_CURRENT_LIST_DIR}/conan.cmake)

SET(ENV{CONAN_USER_HOME} "${DC_LOCAL_FILE_CACHE_PATH}/conan/${DC_PLATFORM}")

execute_process(COMMAND conan remove --locks)

conan_config_install(
        ITEM ${CMAKE_CURRENT_LIST_DIR}/platforms/conan.conf
)

conan_config_install(
        ITEM ${CMAKE_CURRENT_LIST_DIR}/platforms/settings.yml
)

conan_add_remote(URL ${DC_ARTIFACTORY} NAME the-artifactory INDEX 0)
execute_process(COMMAND conan user -p ${DC_ARTIFACTORY_KEY} -r the-artifactory  ${DC_ARTIFACTORY_USER})

conan_cmake_install(
        PATH_OR_REFERENCE ${CMAKE_CURRENT_LIST_DIR}/platforms/conanfile.${DC_PLATFORM}
        #PROFILE_HOST ${CMAKE_CURRENT_LIST_DIR}/platforms/profile.${DC_PLATFORM}
        #PROFILE_BUILD ${CMAKE_CURRENT_LIST_DIR}/platforms/profile.amd64-gcc8
        LOCKFILE ${CMAKE_CURRENT_LIST_DIR}/platforms/lockfile.${DC_PLATFORM}
        BUILD missing UPDATE
)


if(NOT EXISTS ${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
    message(ERROR "The file conanbuildinfo.cmake doesn't exist, you have to run conan install first")
endif()

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/platforms/${DC_PLATFORM}.cmake)

