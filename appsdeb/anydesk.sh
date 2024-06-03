#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#----------Start----------#
VERSION=$(curl -s https://download.anydesk.com/linux/ | grep deb | tail -n1 | cut -d '_' -f2)
curl -fSL https://download.anydesk.com/linux/anydesk_"$VERSION"_amd64.deb -o /tmp/anydesk_amd64.deb
apt install -y /tmp/anydesk_amd64.deb
