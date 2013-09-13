/***************************************************************************
 * Whatsoever ye do in word or deed, do all in the name of the             *
 * Lord Jesus, giving thanks to God and the Father by him.                 *
 * - Colossians 3:17                                                       *
 *                                                                         *
 * Ubuntu UI Extras - A collection of QML widgets not available            *
 *                    in the default Ubuntu UI Toolkit                     *
 * Copyright (C) 2013 Michael Spencer <sonrisesoftware@gmail.com>          *
 *                                                                         *
 * This program is free software: you can redistribute it and/or modify    *
 * it under the terms of the GNU General Public License as published by    *
 * the Free Software Foundation, either version 3 of the License, or       *
 * (at your option) any later version.                                     *
 *                                                                         *
 * This program is distributed in the hope that it will be useful,         *
 * but WITHOUT ANY WARRANTY; without even the implied warranty of          *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the            *
 * GNU General Public License for more details.                            *
 *                                                                         *
 * You should have received a copy of the GNU General Public License       *
 * along with this program. If not, see <http://www.gnu.org/licenses/>.    *
 ***************************************************************************/
import QtQuick 2.0
import Ubuntu.Components 0.1
import Ubuntu.Components.ListItems 0.1

Item {
    id: root

    clip: true
    //color: "white"
    //color: Qt.rgba(0.2,0.2,0.2,0.4)

    width: units.gu(10)
    height: units.gu(30)

    property alias selectedIndex: listView.currentIndex

    onSelectedIndexChanged: {
        value = values[selectedIndex]
    }

    property var value: model.get(listView.currentIndex).modelData

    property var values: []

    Component.onCompleted: selectedIndex = values.indexOf(value)

    PathView {
        id: listView
        anchors.fill: parent
        model: values

        delegate: Standard {
            highlightWhenPressed: false
            Label {
                anchors.centerIn: parent
                text: modelData
            }
            onClicked: listView.currentIndex = index
            showDivider: false
        }

        pathItemCount: listView.height / highlightItem.height + 1
        preferredHighlightBegin: 0.5
        preferredHighlightEnd: 0.5
        clip: true

        property int contentHeight: pathItemCount * highlightItem.height

        path: Path {
            startX: listView.width / 2; startY: -(listView.contentHeight - listView.height) / 2
            PathLine { x: listView.width / 2; y: listView.height + (listView.contentHeight - listView.height) / 2 }
        }

        maximumFlickVelocity: 400

        highlight: Rectangle {
            width: parent.width
            height: units.gu(6)
            property color baseColor: "#dd4814"
            gradient: Gradient {
                GradientStop {
                    position: 0.00;
                    color: Qt.lighter(baseColor, 1.3);
                }
                GradientStop {
                    position: 1.0;
                    color: baseColor;
                }
            }
        }
    }

}
