#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#Include
. "$(pwd)/../myInclude.sh"
#----------Start----------#
$myPRG install -y ttf-mscorefonts-installer && fc-cache -f -v
wget -c https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb -O /tmp/onlyoffice-desktopeditors_amd64.deb
$myPRG install -y /tmp/onlyoffice-desktopeditors_amd64.deb
