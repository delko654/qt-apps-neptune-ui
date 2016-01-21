/****************************************************************************
**
** Copyright (C) 2016 Pelagicore AG
** Contact: http://www.qt.io/ or http://www.pelagicore.com/
**
** This file is part of the Neptune IVI UI.
**
** $QT_BEGIN_LICENSE:GPL3-PELAGICORE$
** Commercial License Usage
** Licensees holding valid commercial Pelagicore Neptune IVI UI
** licenses may use this file in accordance with the commercial license
** agreement provided with the Software or, alternatively, in accordance
** with the terms contained in a written agreement between you and
** Pelagicore. For licensing terms and conditions, contact us at:
** http://www.pelagicore.com.
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
** SPDX-License-Identifier: GPL-3.0
**
****************************************************************************/

import QtQuick 2.1
import QtQuick.Layouts 1.0
import controls 1.0
import utils 1.0

UIElement {
    id: root

    RowLayout {
        id: content

        spacing: 0
        anchors.top: parent.top
        anchors.topMargin: Style.vspan(1)
        anchors.horizontalCenter: parent.horizontalCenter
        height: parent.height

        ListViewManager {
            id: view

            width: Style.hspan(5)
            Layout.fillHeight: true

            model: ListModel {
                ListElement { name: "Tire Pressure Monitor"; symbol: ""; slide: "Status" }
                ListElement { name: "Warning"; symbol: "tire_pressure"; slide: "TireFault" }
                ListElement { name: "Trunk Open"; symbol: "trunk_open"; slide: "HatchFault" }
                ListElement { name: "Door Open"; symbol: "door_open"; slide: "DoorFault" }
                ListElement { name: "Car Color"; symbol: ""; slide: "" }
            }

            delegate: CategoryListItem {
                width: ListView.view.width
                height: Style.vspan(3)

                text: model.name.toUpperCase()
                symbol: model.symbol

                onClicked: {
                    view.currentIndex = index
                }
            }
        }

        UIElement {
            id: composerParent
            hspan: 11
            Layout.fillHeight: true

            Loader {
                width: parent.width
                height: Style.vspan(15)
                sourceComponent: carDemo
            }
        }
    }

    Component {
        id: carDemo
        Image {
            source: "white.png"
        }
    }
}
