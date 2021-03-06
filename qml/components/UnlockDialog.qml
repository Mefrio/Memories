/**
 * This file is part of Memories.
 *
 * Copyright 2013-2015 (C) Mario Guerriero <marioguerriero33@gmail.com>
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

import QtQuick 2.2
import Ubuntu.Components 1.2
import Ubuntu.Components.ListItems 1.0 as ListItem
import Ubuntu.Components.Popups 1.0
import Qt.labs.folderlistmodel 1.0
import "../../js/MD5.js" as Crypto

Dialog {
    id: dialogue
    title: i18n.tr("Unlock Memories")
    text: i18n.tr("Enter your password to continue to use Memories.")

    Label {
        id: errorLabel
        color: "red"
        text: i18n.tr("The password you entered is not valid.")
        visible: false
    }

    TextField {
        id: passwordField
        placeholderText: i18n.tr("Password...")
        echoMode: TextInput.Password
		onAccepted: confirmBtn.clicked()
    }

    Button {
		id: confirmBtn
        text: i18n.tr("Unlock")
        color: UbuntuColors.orange
        onClicked: {
            if(Crypto.MD5(passwordField.text) == password) {
                caller.locked = false
                PopupUtils.close(dialogue)
            }
            else
                errorLabel.visible = true
        }
    }

	Component.onCompleted: passwordField.forceActiveFocus();
}
