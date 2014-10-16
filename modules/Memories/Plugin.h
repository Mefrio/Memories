/**
 * This file is part of Memories.
 *
 * Copyright 2013 (C) Giulio Collura <random.cpp@gmail.com>
 *                    Mario Guerriero <mefrio.g@gmail.com>
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

#ifndef MEMORIES_PLUGIN_H
#define MEMORIES_PLUGIN_H

#include <QtQml/QQmlEngine>
#include <QtQml/QQmlExtensionPlugin>

/*
 ----8<-----

 import Memories 0.1

 Rectangle {
   width: 200
   height: 200

   Utils {
      id: utils
   }

   Text {
     anchors.centerIn: parent
     text: utils.homePath()
   }
 }

 -----8<------
*/
class MemoriesPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QQmlExtensionInterface")

public:
    void registerTypes(const char *uri);
};
#endif // MEMORIES_PLUGIN_H
