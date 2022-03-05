cmake_minimum_required(VERSION 3.16...3.23)

project(
    "Compiler Design in C++"
    LANGUAGES CXX
    VERSION "0.1.0"
    HOMEPAGE_URL "https://github.com/Phytolizer/CompilerDesignInCpp"
)

list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")
include(DeclareModule)

declare_module(
    input
    KIND library
    SOURCES input.cpp
)
