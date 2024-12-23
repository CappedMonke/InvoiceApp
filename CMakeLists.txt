cmake_minimum_required(VERSION 3.31)
project(invoice_app VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Core Gui Widgets)
set(CMAKE_AUTOMOC ON)

add_executable(invoice_app 
    source/main.cpp 
    source/main_window.cpp)
    
target_link_libraries(invoice_app Qt6::Core Qt6::Gui Qt6::Widgets)
