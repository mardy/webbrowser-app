/*
 * Copyright 2014 Canonical Ltd.
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

import QtQuick 2.0
import Ubuntu.Components 0.1
import Ubuntu.DownloadManager 0.1
import Ubuntu.Content 0.1
import "MimeTypeMapper.js" as MimeTypeMapper
import "FileExtensionMapper.js" as FileExtensionMapper

Item {

    ContentDownloadDialog {
        id: downloadDialog
    }

    SingleDownload {
        id: singleDownload
        autoStart: false
        onDownloadIdChanged: {
            downloadDialog.downloadId = singleDownload.downloadId
            downloadDialog.show()
        }
    }

    function download(url, contentType, headers) {
        downloadDialog.contentType = contentType
        if(headers) {
            singleDownload.headers = headers
        }
        singleDownload.download(url)
    }

    function downloadPicture(url, headers) {
        download(url, ContentType.Pictures, headers)
    }

    function downloadMimeType(url, mimeType, headers, filename) {
        var contentType = MimeTypeMapper.mimeTypeToContentType(mimeType)
        if (contentType == ContentType.Unknown && filename) {
            // If we can't determine the content type from the mime-type
            // attempt to discover it from the file extension
            contentType = FileExtensionMapper.filenameToContentType(filename)
        }
        download(url, contentType, headers)
    }

}
