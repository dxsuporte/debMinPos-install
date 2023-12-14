#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#Gerenciador de bluetooth.
apt install -y bluez blueman pulseaudio-module-bluetooth
#Ferramenta do Sistema
apt install -y synaptic
apt install -y gparted
apt install -y gnome-disk-utility
apt install -y baobad
apt install -y gufw
apt install -y mintstick
#Instalar Fonts
#apt install -y fonts-noto* fonts-powerline fonts-firacode
#Programas de Básicos
apt install -y qbittorrent
apt install -y gnome-sound-recorder
#Programas de Shell
apt install -y neofetch
apt install -y arping
#Codecs CD/DVD
apt install -y libdvd-pkg
