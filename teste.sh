#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#gsettings set org.gnome.desktop.interface color-scheme default
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
#runuser -l $(id 1000 -u -n) -c 'bash -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)" --unattended' || echo 'OK'
