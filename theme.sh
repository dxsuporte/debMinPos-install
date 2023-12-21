#!/bin/sh
#Interromper o script se algum comando falhar.
set -e

#Instalar Theme
apt install -y greybird-gtk-theme
apt install -y orchis-gtk-theme
apt install -y bibata-cursor-theme

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

#Modelo Thema Panel XFCE
cp -f xfce/theme/W7.tar.bz2 /usr/share/xfce4-panel-profiles/layouts/
