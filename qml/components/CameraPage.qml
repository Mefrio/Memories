/**
 * This file is part of Memories.
 *
 * Copyright 2013 (C) Mario Guerriero <mefrio.g@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
**/

import QtQuick 2.0
import Ubuntu.Components 0.1

Page {
    id: cameraPage
    objectName: "cameraPage"
    title: i18n.tr("Camera")
    visible: false

    states: [
        State {
            when: showToolbar
            PropertyChanges {
                target: tools
                opened: true
            }

            PropertyChanges {
                target: parent
                anchors.bottomMargin: units.gu(-2)
            }
        }

    ]

    Camera {
        id: camera
        anchors.fill: parent

        onImagePathChanged: {
            memoryEditPage.addPhoto(imagePath)
            stack.pop()
            stack.push(memoryEditPage)
        }
    }

    function start() {
        camera.start()
    }

    function stop() {
        camera.stop()
    }

    tools: ToolbarItems {

        ToolbarButton {
            id: snapButton
            text: i18n.tr("Snaps")
            iconSource: image("camera.svg")

            onTriggered: {
                camera.capture()
            }
        }
    }
}
