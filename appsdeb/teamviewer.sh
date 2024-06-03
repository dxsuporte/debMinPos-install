#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#----------Start----------#
curl -fSL https://download.teamviewer.com/download/linux/teamviewer_amd64.deb -o /tmp/teamviewer_amd64.deb
apt install -y /tmp/teamviewer_amd64.deb
