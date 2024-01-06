#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#APT or NALA
PRG="$1"
#----------Start----------#
wget -c https://download.teamviewer.com/download/linux/teamviewer_amd64.deb -O /tmp/teamviewer_amd64.deb
$PRG install -y /tmp/teamviewer_amd64.deb
