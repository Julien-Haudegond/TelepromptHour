cmake_minimum_required(VERSION 3.5)

project(TelepromptHour LANGUAGES CXX)
set(EXECUTABLE_OUTPUT_PATH ./${CMAKE_BUILD_TYPE})

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC OFF)
set(CMAKE_AUTORCC OFF)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# QtCreator supports the following variables for Android, which are identical to qmake Android variables.
# Check http://doc.qt.io/qt-5/deployment-android.html for more information.
# They need to be set before the find_package(Qt5 ...) call.

#if(ANDROID)
#    set(ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android")
#    if (ANDROID_ABI STREQUAL "armeabi-v7a")
#        set(ANDROID_EXTRA_LIBS
#            ${CMAKE_CURRENT_SOURCE_DIR}/path/to/libcrypto.so
#            ${CMAKE_CURRENT_SOURCE_DIR}/path/to/libssl.so)
#    endif()
#endif()

find_package(Qt5 COMPONENTS Core Quick REQUIRED)

set(HEADER_FILES
  src/MessageHandler.hpp
)

set(SRC_FILES
  src/main.cpp
  src/MessageHandler.cpp
)

set(QML_FILES
  src/qml/main.qml
)

if(ANDROID)
    add_library(${PROJECT_NAME} SHARED
      ${HEADER_FILES}
      ${SRC_FILES}
      ${QML_FILES}
    )
else()
    add_executable(${PROJECT_NAME}
      ${HEADER_FILES}
      ${SRC_FILES}
      ${QML_FILES}
    )
endif()

target_compile_definitions(${PROJECT_NAME}
  PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(${PROJECT_NAME}
  PRIVATE Qt5::Core Qt5::Quick)
