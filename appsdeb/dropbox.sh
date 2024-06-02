#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#----------Start----------#
RELEASE=$(cat /etc/os-release | grep ID | cut -d '=' -f2)
#Thunar
if [ $(which thunar) ]; then
    apt install -y thunar-dropbox-plugin
#Nautilus
elif [ $(which nautilus) ]; then
    apt install -y nautilus-dropbox
#Caja
elif [ $(which caja) ]; then
    apt install -y caja-dropbox
#Nemo
elif [ $(which nemo) ] || [ $RELEASE == 'linuxmint' ]; then
    apt install -y nemo-dropbox
else
    VERSION=$(curl -s https://linux.dropbox.com/packages/debian/ | grep amd64 | tail -n1 | cut -d '_' -f2)
    curl -fsSL https://linux.dropbox.com/packages/"$RELEASE"/dropbox_"$VERSION"_amd64.deb -o /tmp/dropbox_amd64.deb
    apt install -y /tmp/dropbox_amd64.deb
fi
