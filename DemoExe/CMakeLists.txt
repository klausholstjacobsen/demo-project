project (DemoExe LANGUAGES CXX)

add_executable(${PROJECT_NAME}
        src/DemoExe.cpp
        )

target_include_directories(${PROJECT_NAME} PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
        PRIVATE src)

target_link_libraries(${PROJECT_NAME} DemoLib)
