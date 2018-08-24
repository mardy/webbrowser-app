/*
 * Copyright 2015-2016 Canonical Ltd.
 *
 * This file is part of webbrowser-app.
 *
 * webbrowser-app is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * webbrowser-app is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.4

Item {
    visible: false

    property var webview
    property bool forceHide: false
    property bool forceShow: false
    property int defaultMode: internal.modeAuto

    onWebviewChanged: internal.updateVisibility()
    onForceHideChanged: internal.updateVisibility()
    onForceShowChanged: internal.updateVisibility()

    QtObject {
        id: internal

        readonly property int modeAuto: 0
        readonly property int modeShown: 1
        readonly property int modeHidden: 2

        function updateVisibility() {
            if (!webview) {
                return
            }
            webview.locationBarController.animated = false
            if (forceHide) {
                webview.locationBarController.mode = internal.modeHidden
            } else if (forceShow) {
                webview.locationBarController.mode = internal.modeShown
            } else if (!webview.fullscreen) {
                webview.locationBarController.mode = defaultMode
                if (webview.locationBarController.mode == internal.modeAuto) {
                    webview.locationBarController.show(false)
                }
            }
            webview.locationBarController.animated = true
        }
    }

    Connections {
        target: webview

        onFullscreenChanged: {
            if (webview.fullscreen) {
                webview.locationBarController.mode = internal.modeHidden
            } else if (!forceHide) {
                if (forceShow) {
                    webview.locationBarController.mode = internal.modeShown
                } else {
                    webview.locationBarController.mode = defaultMode
                    if (webview.locationBarController.mode == internal.modeAuto) {
                        webview.locationBarController.show(true)
                    }
                }
            }
        }

        onLoadingStateChanged: {
            if (webview.loading && !webview.fullscreen && !forceHide && !forceShow &&
                (webview.locationBarController.mode == internal.modeAuto)) {
                webview.locationBarController.show(true)
            }
        }
    }
}
