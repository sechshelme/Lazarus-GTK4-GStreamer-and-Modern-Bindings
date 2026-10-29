# Install Distrobox
`sudo apt install distrobox podman`

# Images installieren
## Intel
`distrobox create -a "--platform=linux/amd64" -i docker.io/library/ubuntu:25.04 -n ubuntu-25`

## ARM64
`distrobox create -a "--platform=linux/arm64" -i docker.io/library/ubuntu:25.04 -n ubuntu-25-arm64`
`distrobox create -a "--platform=linux/arm64" -i debian -n debian-arm64`

## RISC-V
`distrobox create -a "--platform=linux/riscv64" -i docker.io/library/ubuntu:25.04 -n ubuntu-riscv`


Evtl. nur für arm
`sudo apt install qemu-system qemu-user-static binfmt-support`

Distroboxen auflisten:
`distrobox list`

Distrobox starten:_
`distrobox enter [images]` ( erster Start geht sehr lang )


### Prozesse auflisten
`podman logs -f [images]`


## Version Abfrage
pkg-config --modversion glib-2.0


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


## OS abfragen
cat /etc/os-release



# Distrobox Verwaltung

https://github.com/ranfdev/DistroShelf


## Im Browser

Installierein:
`sudo apt install cockpit cockpit-podman`

In Browser folgenden Link eingeben [https://localhost:9090]


# distroBox mit Nemo öffnen

in Folgenden Ordner `~/.local/share/nemo/actions` eine Datei mit `*.nemo_action` erstellen.

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




