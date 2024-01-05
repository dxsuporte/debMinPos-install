#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#APT or NALA
PRG="$1"
#----------Start----------#
#Install
$PRG install -y --no-install-recommends libreoffice-writer
$PRG install -y --no-install-recommends libreoffice-calc
$PRG install -y --no-install-recommends libreoffice-draw
$PRG install -y libreoffice-style-elementary
$PRG install -y libreoffice-gtk3
$PRG install -y libreoffice-l10n-pt-br
wget -c https://pt-br.libreoffice.org/assets/Uploads/PT-BR-Documents/VERO/VeroptBR3215AOC.oxt
unopkg add --shared VeroptBR3215AOC.oxt
rm -f -r ./VeroptBR*.oxt
cp -f -r config/libreoffice/* /etc/libreoffice/registry/
