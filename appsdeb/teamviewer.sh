#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#----------Start----------#
wget -c https://download.teamviewer.com/download/linux/teamviewer_amd64.deb -q -O /tmp/teamviewer_amd64.deb
apt install -y /tmp/teamviewer_amd64.deb
