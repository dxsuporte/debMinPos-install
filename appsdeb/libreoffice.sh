#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#----------Start----------#
#Install
apt install -y --no-install-recommends libreoffice-writer
apt install -y --no-install-recommends libreoffice-calc
apt install -y --no-install-recommends libreoffice-draw
apt install -y libreoffice-style-elementary
apt install -y libreoffice-gtk3
apt install -y libreoffice-l10n-pt-br
curl -fsSL https://pt-br.libreoffice.org/assets/Uploads/PT-BR-Documents/VERO/VeroptBR3215AOC.oxt -o /tmp/VeroptBR3215AOC.oxt
unopkg add --shared /tmp/VeroptBR3215AOC.oxt || echo "OK"
cp -f -r config/libreoffice/* /etc/libreoffice/registry/
