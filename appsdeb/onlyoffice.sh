#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#----------Start----------#
apt install -y ttf-mscorefonts-installer && fc-cache -f -v
curl -fsSL https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb -o /tmp/onlyoffice-desktopeditors_amd64.deb
apt install -y /tmp/onlyoffice-desktopeditors_amd64.deb
