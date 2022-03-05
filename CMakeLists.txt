cmake_minimum_required(VERSION 3.16...3.23)

project(
    "CMake Template"
    LANGUAGES CXX
    VERSION "0.1.0"
    DESCRIPTION "description"
    HOMEPAGE_URL "https://github.com/Phytolizer/my-cmake-template"
)

list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")
include(DeclareModule)

declare_module(
    input
    KIND library
    SOURCES input.cpp
)
