cmake_minimum_required(VERSION 3.31)
project(RechnungsApp LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_COMPILER clang++)

find_package(Qt6 REQUIRED COMPONENT Widgets)

add_executable(RechnungsApp
    main.cpp
)

target_link_libraries(RechnungsApp Qt6::Widgets)

