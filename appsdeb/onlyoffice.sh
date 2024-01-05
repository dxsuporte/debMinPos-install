#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#APT or NALA
PRG="$1"
#----------Start----------#
$PRG install -y ttf-mscorefonts-installer && fc-cache -f -v
wget -c https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb
$PRG install -y ./onlyoffice*.deb
rm -f -r ./onlyoffice*.deb
