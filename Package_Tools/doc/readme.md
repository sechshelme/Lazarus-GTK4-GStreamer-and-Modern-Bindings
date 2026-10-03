# Übersetzen der C-Header
```
h2pas -p -T -d -c -e xxx.h
```

# Makro entschlüsseln / Kommentare entfernen
```
gcc main.c -o main_new.c -E

```

# Neusten meson installieren
```
git clone https://github.com/mesonbuild/meson.git
cd meson/
sudo python3 setup.py install
meson --version
```

## Mehr Infos
https://mesonbuild.com/Cross-compilation.html
https://stackoverflow.com/questions/57436089/meson-can-not-find-windows-resource-compiler-on-linux
https://sourceforge.net/p/meson/wiki/Cross%20compilation/

# Speicher Leeks mit C-Funktionen
`valgrind --leak-check=full ./project1`

# Binär Datei in Byte Array Konstante

## Als C-Include
`xxd -i xxx.bin -> xxx.h`

## Als Pascal Constante Array
`hexdump -v -e '16/1 "$%02X, " "\n"' xxx.bin > xxx.txt`


# Version des runtergeladenen Paketes abfragen
`git describe --tags`

# Alle "-" in Dateinname in "_" umbenenen
```
for file in *-*; do mv "$file" "${file//-/_}"; done
```

# Eingeklammerte resulte, Klammern entfernen
```
sed -i 's/extern\s*(\([^)]*\))/extern \1/g' *.h

find . -type f -name "*.h" -exec sed -i -E 's/APR_DECLARE\(([^)]+)\)[[:space:]]*/\1 /g' {} +

```

# long suchen
```
grep -r "long" . | grep -v "long long"
```





# lib und bin aktualisieren
```bash
sudo ldconfig
hash -r
```

# apt Infos


## Info über ein Paket
`apt show libsdl3-dev`

## Ganze History eines Paketes
`apt changelog libsdl3-dev`





# Programm Zeilen auswerten.
sudo apt install cloc



# wine
## MSYS2 Pakete
https://packages.msys2.org/queue


## MinGW Installer
(https://github.com/Vuniverse0/mingwInstaller/releases)

## DLL verkleinern
`x86_64-w64-mingw32-strip xxx.dll`

## DLL mit make bauen
`make CROSS_COMPILE=x86_64-w64-mingw32- HOST=x86_64-windows ZLIB=no IDSDIR="" SHARED=yes -j`

## Debugen
WINEDEBUG=+loaddll wine project1.exe




CMAKE:
(https://cmake.org/download/)

NMAKE:
(ftp://ftp.microsoft.com/softlib/mslfiles/nmake15.exe)

## Path erweitern
Bei `~/.bashrc` zuunderst folgendes ergänzen:
```
export WINEPATH="$WINEPATH;C:\users\tux\mingw64\bin"
```

#gir2pas
https://gitlab.com/freepascal.org/lazarus/lazarus/-/merge_requests/207
```
gir2pas -P Laz -e Set -i /usr/share/gir-1.0/Gtk-3.0.gir -o gtk3bindings
```

# Ubuntu im Browser 
Im Browser: http://localhost:3000

`docker run -d --name=webtop -e PUID=1000 -e PGID=1000 -e TZ=Etc/UTC -p 3000:3000 --shm-size="1gb" --restart unless-stopped lscr.io/linuxserver/webtop:ubuntu-mate`

# Release Updaten
```
#!/bin/bash
VERSION="10.26test"
git archive --format=zip HEAD -o "Lazarus-GNOME-${VERSION}-packages.zip"
zip -d "Lazarus-GNOME-${VERSION}-packages.zip" "**/C-include/"
gh release create "${VERSION}" "./Lazarus-GNOME-${VERSION}-packages.zip" --title "Lazarus-GNOME-${VERSION}" --notes "release Lazarus-GNOME-${VERSION}"


gh release create 10.26 --title "Lazarus-GNOME-10.26" --notes "release Lazarus-GNOME-10.26"
git archive --format=zip HEAD -o Lazarus-GNOME-10.26-packages.zip
```

# GTK4 App im Browser starten

In einem Terminal `gtk4-broadwayd` aufrufen

In einem 2. Terminal dir GTK4 App staerten `GDK_BACKEND=broadway ./project1`

Im Browser `http://localhost:8080` öffnen.

Anderer Port: `gtk4-broadwayd --port 8085`
















