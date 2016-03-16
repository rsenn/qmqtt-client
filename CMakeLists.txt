cmake_minimum_required(VERSION 2.8.11)

project(MQTT-Plot)

#if(NOT CMAKE_MODULES_DIR) 
#	set(CMAKE_MODULES_DIR "${CMAKE_SOURCE_DIR}/CMakeModules")
#endif()

include("${CMAKE_SOURCE_DIR}/CMakeModules/BoostLocal.cmake")

# Find includes in corresponding build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)
# Instruct CMake to run moc automatically when needed.
set(CMAKE_AUTOMOC ON)

if(CMAKE_COMPILER_IS_GNUCXX)
	add_definitions(-std=gnu++1y)
endif()

# Find the QtWidgets library
find_package(Qt5Widgets)

include_directories("${CMAKE_SOURCE_DIR}/mqtt_client_cpp/include")

# Tell CMake to create the helloworld executable
add_executable(MQTT-Plot  
	main.cpp mainwindow.cpp mainwindow.h mqtt_client_cpp/include/mqtt/client.hpp mqtt_client_cpp/include/mqtt/connect_flags.hpp mqtt_client_cpp/include/mqtt/connect_return_code.hpp mqtt_client_cpp/include/mqtt/control_packet_type.hpp mqtt_client_cpp/include/mqtt/encoded_length.hpp mqtt_client_cpp/include/mqtt/exception.hpp mqtt_client_cpp/include/mqtt/fixed_header.hpp mqtt_client_cpp/include/mqtt/hexdump.hpp mqtt_client_cpp/include/mqtt/publish.hpp mqtt_client_cpp/include/mqtt/qos.hpp mqtt_client_cpp/include/mqtt/remaining_length.hpp mqtt_client_cpp/include/mqtt/session_present.hpp mqtt_client_cpp/include/mqtt/str_connect_return_code.hpp mqtt_client_cpp/include/mqtt/str_qos.hpp mqtt_client_cpp/include/mqtt/utf8encoded_strings.hpp mqtt_client_cpp/include/mqtt/will.hpp mqtt_client_cpp/include/mqtt_client_cpp.hpp QCustomPlot/qcustomplot.cpp QCustomPlot/qcustomplot.h updatethread.cpp updatethread.h
	)

#target_link_libraries(MQTT-Plot ${EXTRA_LIBRARIES})
if(UNIX)
	set(EXTRA_LIBRARIES ${EXTRA_LIBRARIES} pthread)

endif(UNIX)


# Use the Widgets module from Qt 5.
target_link_libraries(MQTT-Plot Qt5::Widgets ${EXTRA_LIBRARIES})

