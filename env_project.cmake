IF(NOT DC_PLATFORM)
    SET(DC_PLATFORM "amd64-gcc8")
ENDIF(NOT DC_PLATFORM)

IF(NOT DC_LOCAL_FILE_CACHE_PATH)
    SET(DC_LOCAL_FILE_CACHE_PATH "${CMAKE_CURRENT_LIST_DIR}/local_file_cache")
ENDIF(NOT DC_LOCAL_FILE_CACHE_PATH)