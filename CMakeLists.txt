cmake_minimum_required(VERSION 2.8.11)

project(qmqtt-client)

#if(NOT CMAKE_MODULES_DIR) 
#	set(CMAKE_MODULES_DIR "${CMAKE_SOURCE_DIR}/CMakeModules")
#endif()

#include("${CMAKE_SOURCE_DIR}/CMakeModules/BoostLocal.cmake")

# Find includes in corresponding build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)
# Instruct CMake to run moc automatically when needed.


set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)

if(CMAKE_COMPILER_IS_GNUCXX)
	add_definitions(-std=gnu++1y)
endif()

add_definitions(-DQMQTT_LIBRARY=1)

# Find the QtWidgets library
find_package(Qt5 COMPONENTS Widgets Network PrintSupport REQUIRED)

if(Qt5Widgets_INCLUDES)
  include_directories("${Qt5Widgets_INCLUDES}")
 endif()
# We need add -DQT_WIDGETS_LIB when using QtWidgets in Qt 5.
  add_definitions(${Qt5Widgets_DEFINITIONS})

# Executables fail to build with Qt 5 in the default configuration
  # without -fPIE. We add that here.
  set(CMAKE_CXX_FLAGS "${Qt5Widgets_EXECUTABLE_COMPILE_FLAGS}")

include_directories(
  "${CMAKE_SOURCE_DIR}/mqtt_client_cpp/include"
  "${CMAKE_SOURCE_DIR}/qmqtt"
  "${CMAKE_BINARY_DIR}"
)

# Tell CMake to create the helloworld executable
add_executable(qmqtt-client  
    connform.cpp
    main.cpp
    mainwindow.cpp
    pubform.cpp
    qmqtt/qmqtt_client.cpp
    qmqtt/qmqtt_client_p.cpp
    qmqtt/qmqtt_frame.cpp
    qmqtt/qmqtt_message.cpp
    qmqtt/qmqtt_message_p.cpp
    qmqtt/qmqtt_network.cpp
    qmqtt/qmqtt_routedmessage.cpp
    qmqtt/qmqtt_router.cpp
    qmqtt/qmqtt_routesubscription.cpp
    qmqtt/qmqtt_socket.cpp
    qmqtt/qmqtt_timer.cpp
    subform.cpp

    moc_connform.cpp
    moc_mainwindow.cpp
    moc_pubform.cpp
    moc_qmqtt_client.cpp
    moc_qmqtt_network.cpp
    moc_qmqtt_router.cpp
    moc_qmqtt_routesubscription.cpp
    moc_qmqtt_socket.cpp
    moc_qmqtt_timer.cpp
    moc_subform.cpp
#  ${CMAKE_BINARY_DIR}/qmqtt-client_automoc.cpp
	)

#target_link_libraries(qmqtt-client ${EXTRA_LIBRARIES})
if(UNIX)
	set(EXTRA_LIBRARIES ${EXTRA_LIBRARIES} pthread)

endif(UNIX)


# Use the Widgets module from Qt 5.
target_link_libraries(qmqtt-client Qt5::Widgets Qt5::Network Qt5::PrintSupport ${EXTRA_LIBRARIES} ${Qt5Widgets_LIBRARIES})

