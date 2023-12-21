#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
######################################################################
read -r -p "Instalar Utilitários de Terminal? [y|n] " TERMINAL
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
read -r -p "Instalar Tema Personalizado? [y|n] " THEME
######################################################################
#TERMINAL
if [ "$TERMINAL" = "y" ]; then
    apt install -y neofetch net-tools arping
    #Config Net-tools
    export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/bin/X11
    export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
    #Bash User Root
    bash -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)" --unattended || echo 'OK'
    sed -i 's/OSH_THEME="font"/OSH_THEME="zork"/g' /root/.bashrc
    #Bash User First Home
    runuser -l $(id 1000 -u -n) -c 'bash -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)" --unattended' || echo 'OK'
    sed -i 's/OSH_THEME="font"/OSH_THEME="mairan"/g' /home/$(id 1000 -u -n)/.bashrc
fi
#FIREWALL
if [ "$FIREWALL" = "y" ]; then
    apt install -y gufw
fi
#SYNAPTIC
if [ "$SYNAPTIC" = "y" ]; then
    apt install -y synaptic
fi
#GPARTED
if [ "$GPARTED" = "y" ]; then
    apt install -y gparted
fi
#GNOMEDISK
if [ "$GNOMEDISK" = "y" ]; then
    apt install -y gnome-disk-utility
    apt install -y gnome-calculator
    apt install -y baobab
fi
#TORRENT
if [ "$TORRENT" = "y" ]; then
    apt install -y qbittorrent
fi
#BLUETOOTH
if [ "$BLUETOOTH" = "y" ]; then
    apt install -y bluez blueman pulseaudio-module-bluetooth
fi
#SOUNDRECORDER
if [ "$SOUNDRECORDER" = "y" ]; then
    apt install -y gnome-sound-recorder
fi
#Cheese webcam
if [ "$CHEESE" = "y" ]; then
    apt install -y cheese
    apt install -y tlp
fi
#Impressoras
if [ "$IMP" = "y" ]; then
    apt install -y system-config-printer
    apt install -y printer-driver-all
    apt install -y printer-driver-escpr
    apt install -y printer-driver-gutenprint
    apt install -y cups
    apt install -y hplip hp-ppd
    apt install -y openprinting-ppds
    apt install -y simple-scan
fi
#Software DEB
if [ "$SOFTWAREDEB" = "y" ]; then
    apt install -y gnome-software
else
    apt install -y deepin-deb-installer
    apt install -y package-update-indicator
fi
#CONKY
if [ "$CONKY" = "y" ]; then
    apt install -y conky-all
    apt install -y fonts-font-awesome
    cp -f -r config/conky/conky.conf /etc/conky/
    cp -f -r config/conky/conky.desktop /etc/xdg/autostart
    ETH="$(lshw -c network | grep 'logical' | grep -m1 en | awk {'print $3'})"
    WTH="$(lshw -c network | grep 'logical' | grep -m1 wl | awk {'print $3'})"
    if [ $ETH ]; then
        sed -i "s|ETH|$ETH|g" /etc/conky/conky.conf
    fi
    if [ $WTH ]; then
        sed -i "s|WTH|$WTH|g" /etc/conky/conky.conf
    fi
fi
#THEME
if [ "$THEME" = "y" ]; then
    #Desktop Base
    tar -xvf config/desktop-base/dx-theme.tar.xz -C /usr/share/desktop-base/
    unlink /etc/alternatives/desktop-theme
    ln -s /usr/share/desktop-base/dx-theme/ /etc/alternatives/desktop-theme
    ln -sf /usr/share/desktop-base/dx-theme/login/background.svg /usr/share/backgrounds/default.svg
    #Atualizar Boot
    update-grub2
fi
#Backgrounds Links
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
#Limpeza no apt
apt autoremove -y
apt autoclean
apt clean
#Reinicia o sistema
read -r -p "Instalação concluida! Seu pc precisa ser reiniciad! [Enter] " REBOOT
reboot
