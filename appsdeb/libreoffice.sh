#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#Include
. "$(pwd)/../myInclude.sh"
#----------Start----------#
#Install
$myPRG install -y --no-install-recommends libreoffice-writer
$myPRG install -y --no-install-recommends libreoffice-calc
$myPRG install -y --no-install-recommends libreoffice-draw
$myPRG install -y libreoffice-style-elementary
$myPRG install -y libreoffice-gtk3
$myPRG install -y libreoffice-l10n-pt-br
wget -c https://pt-br.libreoffice.org/assets/Uploads/PT-BR-Documents/VERO/VeroptBR3215AOC.oxt -O /tmp/VeroptBR3215AOC.oxt
unopkg add --shared /tmp/VeroptBR3215AOC.oxt || echo "OK"
cp -f -r config/libreoffice/* /etc/libreoffice/registry/
