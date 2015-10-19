/****************************************************************************
**
** Copyright (C) 2015 Pelagicore AG
** Contact: http://www.pelagicore.com/
**
** This file is part of Neptune IVI UI.
**
** $QT_BEGIN_LICENSE:LGPL3$
** Commercial License Usage
** Licensees holding valid commercial Neptune IVI UI licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Pelagicore. For licensing terms
** and conditions see http://www.pelagicore.com.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 as published by the Free Software
** Foundation and appearing in the file LICENSE.GPLv3 included in the
** packaging of this file. Please review the following information to
** ensure the GNU General Public License version 3 requirements will be
** met: http://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.1
import utils 1.0
import service.vehicle 1.0

Item {
    id: root

    width: childrenRect.width
    height: childrenRect.height

    scale: zoom ? 0.7 : 1
    property bool zoom: false
    property int angle: zoom ? 45 : 0

    Behavior on angle {
        NumberAnimation { duration: 200 }
    }

    Behavior on x {
        NumberAnimation { duration: 200 }
    }

    Behavior on scale {
        NumberAnimation { duration: 200 }
    }

    transform: Rotation { origin.x: root.width/2; origin.y: root.height/2; axis { x: 0; y: 1; z: 0 } angle: root.angle }

    Image {
        id: background
        source: Style.gfx("cluster/left_dial_background")
    }

    Dial {
        anchors.centerIn: overlay
        anchors.verticalCenterOffset: 18

        value: VehicleService.speed / 240
    }

    Image {
        id: overlay
        anchors.top: background.top
        anchors.left: background.left
        anchors.topMargin: 116
        anchors.leftMargin: 174

        source: Style.gfx("cluster/left_dial_overlay")
    }

    Text {
        id: speedText

        anchors.verticalCenter: overlay.verticalCenter
        anchors.horizontalCenter: overlay.horizontalCenter
        anchors.verticalCenterOffset: -6

        font.family: Style.fontFamily
        font.pixelSize: 110
        font.letterSpacing: 4
        color: Style.colorWhite
        text: VehicleService.displaySpeed
    }
}