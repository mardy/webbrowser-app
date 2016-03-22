/*
 * Copyright 2014-2016 Canonical Ltd.
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

.pragma library

var overrides = [
      ["^https?:\/\/(www\.)?google\.com\/calendar", "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 Chromium/35.0.1870.2 Chrome/35.0.1870.2 Safari/537.36"],
      ["^http:\/\/chrome\.angrybirds\.com\/", "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 Chrome/35.0.1870.2 Safari/537.36"], // http://pad.lv/1284158
      ["^https?:\/\/(www\.)?youtube\.com\/", "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 Chrome/35.0.1870.2 Safari/537.36"], // http://pad.lv/1412880
      ["^https?:\/\/(www\.)?google\..+\/maps", "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 Chrome/35.0.1870.2 Safari/537.36"], // http://pad.lv/1503506, http://pad.lv/1551649
      ["^https?:\/\/mail\.google\.com\/", "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 Chrome/47.0.2526.106 Safari/537.36"], // http://pad.lv/1452616
];
