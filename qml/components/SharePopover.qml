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
import Ubuntu.Components.ListItems 0.1
import Ubuntu.Components.Popups 0.1

Popover {
    id: popover

    signal send(var id)

    Repeater {
        width: parent.width
        height: parent.height
        anchors.fill: parent
        model: accountsModel
        delegate: MultiValue {
            // HACK because of there is a bug with custom colors
            Label {
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                    margins: units.gu(2)
                }
                text: provider
                fontSize: "medium"
                color: Theme.palette.normal.overlayText
            }
            values: [ displayName ]
            property real accountId: id
            property string serviceName: provider
            icon: {
                return "/usr/share/icons/ubuntu-mobile/apps/144/" + iconName + ".png"
            }
            onClicked: {
                send(accountId)
                //var share_string = page.memory.getShareString()
                //friends.sendForAccountAsync(accountId, share_string)
            }
        }
    }
}