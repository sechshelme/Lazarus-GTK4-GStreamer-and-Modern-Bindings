
# Install Distrobox
```bash
sudo apt install distrobox podman
```

# Images installieren

## Intel
```bash
distrobox create -a "--platform=linux/amd64" -i docker.io/library/ubuntu:25.04 -n ubuntu-25
```

## ARM64
```bash
distrobox create -a "--platform=linux/arm64" -i docker.io/library/ubuntu:25.04 -n ubuntu-25-arm64
distrobox create -a "--platform=linux/arm64" -i debian -n debian-arm64
```

## RISC-V
```bash
distrobox create -a "--platform=linux/riscv64" -i docker.io/library/ubuntu:25.04 -n ubuntu-riscv
```

Evtl. nur für arm
```bash
sudo apt install qemu-system qemu-user-static binfmt-support
```

Distroboxen auflisten:
```bash
distrobox list
```


Distrobox starten:_
```bash
distrobox enter [images] ( erster Start geht sehr lang )
```



### Prozesse auflisten
```bash
podman logs -f [images]
```

## Version Abfrage
```bash
pkg-config --modversion glib-2.0
```


# Distrobox Tips

## [TAB] für Packetauswahl
```sh
sudo apt install bash-completion
sudo rm /etc/apt/apt.conf.d/docker-clean
sudo apt update
```

## Language auf CH stellen
```bash
sudo apt install -y locales language-pack-de language-pack-gnome-de
sudo locale-gen de_CH.UTF-8
sudo update-locale LANG=de_CH.UTF-8
sudo update-locale LC_NUMERIC=de_CH.UTF-8 LC_TIME=de_CH.UTF-8 LC_MONETARY=de_CH.UTF-8 LC_PAPER=de_CH.UTF-8 LC_MEASUREMENT=de_CH.UTF-8
sudo localectl set-x11-keymap ch
```

## NAS verbinden
```bash
sudo ln var/run/host/n4800/ n4800 -s
```

## Programme für den host verlinken
```bash
distrobox enter ubuntu-dev -- distrobox-export --bin /usr/bin/wine
distrobox enter ubuntu-dev -- distrobox-export --bin /usr/bin/meson
distrobox enter ubuntu-dev -- distrobox-export --bin /usr/bin/blender
distrobox enter ubuntu-dev -- distrobox-export --bin /usr/bin/yt-dlp

distrobox enter ubuntu-dev -- distrobox-export --bin /home/tux/fpcupdeluxe_trunk/lazarus/lazarus
```

## Abfrage was gestartet wird
```bash
type -a yt-dlp 
which yt-dlp 
```

## OS abfragen
```bash
cat /etc/os-release
```


# Distrobox Verwaltung

https://github.com/ranfdev/DistroShelf


## Im Browser

Installieren:
```bash
sudo apt install cockpit cockpit-podman
```

In Browser folgenden Link eingeben [https://localhost:9090]

# distroBox mit Nemo öffnen

/home/tux/.local/share/nemo/actions

## Ubuntu LTS:
in Folgenden Ordner `~/.local/share/nemo/actions` eine Datei mit `ubuntu_lts.nemo_action` erstellen.
```ini
[Nemo Action]
Active=true
Name=Distrobox ubuntu-lts Terminal öffnen
Comment=Öffnet dieses Verzeichnis direkt in einem Distrobox-Container
Exec=gnome-terminal --working-directory="%F" -e "distrobox enter ubuntu-lts"
Icon-Name=utilities-terminal
Selection=any
Extensions=dir;
EscapeSpaces=true
```

## Ubuntu Entwickler:
in Folgenden Ordner `~/.local/share/nemo/actions` eine Datei mit `ubuntu_dev.nemo_action` erstellen.
```ini
[Nemo Action]
Active=true
Name=Distrobox ubuntu-dev Terminal öffnen
Comment=Öffnet dieses Verzeichnis direkt in einem Distrobox-Container
Exec=gnome-terminal --working-directory="%F" -e "distrobox enter ubuntu-dev"
Icon-Name=utilities-terminal
Selection=any
Extensions=dir;
EscapeSpaces=true
```

## Lazarus Trunk (Distrobox):
in Folgenden Ordner `~/.local/share/nemo/actions` eine Datei mit `lazarus_trunk.nemo_action` erstellen.
```ini
[Nemo Action]
Active=true
Name=Mit Lazarus Trunk (Distrobox) öffnen
Comment=Öffnet diese Projekt- oder Quellcodedatei in Lazarus im ubuntu-dev Container
Exec=/home/tux/.local/bin/lazarus_ubuntu_dev %F
Icon-Name=lazarus
Selection=notnone
Extensions=lpi;lpr;pas;pp;inc;
EscapeSpaces=false
```




