#!/bin/sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" --unattended
sed -i 's/OSH_THEME="font"/OSH_THEME="zork"/g' $HOME/.bashrc
xfconf-query -c xsettings -p /Net/ThemeName -s Orchis-Dark
xfconf-query -c xfwm4 -p /general/theme -s Orchis-Dark
xfconf-query -c xsettings -p /Net/IconThemeName -s elementary-xfce-dark
xfconf-query -c xsettings -p /Gtk/CursorThemeName -s Breeze
xfconf-query -c xsettings -p /Gtk/FontName -s "Noto Sans 10"
xfce4-panel-profiles load W7.tar.bz2
#xfce4-panel-profiles load /usr/share/xfce4-panel-profiles/layouts/Redmond\ 7.tar.bz2