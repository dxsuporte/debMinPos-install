#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#APT or NALA
if [ "$(dpkg -l nala 2>&- | grep -c ^ii)" = 1 ]; then
    PRG="nala"
else
    PRG="apt"
fi
#----------Start----------#
$PRG install -y ttf-mscorefonts-installer && fc-cache -f -v
wget -c https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb -O /tmp/onlyoffice-desktopeditors_amd64.deb
$PRG install -y /tmp/onlyoffice-desktopeditors_amd64.deb
