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
#Install
$PRG install -y --no-install-recommends libreoffice-writer
$PRG install -y --no-install-recommends libreoffice-calc
$PRG install -y --no-install-recommends libreoffice-draw
$PRG install -y libreoffice-style-elementary
$PRG install -y libreoffice-gtk3
$PRG install -y libreoffice-l10n-pt-br
wget -c https://pt-br.libreoffice.org/assets/Uploads/PT-BR-Documents/VERO/VeroptBR3215AOC.oxt -O /tmp/VeroptBR3215AOC.oxt
unopkg add --shared /tmp/VeroptBR3215AOC.oxt
cp -f -r config/libreoffice/* /etc/libreoffice/registry/
