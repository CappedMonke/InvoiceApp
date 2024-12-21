cmake_minimum_required(VERSION 3.31)
project(RechnungsApp VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Core Gui Widgets)

add_executable(RechnungsApp Source/Main.cpp)
target_link_libraries(RechnungsApp Qt6::Core Qt6::Gui Qt6::Widgets)
