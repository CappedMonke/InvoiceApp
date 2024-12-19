qt_add_executable(RechnungsApp
    mainwindow.ui
    mainwindow.cpp
    main.cpp
)

target_link_libraries(RechnungsApp PRIVATE Qt6::Widgets)

set_target_properties(RechnungsApp PROPERTIES
    WIN32_EXECUTABLE ON
    MACOSX_BUNDLE ON
)