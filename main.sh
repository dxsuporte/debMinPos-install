#!/bin/sh
#Stop the script if any command fails. || #Interromper o script se algum comando falhar.
set -e
#Mudar lingual do Sistema
update-locale LANG=pt_BR.UTF-8
locale-gen --purge pt_BR.UTF-8
#Desativar CDROM, codigo font e Habilitar Repositorio extras Debian
sed -i 's/deb cdrom:/#deb cdrom:/g' /etc/apt/sources.list
sed -i 's/deb-src/#deb-src/g' /etc/apt/sources.list
apt install -y software-properties-common software-properties-gtk
add-apt-repository -y contrib non-free
#Atualizar sistema
apt update && apt upgrade -y
#Drives
if [ $(lscpu | grep -c -i 'amd') != 0 ]; then
    apt install -y amd64-microcode
    apt install -y amdgcn-tools
fi
if [ $(lscpu | grep -c -i 'intel') != 0 ]; then
    apt install -y intel-microcode
    apt install -y intel-gpu-tools
fi
apt install -y firmware-linux
apt install -y linux-headers-$(uname -r)
#Interface grafica XFCE4
apt install -y xfce4-terminal
apt install -y xorg
apt install -y xfce4-session
apt install -y xfce4-panel
apt install -y xfce4-panel-profiles
apt install -y xfce4-power-manager
apt install -y xfce4-taskmanager
apt install -y xfce4-notifyd
apt install -y xfce4-appfinder
apt install -y xfce4-clipman
apt install -y xfce4-screenshooter
apt install -y xfce4-whiskermenu-plugin
apt install -y xfce4-pulseaudio-plugin
#apt install -y xfce4-goodies
apt install -y thunar
apt install -y thunar-archive-plugin
apt install -y thunar-media-tags-plugin
apt install -y mousepad
apt install -y ristretto
apt install -y python3-gi
apt install -y menulibre
apt install -y mugshot
apt install -y gigolo
apt install -y gvfs-*
#apt install -y xdg-user-dirs-gtk
#Interface Carregamento do X
apt install -y lightdm lightdm-gtk-greeter-settings
apt install -y plymouth plymouth-themes
#Instalar Theme
apt install -y orchis-gtk-theme
apt install -y greybird-gtk-theme
apt install -y materia-gtk-theme
apt install -y elementary-xfce-icon-theme
apt install -y bibata-cursor-theme
#Instalar Fonts
apt install -y fonts-noto* fonts-firacode fonts-powerline
#Ferramenta do Sistema
apt install -y gnome-system-tools
apt install -y synaptic
apt install -y gparted
apt install -y gnome-disks*
apt install -y baobad
apt install -y gufw
apt install -y mintstick
#Gerenciador de rede.
apt install -y network-manager network-manager-gnome
apt install -y blueman
#Programas de Básicos
apt install -y firefox-esr
apt install -y qbittorrent
apt install -y parole
apt install -y gnome-calculator
apt install -y gnome-sound-recorder
apt install -y atril
apt install -y neofetch
apt install -y bash-completion
#apt install -y evince
#Codecs para descompaquitar arquivos
apt install -y zip p7zip* unrar* rar arc arj cabextract lhasa unace* xz-utils
#Codecs de audio e video
apt install -y ffmpeg faad lame sox twolame vorbis-tools libavcodec-extra* gstreamer1.0-fdkaac
#-----------------------------Configurações do Sistema-----------------------------------------#
#Gerenciar Rede modo grafico
cp -f config/interfaces /etc/network/interfaces
#Desktop Theme
tar -xvf config/dx-theme.tar.xz -C /usr/share/desktop-base/
unlink /etc/alternatives/desktop-theme
ln -s /usr/share/desktop-base/dx-theme/ /etc/alternatives/desktop-theme
#Menu e configuraçães do xfce
cp -f xfce/mimeapps.list /etc/xdg/
cp -f xfce/xfce-mimeapps.list /etc/xdg/
cp -f xfce/menu/* /etc/xdg/menus/
mkdir -p /etc/xdg/terminator/
cp -f xfce/terminator/* /etc/xdg/terminator/
cp -f xfce/Thunar/* /etc/xdg/Thunar/
mkdir -p /etc/xdg/xfce4/terminal/
cp -f xfce/xfce4/terminal/* /etc/xdg/xfce4/terminal/
cp -f xfce/xfce4/whiskermenu/* /etc/xdg/xfce4/whiskermenu/
cp -f xfce/xfce4/xfconf/* /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/
#Aplicativos Padrão
sed -i 's/debian-sensible-browser/default-browser.desktop/g' /etc/xdg/xfce4/helpers.rc
#Tema da tela de login
cp -f config/lightdm-gtk-greeter.conf /etc/lightdm
#Habilitar Mostra usuario no login
sed -i 's/#greeter-hide-users=false/greeter-hide-users=false/g' /etc/lightdm/lightdm.conf
#Icones
tar -xvf config/icons.tar.xz -C /usr/share/icons/
#Backgrounds
tar -xvf config/backgrounds.tar.xz -C /usr/share/backgrounds
ln -sf /usr/share/backgrounds/xfce/* /usr/share/backgrounds/
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
#Modelo Thema Panel XFCE
cp -f xfce/theme/W7.tar.bz2 /usr/share/xfce4-panel-profiles/layouts/
#Habilitar theme de carregamento do sistemax
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet"/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash modprobe.blacklist=pcspkr"/g' /etc/default/grub
sed -i 's/#GRUB_GFXMODE=640x480/GRUB_GFXMODE=1024x768/g' /etc/default/grub
plymouth-set-default-theme -R bgrt && update-grub2
#Limpeza no apt
apt autoremove -y && apt autoclean && apt clean
#Reinicia o sistema
read -r -p "Instalação concluida! Seu pc precisa ser reiniciad! [Enter] " REBOOT
reboot
