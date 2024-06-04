#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#----------Start----------#
RELEASE=$(curl -s https://github.com/VSCodium/vscodium/releases | grep amd64 | grep -m1 deb | cut -d '_' -f2)
curl -fSL https://github.com/VSCodium/vscodium/releases/download/"$RELEASE"/codium_"$RELEASE"_amd64.deb -o /tmp/codium_amd64.deb
apt install -y /tmp/codium_amd64.deb

