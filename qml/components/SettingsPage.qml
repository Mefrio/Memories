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
import U1db 1.0 as U1db
import "./MD5.js" as Crypto

Page {
    id: settings
    objectName: "settingsPage"
    title: i18n.tr("Settings")

    Component {
        id: passwordEditDialog
        Dialog {
            id: dialogue
            title: i18n.tr("Protect your memories")
            text: i18n.tr("Set a password to keep unwanted people away from you records.")

            TextField {
                id: passwordField
                placeholderText: i18n.tr("Password...")
                echoMode: TextInput.Password
            }

            Button {
                text: i18n.tr("Cancel")
                gradient: UbuntuColors.greyGradient
                onClicked: {
                    passwordSwitch.checked = false
                    PopupUtils.close(dialogue)
                }
            }

            Button {
                text: i18n.tr("Save")
                color: UbuntuColors.orange
                onClicked: {
                    print(passwordField.text)
                    saveSetting("password", Crypto.MD5(passwordField.text))
                    PopupUtils.close(dialogue)
                }
            }
        }
    }

    Column {
        id: containerLayout
        anchors {
            left: parent.left
            top: parent.top
            right: parent.right
        }
        Standard {
            text: i18n.tr("Protect memories with password")
            control: Switch {
                id: passwordSwitch
                checked: (password != nullPassword)
                onClicked: {
                    if(checked)
                        PopupUtils.open(passwordEditDialog)
                    else
                        saveSetting("password", nullPassword)
                }
            }
        }

        Standard {
            text: i18n.tr("Grid Layout")
            control: Switch {
                id: showGridSwitch
                checked: showGrid
                onClicked: {
                    saveSetting("showGrid", checked)
                }
            }
        }
    }
}