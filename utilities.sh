#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#Include
. "$(pwd)/myInclude.sh"
#----------Start----------#
######################################################################
read -r -p "Instalar o Synaptic? - Gerenciador de Pacotes! [y|n] " SYNAPTIC
read -r -p "Instalar o GParted? - Gerenciador de Partições! [y|n] " GPARTED
read -r -p "Instalar o Gnome Disk? - Gerenciador de discos! [y|n] " GNOMEDISK
read -r -p "Instalar o Gufw? - Gerenciador de Firewall? [y|n] " GUFW
read -r -p "Instalar o Blueman? Gerenciador de Bluetooth! [y|n] " BLUEMAN
read -r -p "Instalar o Cups? - Gerenciador de Impressoras! [y|n] " CUPS
read -r -p "Instalar o Cheese? Gerenciador de WebCam! [y|n] " CHEESE
read -r -p "Instalar o SoundRecorder? Gravador de Som simples! [y|n] " SOUNDRECORDER
read -r -p "Instalar o Transmission? Cliente BitTorrent! [y|n] " TORRENT
read -r -p "Instalar o Conky? Monitor de sistema widgets da área de trabalho! [y|n] " CONKY
######################################################################
#Sinaptic
if [ "$SYNAPTIC" = "y" ]; then
    $myPRG install -y synaptic
else
    $myPRG remove -y synaptic
fi
#Gparted
if [ "$GPARTED" = "y" ]; then
    apt install -y gparted
fi
#Gnome Disk
if [ "$GNOMEDISK" = "y" ]; then
    $myPRG install -y gnome-disk-utility
    $myPRG install -y baobab
fi
#Gufw
if [ "$GUFW" = "y" ]; then
    $myPRG install -y gufw
fi
#Blueman
if [ "$BLUEMAN" = "y" ]; then
    $myPRG install -y blueman
fi
#Cups
if [ "$CUPS" = "y" ]; then
    $myPRG install -y cups
    $myPRG install -y printer-driver-all
    $myPRG install -y hplip hp-ppd
    $myPRG install -y openprinting-ppds
    $myPRG install -y simple-scan
fi
#Cheese
if [ "$CHEESE" = "y" ]; then
    $myPRG install -y cheese
fi
#Sound Recorder
if [ "$SOUNDRECORDER" = "y" ]; then
    $myPRG install -y gnome-sound-recorder
fi
#TORRENT
if [ "$TORRENT" = "y" ]; then
    $myPRG install -y transmission
fi
#CONKY
if [ "$CONKY" = "y" ]; then
    $myPRG install -y conky-all
    $myPRG install -y fonts-font-awesome
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
update-grub2 && $myPRG autoremove -y && apt autoclean && apt clean
#Reinicia o sistema
read -r -p "Instalação concluida! Seu pc precisa ser reiniciad! [Enter] " REBOOT
if [ "$REBOOT" = "y" ]; then
    rm -f -r /tmp/* && reboot
else
    rm -f -r /tmp/* && reboot
fi
