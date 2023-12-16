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

#export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/bin/X11
#export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
#/bin/cp /etc/skel/.bashrc ~/.bashrc
#/bin/cp /etc/skel/.profile ~/.profile
