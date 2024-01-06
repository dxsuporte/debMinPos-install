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
wget -c https://download.teamviewer.com/download/linux/teamviewer_amd64.deb -O /tmp/teamviewer_amd64.deb
$PRG install -y /tmp/teamviewer_amd64.deb
