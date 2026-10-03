#!/bin/bash

# Prüfen, ob ein Parameter übergeben wurde
if [ -z "$1" ]; then
    echo "❌ Fehler: Keine Versionsnummer angegeben!"
    echo "👉 Nutzung: $0 <versionsnummer>"
    echo "💡 Beispiel: $0 10.26       (Monat.Jahr)" 
    exit 1
fi

# Die übergebene Versionsnummer in die Variable schreiben
VERSION="$1"

# 1. Das bereinigte ZIP-Archiv lokal erstellen
git archive --format=zip HEAD -o "Lazarus-GNOME-${VERSION}-packages.zip"

# 2. Die verbliebenen, leeren C-include Ordnerstrukturen aus dem ZIP löschen
zip -d "Lazarus-GNOME-${VERSION}-packages.zip" "**/C-include/"

# 3. Das GitHub-Release erstellen und das ZIP-Asset anhängen
gh release create "${VERSION}" "./Lazarus-GNOME-${VERSION}-packages.zip" --title "Lazarus-GNOME-${VERSION}" --notes "release Lazarus-GNOME-${VERSION}"

