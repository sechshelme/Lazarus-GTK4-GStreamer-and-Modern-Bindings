# Fedora Distrobox: GTK4 für Windows (32/64 Bit) bauen und testen

Mit dieser Anleitung kannst du in einer Fedora-Distrobox-Umgebung GTK4 für Windows (32 und 64 Bit) bauen und die DLLs mit Wine auf deinem Linux-Host testen.

## Voraussetzungen

- Ubuntu oder ein anderes Debian-basiertes System
- Terminalzugang mit sudo-Rechten

## Installation der benötigten Tools

sudo apt update
sudo apt install podman
sudo apt install distrobox

## Fedora-Container mit Distrobox erstellen und starten

distrobox create --name fedora44 --image fedora:44
distrobox enter fedora44

## MinGW GTK4 für Windows im Container installieren

### Nur GTK4 DLL
```sh
# sudo dnf install mingw32-gtk4 mingw64-gtk4
sudo dnf install mingw64-gtk4
# sudo dnf install mingw64*
```

### Alle möglichnen DLL  
```sh
sudo dnf install mingw*
```

## 4. GTK4 DLLs exportieren

### 64-Bit Windows

```sh
cd /usr/x86_64-w64-mingw32/sys-root/mingw/bin/
cp . ~/win64_dll/ -r
```

### 32-Bit Windows

```sh
cd /usr/i686-w64-mingw32/sys-root/mingw/bin/
cp . ~/win32_dll/ -r
```

## 5. GTK4-Demo unter Wine auf dem Host starten (64 Bit)

```sh
cd ~/win64_dll
wine gtk4-demo
```

## Updaten:

### Einfaches update

```sh
sudo dnf upgrade --refresh
```

### Neueste Version Upgraden:

```sh
sudo dnf install dnf-plugin-system-upgrade
sudo dnf system-upgrade download --refresh --releasever=44
sudo dnf system-upgrade reboot
```

# MSYS2 auf Linux
https://github.com/HolyBlackCat/quasi-msys2


