#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#APT or NALA
PRG="$1"
#----------Start----------#
wget -c https://mega.nz/linux/repo/Debian_"$RELEASE"/amd64/megasync-Debian_"$RELEASE"_amd64.deb
$PRG install -y ./megasync*.deb
rm -f -r ./megasync*.deb
#XFCE
if [ $XDG_CURRENT_DESKTOP = XFCE ]; then
    wget -c https://mega.nz/linux/repo/Debian_"$RELEASE"/amd64/thunar-megasync-Debian_"$RELEASE"_amd64.deb
    $PRG install -y ./thunar*.deb
    rm -f -r ./thunar*.deb
fi
