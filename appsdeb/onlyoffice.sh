#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#----------Start----------#
apt install -y ttf-mscorefonts-installer && fc-cache -f -v
wget -c https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb -q -O /tmp/onlyoffice-desktopeditors_amd64.deb
apt install -y /tmp/onlyoffice-desktopeditors_amd64.deb
