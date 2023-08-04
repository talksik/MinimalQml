cmake_minimum_required(VERSION 3.5)

set(PROJECT_NAME "MinimalQml")
project(${PROJECT_NAME} LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 3rd party tools
find_package(Qt5 COMPONENTS
  Widgets
  Qml
  Quick
  REQUIRED
)

# not sure if needed
include_directories(${Qt5Widgets_INCLUDE_DIRS} ${QtQml_INCLUDE_DIRS})
add_definitions(${Qt5Widgets_DEFINITIONS} ${QtQml_DEFINITIONS} ${${Qt5Quick_DEFINITIONS}})

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

# get all files together
if(NOT DEFINED HEADERS)
    file(GLOB HEADERS ${CMAKE_CURRENT_SOURCE_DIR}/src/*.h)
endif()
if(NOT DEFINED SOURCES)
    file(GLOB SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp)
endif()
# print out the files
message(STATUS "HEADERS: ${HEADERS}")
message(STATUS "SOURCES: ${SOURCES}")
source_group("Header Files" FILES ${HEADERS})
source_group("Source Files" FILES ${SOURCES})

add_executable(${PROJECT_NAME} ${HEADERS} ${SOURCES} ${QT_RESOURCES})

target_link_libraries(${PROJECT_NAME}
    Qt5::Widgets
    Qt5::Qml
    Qt5::Quick
)

