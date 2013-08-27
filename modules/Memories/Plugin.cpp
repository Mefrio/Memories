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

#include <QtQml>
#include <QtQml/QQmlContext>
#include "Plugin.h"
#include "Utils.h"


void MemoriesPlugin::registerTypes(const char *uri) {
    Q_ASSERT(uri == QLatin1String("Memories"));

    qmlRegisterType<Utils>(uri, 0, 1, "Utils");
}
