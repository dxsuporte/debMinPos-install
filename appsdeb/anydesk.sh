#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#----------Start----------#
VERSION=$(curl -s https://download.anydesk.com/linux/ | grep deb | tail -n1 | cut -d '_' -f2)
curl -fSL https://download.anydesk.com/linux/anydesk_"$VERSION"_amd64.deb -o /tmp/anydesk_amd64.deb
apt install -y /tmp/anydesk_amd64.deb

#wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | gpg --dearmor -o /etc/apt/keyrings/DEB-GPG-KEY
#echo "deb [signed-by=/etc/apt/keyrings/DEB-GPG-KEY] http://deb.anydesk.com/ all main" | tee /etc/apt/sources.list.d/anydesk.list
#apt update
#apt install -y anydesk
