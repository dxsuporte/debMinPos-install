#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#Include
. "$(pwd)/../myInclude.sh"
#----------Start----------#
wget -c https://mega.nz/linux/repo/Debian_"$myRELEASE"/amd64/megasync-Debian_"$myRELEASE"_amd64.deb -O /tmp/megasync-Debian_amd64.deb
$myPRG install -y /tmp/megasync-Debian_amd64.deb
wget -c https://mega.nz/linux/repo/Debian_"$myRELEASE"/amd64/thunar-megasync-Debian_"$myRELEASE"_amd64.deb -O /tmp/thunar-megasync-Debian_amd64.deb
$myPRG install -y /tmp/thunar-megasync-Debian_amd64.deb
#XFCE
#if [ $XDG_CURRENT_DESKTOP = XFCE ]; then fi
