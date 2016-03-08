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

SOURCES +=    qmqtt/qmqtt_client.cpp \
    qmqtt/qmqtt_client_p.cpp \
    qmqtt/qmqtt_frame.cpp \
    qmqtt/qmqtt_message.cpp \
    qmqtt/qmqtt_message_p.cpp \
    qmqtt/qmqtt_network.cpp \
    qmqtt/qmqtt_routedmessage.cpp \
    qmqtt/qmqtt_router.cpp \
    qmqtt/qmqtt_routesubscription.cpp \
    qmqtt/qmqtt_socket.cpp \
    qmqtt/qmqtt_timer.cpp \
    main.cpp \
    mainwindow.cpp \
    connform.cpp \
    pubform.cpp \
    subform.cpp

HEADERS  +=   qmqtt/qmqtt.h \
    qmqtt/qmqtt_client.h \
    qmqtt/qmqtt_client_p.h \
    qmqtt/qmqtt_frame.h \
    qmqtt/qmqtt_global.h \
    qmqtt/qmqtt_message.h \
    qmqtt/qmqtt_message_p.h \
    qmqtt/qmqtt_network.h \
    qmqtt/qmqtt_networkinterface.h \
    qmqtt/qmqtt_routedmessage.h \
    qmqtt/qmqtt_router.h \
    qmqtt/qmqtt_routesubscription.h \
    qmqtt/qmqtt_socket.h \
    qmqtt/qmqtt_socketinterface.h \
    qmqtt/qmqtt_timer.h \
    qmqtt/qmqtt_timerinterface.h \
    mainwindow.h \
    connform.h \
    pubform.h \
    subform.h \
    mqttform.h

FORMS    += mainwindow.ui \
    connform.ui \
    pubform.ui \
    subform.ui
