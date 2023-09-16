#!/bin/sh
apt update && apt -y upgrade
update-locale LANG=pt_BR.UTF-8
locale-gen --purge pt_BR.UTF-8
apt install -y xorg xfce4 lightdm lightdm-gtk-greeter xfce4*
apt install -y python3-gi python3-psutil menulibre mugshot
apt install -y network-manager network-manager-gnome gnome-system-tools system-config-printer software-properties-gtk
apt install -y xdg-user-dirs-gtk
apt install -y neofetch gdebi gufw zip p7zip* p7zip* optipng
apt install -y elementary-xfce-icon-theme orchis-gtk-theme greybird-gtk-theme breeze-cursor-theme
apt install -y fonts-noto fonts-powerline
apt install -y synaptic gparted firefox-esr
apt install -y thunar-dropbox-plugin
apt install -y samba wsdd wsdd2
apt install -y curl wget git
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" --unattended
runuser - l $(id 1000 -u -n) -c 'bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" --unattended'
xfconf-query -c xsettings -p /Net/ThemeName -s Orchis-Dark
xfconf-query -c xfwm4 -p /general/theme -s Orchis-Dark
xfconf-query -c xsettings -p /Net/IconThemeName -s elementary-xfce-dark
xfconf-query -c xsettings -p /Gtk/CursorThemeName -s Breeze
xfconf-query -c xsettings -p /Gtk/FontName -s "Noto Sans 10"
xfce4-panel-profiles load /usr/share/xfce4-panel-profiles/layouts/Redmond\ 7.tar.bz2
