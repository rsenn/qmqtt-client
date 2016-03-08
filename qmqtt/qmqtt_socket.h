/*
 * qmqtt_socket.h - qmqtt socket header
 *
 * Copyright (c) 2013  Ery Lee <ery.lee at gmail dot com>
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *   * Redistributions of source code must retain the above copyright notice,
 *     this list of conditions and the following disclaimer.
 *   * Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *   * Neither the name of mqttc nor the names of its contributors may be used
 *     to endorse or promote products derived from this software without
 *     specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 */
#ifndef QMQTT_SOCKET_H
#define QMQTT_SOCKET_H

#include "qmqtt_socketinterface.h"
#include <QObject>
#include <QScopedPointer>

class QTcpSocket;

namespace QMQTT
{

class Socket : public SocketInterface
{
    Q_OBJECT
public:
    explicit Socket(QObject* parent = NULL);
    virtual	~Socket();

    void connectToHost(const QHostAddress& address, quint16 port);
    void disconnectFromHost();
    QAbstractSocket::SocketState state() const;
    bool waitForBytesWritten(int msecs = 30000);
    bool waitForReadyRead(int msecs = 30000);
    QAbstractSocket::SocketError error() const;
    bool atEnd() const;
    qint64 readData(char* data, qint64 maxlen);
    qint64 writeData(const char* data, qint64 len);

protected slots:
    void onStateChanged(QAbstractSocket::SocketState state);

protected:
    QScopedPointer<QTcpSocket> _socket;
};

}

#endif // QMQTT_SOCKET_H
