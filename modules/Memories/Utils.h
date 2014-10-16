/**
 * This file is part of SaucyBacon.
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

#ifndef UTILS_H
#define UTILS_H

#include <QObject>
#include <QtCore>
#include <QStandardPaths>
#include <QAudioInput>
#include <QAudioRecorder>

class Utils : public QObject
{
    Q_OBJECT

    Q_ENUMS(StandardLocation)

public:
    explicit Utils(QObject *parent = 0);
    ~Utils();

    enum StandardLocation {
        DocumentsLocation = QStandardPaths::DocumentsLocation,
        PicturesLocation = QStandardPaths::PicturesLocation,
        HomeLocation = QStandardPaths::HomeLocation
    };

    Q_INVOKABLE QString standardLocation(StandardLocation location) const;
    Q_INVOKABLE QString homePath() const;
    Q_INVOKABLE bool fileExists(const QString& path) const;

    Q_INVOKABLE bool exportAsPdf(const QString& fileName, const QJsonObject& contents);

    Q_INVOKABLE bool recordAudioStart() const;
    Q_INVOKABLE void recordAudioStop() const;

private:

signals:
     void audioRecordStop();

Q_SIGNALS:

protected:

};

#endif // UTILS_H