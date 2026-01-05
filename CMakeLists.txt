cmake_minimum_required(VERSION 3.16)

project(course VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick Sql)

qt_standard_project_setup(REQUIRES 6.8)

# On liste les fichiers C++ ici
qt_add_executable(appcourse
    main.cpp
    models/databasemanager.h
    models/databasemanager.cpp
    models/authcontroller.h
    models/authcontroller.cpp
)

# On liste les fichiers QML ici
qt_add_qml_module(appcourse
    URI course
    VERSION 1.0
    QML_FILES
        Files/Main.qml
        Files/pages/Login.qml
        Files/pages/Register.qml
        Files/components/Sidebar.qml
        Files/layout/MainPage.qml
        Files/pages/DashboardPage.qml
        Files/pages/SchedulePage.qml
        Files/pages/SessionsPage.qml
        Files/pages/TeachersPage.qml
        Files/pages/RoomsPage.qml
        Files/pages/ReportsPage.qml
        Files/pages/SettingsPage.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appcourse PROPERTIES
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appcourse
    PRIVATE Qt6::Quick Qt6::Sql
)

include(GNUInstallDirs)
install(TARGETS appcourse
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
