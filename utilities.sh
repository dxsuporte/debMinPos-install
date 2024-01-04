#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#APT or NALA
PRG="$1"
######################################################################
read -r -p "Instalar Firewall? [y|n] " FIREWALL
read -r -p "Instalar Gerenciador de Pacotes Synaptic? [y|n] " SYNAPTIC
read -r -p "Instalar Gerenciador de Partições GParted? [y|n] " GPARTED
read -r -p "Instalar Utilitário de discos Gnome Disk? [y|n] " GNOMEDISK
read -r -p "Instalar Cliente BitTorrent? [y|n] " TORRENT
read -r -p "Instalar Bluetooth? [y|n] " BLUETOOTH
read -r -p "Instalar Gravador de Som simples - SoundRecorder? [y|n] " SOUNDRECORDER
read -r -p "Instalar WebCam? [y|n] " CHEESE
read -r -p "Instalar Impressoras? [y|n] " IMP
read -r -p "Instalar Loja de Software? [y|n] " SOFTWAREDEB
read -r -p "Instalar Monitor de Sistema? [y|n] " CONKY
######################################################################
#FIREWALL
if [ "$FIREWALL" = "y" ]; then
    $PRG install -y gufw
fi
#SYNAPTIC
if [ "$SYNAPTIC" = "y" ]; then
    $PRG install -y synaptic
fi
#GPARTED
if [ "$GPARTED" = "y" ]; then
    apt install -y gparted
fi
#GNOMEDISK
if [ "$GNOMEDISK" = "y" ]; then
    $PRG install -y gnome-disk-utility
    $PRG install -y gnome-calculator
    $PRG install -y baobab
fi
#TORRENT
if [ "$TORRENT" = "y" ]; then
    $PRG install -y deluge
fi
#BLUETOOTH
if [ "$BLUETOOTH" = "y" ]; then
    $PRG install -y bluez blueman pulseaudio-module-bluetooth
fi
#SOUNDRECORDER
if [ "$SOUNDRECORDER" = "y" ]; then
    $PRG install -y gnome-sound-recorder
fi
#Cheese webcam
if [ "$CHEESE" = "y" ]; then
    $PRG install -y cheese
    $PRG install -y tlp
fi
#Impressoras
if [ "$IMP" = "y" ]; then
    $PRG install -y system-config-printer
    $PRG install -y printer-driver-all
    $PRG install -y printer-driver-escpr
    $PRG install -y printer-driver-gutenprint
    $PRG install -y cups
    $PRG install -y hplip hp-ppd
    $PRG install -y openprinting-ppds
    $PRG install -y simple-scan
fi
#Gnome Software
if [ "$SOFTWAREDEB" = "y" ]; then
    $PRG install -y gnome-software
    $PRG install -y flatpak
    $PRG install -y gnome-software-plugin-flatpak
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
fi
#CONKY
if [ "$CONKY" = "y" ]; then
    $PRG install -y conky-all
    $PRG install -y fonts-font-awesome
    cp -f -r /etc/conky/conky.bkp.conf /etc/conky/conky.conf
    #REDE
    ETH="$(lshw -c network | grep 'logical' | grep -m1 en | awk {'print $3'})"
    if [ $ETH ]; then
        sed -i "s|ETH|$ETH|g" /etc/conky/conky.conf
    fi
    #WI-FI
    WTH="$(lshw -c network | grep 'logical' | grep -m1 wl | awk {'print $3'})"
    if [ $WTH ]; then
        sed -i "s|WTH|$WTH|g" /etc/conky/conky.conf
    fi
fi
#Backgrounds Links
ln -sf /usr/share/desktop-base/dx-theme/login/background.svg /usr/share/backgrounds/default.svg
ln -sf /usr/share/desktop-base/emerald-theme/login/background.svg /usr/share/backgrounds/01.svg
ln -sf /usr/share/desktop-base/futureprototype-theme/login/background.svg /usr/share/backgrounds/02.svg
ln -sf /usr/share/desktop-base/homeworld-theme/login/background.svg /usr/share/backgrounds/03.svg
ln -sf /usr/share/desktop-base/joy-theme/login/background.svg /usr/share/backgrounds/04.svg
ln -sf /usr/share/desktop-base/lines-theme/login/background.svg /usr/share/backgrounds/05.svg
ln -sf /usr/share/desktop-base/moonlight-theme/login/background.svg /usr/share/backgrounds/06.svg
ln -sf /usr/share/desktop-base/softwaves-theme/login/background.svg /usr/share/backgrounds/07.svg
ln -sf /usr/share/desktop-base/spacefun-theme/login/background.svg /usr/share/backgrounds/08.svg
ln -sf /usr/share/desktop-base/emerald-theme/login/background-nologo.svg /usr/share/backgrounds/09.svg
ln -sf /usr/share/desktop-base/futureprototype-theme/login/background-nologo.svg /usr/share/backgrounds/10.svg
ln -sf /usr/share/desktop-base/homeworld-theme/login/background-nologo.svg /usr/share/backgrounds/11.svg
ln -sf /usr/share/desktop-base/lines-theme/login/background-nologo.svg /usr/share/backgrounds/12.svg
ln -sf /usr/share/desktop-base/moonlight-theme/login/background-nologo.svg /usr/share/backgrounds/13.svg
ln -sf /usr/share/desktop-base/softwaves-theme/login/background-nologo.svg /usr/share/backgrounds/14.svg
ln -sf /usr/share/plymouth/themes/emerald/Emerald_plymouth.svg /usr/share/backgrounds/15.svg
#Theme Bash User Root
bash -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)" --unattended || echo 'OK'
sed -i 's/OSH_THEME="font"/OSH_THEME="zork"/g' /root/.bashrc
#Theme Bash User First Home
runuser -l $(id 1000 -u -n) -c 'bash -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)" --unattended' || echo 'OK'
sed -i 's/OSH_THEME="font"/OSH_THEME="mairan"/g' /home/$(id 1000 -u -n)/.bashrc
#----------End----------#
#Atualizar Grub, Limpeza apt
update-grub2 && $PRG autoremove -y && apt autoclean && apt clean
#Reinicia o sistema
read -r -p "Instalação concluida! Seu pc precisa ser reiniciad! [Enter] " REBOOT
if [ "$REBOOT" = "y" ]; then
    reboot
else
    reboot
fi
