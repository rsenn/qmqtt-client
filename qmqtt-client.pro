#-------------------------------------------------
#
# Project created by QtCreator 2013-03-22T21:02:13
#
#-------------------------------------------------
TEMPLATE = app

QT       += core gui network

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11
gcc: QMAKE_CXXFLAGS_CXX11 = -std=c++14

TARGET = qmqtt-client

DEFINES += QMQTT_LIBRARY=1


#NOTICE: add DYLD_LIBRARY_PATH to build environment.
INCLUDEPATH += qmqtt/src

SOURCES +=    qmqtt/src/qmqtt_client.cpp \
    qmqtt/src/qmqtt_client_p.cpp \
    qmqtt/src/qmqtt_frame.cpp \
    qmqtt/src/qmqtt_message.cpp \
    qmqtt/src/qmqtt_message_p.cpp \
    qmqtt/src/qmqtt_network.cpp \
    qmqtt/src/qmqtt_routedmessage.cpp \
    qmqtt/src/qmqtt_router.cpp \
    qmqtt/src/qmqtt_routesubscription.cpp \
    qmqtt/src/qmqtt_socket.cpp \
    qmqtt/src/qmqtt_timer.cpp \
    main.cpp \
    mainwindow.cpp \
    connform.cpp \
    pubform.cpp \
    subform.cpp

HEADERS  +=   qmqtt/src/qmqtt.h \
    qmqtt/src/qmqtt_client.h \
    qmqtt/src/qmqtt_client_p.h \
    qmqtt/src/qmqtt_frame.h \
    qmqtt/src/qmqtt_global.h \
    qmqtt/src/qmqtt_message.h \
    qmqtt/src/qmqtt_message_p.h \
    qmqtt/src/qmqtt_network.h \
    qmqtt/src/qmqtt_networkinterface.h \
    qmqtt/src/qmqtt_routedmessage.h \
    qmqtt/src/qmqtt_router.h \
    qmqtt/src/qmqtt_routesubscription.h \
    qmqtt/src/qmqtt_socket.h \
    qmqtt/src/qmqtt_socketinterface.h \
    qmqtt/src/qmqtt_timer.h \
    qmqtt/src/qmqtt_timerinterface.h \
    mainwindow.h \
    connform.h \
    pubform.h \
    subform.h \
    mqttform.h

FORMS    += mainwindow.ui \
    connform.ui \
    pubform.ui \
    subform.ui
