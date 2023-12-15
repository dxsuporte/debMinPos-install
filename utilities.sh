#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
######################################################################
read -r -p "Instalar Utilitario Terminal? [y|n] " TERMINAL
read -r -p "Instalar gufw? [y|n] " FIREWALL
read -r -p "Instalar synaptic? [y|n] " SYNAPTIC
read -r -p "Instalar gparted? [y|n] " GPARTED
read -r -p "Instalar baobab? [y|n] " BAOBAB
read -r -p "Instalar Gnome Disk? [y|n] " GNOMEDISK
read -r -p "Instalar mintstick? [y|n] " MINTSTICK
read -r -p "Instalar Torrent? [y|n] " TORRENT
read -r -p "Instalar bluetooth? [y|n] " BLUETOOTH
read -r -p "Instalar gnome sound recorder? [y|n] " GNOMERECORDER
read -r -p "Instalar CD/DVD? [y|n] " DVD
read -r -p "Gostaria de otimizar a bateria do notebook? [y|n] " TLP
read -r -p "Instalar o Software para WebCam? [y|n] " CHEESE
read -r -p "Instalar o Software e drives para Impressoras? [y|n] " IMP
read -r -p "Instalar a loja de Software? [y|n] " SOFTWAREDEB
######################################################################
#Gerenciador de TERMINAL.
if [ "$TERMINAL" = "y" ]; then
    apt install -y neofetch arping
    #Bash User Root
    bash -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)" --unattended || echo 'OK'
    sed -i 's/OSH_THEME="font"/OSH_THEME="zork"/g' /root/.bashrc
    #Bash User First Home
    runuser -l $(id 1000 -u -n) -c 'bash -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)" --unattended' || echo 'OK'
    sed -i 's/OSH_THEME="font"/OSH_THEME="mairan"/g' /home/$(id 1000 -u -n)/.bashrc
fi
#Gerenciador de FIREWALL.
if [ "$FIREWALL" = "y" ]; then
    apt install -y gufw
fi
#Gerenciador de SYNAPTIC.
if [ "$SYNAPTIC" = "y" ]; then
    apt install -y synaptic
fi
#Gerenciador de GPARTED.
if [ "$GPARTED" = "y" ]; then
    apt install -y gparted
fi
#Gerenciador de BAOBAB.
if [ "$BAOBAB" = "y" ]; then
    apt install -y baobab
fi
#Gerenciador de GNOMEDISK.
if [ "$GNOMEDISK" = "y" ]; then
    apt install -y gnome-disk-utility
fi
#Gerenciador de MINTSTICK.
if [ "$MINTSTICK" = "y" ]; then
    apt install -y mintstick
fi
#Gerenciador de TORRENT.
if [ "$TORRENT" = "y" ]; then
    apt install -y qbittorrent
fi
#Gerenciador de BLUETOOTH.
if [ "$BLUETOOTH" = "y" ]; then
    apt install -y bluez blueman pulseaudio-module-bluetooth
fi
#Gerenciador de GNOMERECORDER.
if [ "$GNOMERECORDER" = "y" ]; then
    apt install -y gnome-sound-recorder
fi
#Gerenciador de DVD.
if [ "$DVD" = "y" ]; then
    apt install -y libdvd-pkg
fi
#Otimizar bateria do notebook
if [ "$TLP" = "y" ]; then
    apt install -y laptop-mode-tools
    apt install -y tlp
fi
#Cheese webcam
if [ "$CHEESE" = "y" ]; then
    apt install -y cheese
fi
#Sofware e drives Impressoras
if [ "$IMP" = "y" ]; then
    apt install -y system-config-printer
    apt install -y printer-driver-all
    apt install -y printer-driver-escpr
    apt install -y printer-driver-gutenprint
    apt install -y cups
    apt install -y hplip
    apt install -y hp-ppd
    apt install -y openprinting-ppds
    apt install -y simple-scan
fi
#Software DEB
if [ "$SOFTWAREDEB" = "y" ]; then
    apt install -y gnome-software
else
    apt install -y deepin-deb-installer
    apt install -y gnome-packagekit
fi
#Limpeza no apt
apt autoremove -y
apt autoclean
apt clean
#Reinicia o sistema
read -r -p "Instalação concluida! Seu pc precisa ser reiniciad! [Enter] " REBOOT
reboot
