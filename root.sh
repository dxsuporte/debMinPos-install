#!/bin/sh
set -e
#Desativar CDROM, codigo font e Habilitar Repositorio extras Debian
sed -i 's/deb cdrom:/#deb cdrom:/g' /etc/apt/sources.list
sed -i 's/deb-src/#deb-src/g' /etc/apt/sources.list
sed -i 's/main non-free-firmware/main non-free-firmware contrib non-free/g' /etc/apt/sources.list
#Atualizar sistema
apt update && apt -y upgrade
#Mudar lingual do Sistema
update-locale LANG=pt_BR.UTF-8
locale-gen --purge pt_BR.UTF-8
#Instalar Interface grafica XFCE4
apt install -y xorg
apt install -y xfce4-terminal
apt install -y xfce4-goodies
apt install -y xfce4-panel
apt install -y xfce4-panel-profiles
apt install -y xfce4-session
apt install -y xfce4
apt install -y lightdm
apt install -y lightdm-gtk-greeter-settings
apt install -y python3-gi
apt install -y python3-psutil
apt install -y menulibre
apt install -y mugshot
apt install -y bash-completion
#Instalar Fonts
apt install -y fonts-noto
apt install -y fonts-powerline
#Instalar Theme
apt install -y plymouth
apt install -y plymouth-themes
apt install -y gnome-brave-icon-theme
apt install -y orchis-gtk-theme
apt install -y greybird-gtk-theme
apt install -y elementary-xfce-icon-theme
apt install -y breeze-cursor-theme
#Instalar gerenciador de rede, usuários, impressora e software para X.
apt install -y network-manager
apt install -y network-manager-gnome
apt install -y gnome-system-tools
apt install -y system-config-printer
apt install -y software-properties-gtk
#Instalar Ferramentas do Sistema
apt install -y synaptic
apt install -y gparted
apt install -y neofetch
apt install -y parole
apt install -y clementine
apt install -y gufw
apt install -y blueman
#Instalar Complementos do sistema
apt install -y firmware-linux
apt install -y xdg-user-dirs-gtk
apt install -y optipng
#Instalar Compartilhamento de rede
apt install -y samba
apt install -y smbclient
apt install -y wsdd
apt install -y wsdd2
apt install -y gvfs-backends
#Instalar outro programas
apt install -y firefox-esr
apt install -y curl
apt install -y wget
apt install -y atril
apt install -y galculator
apt install -y zip
apt install -y p7zip*
apt install -y unrar*
#Aplicar Theme no terminal bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" --unattended
sed -i 's/OSH_THEME="font"/OSH_THEME="zork"/g' /root/.bashrc
#Substituir o arquivo inface para network-manager ter controle da rede no X
cp -f interfaces /etc/network/interfaces
#Substituir o arquivo xfce settings manager menu
cp -f xfce-settings-manager.menu /etc/xdg/menus/xfce-settings-manager.menu
cp -f xfce/* /etc/xdg/xfce4/xfconf/xfce-perchannel-xml
cp -f dx-logo.svg /usr/share/icons/hicolor/scalable/apps
#Habilitar Mostra usuario no login
sed -i 's/#greeter-hide-users=false/greeter-hide-users=false/g' /etc/lightdm/lightdm.conf
#Habilitar theme de carregamento do sistemax
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet"/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"/g' /etc/default/grub
sed -i 's/#GRUB_GFXMODE=640x480/GRUB_GFXMODE=1024x768/g' /etc/default/grub
plymouth-set-default-theme -R bgrt
#Theme Panel XFCE
mv -n W7.tar.bz2 /usr/share/xfce4-panel-profiles/layouts/
update-grub2
apt remove -y xterm
#Reinicia o sistema
reboot
