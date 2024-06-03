#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#Debian
if [ "$(lsb_release -is)" = "Debian" ]; then
    RELEASE="Debian_$(lsb_release -rs)"
#Debian Testing
elif [ "$(lsb_release -rs)" = "n/a" ]; then
    RELEASE="Debian_testing"
#Ubuntu
elif [ "$(lsb_release -is)" = "Ubuntu" ]; then
    RELEASE="xUbuntu_$(lsb_release -rs)"
fi
#----------Start----------#
curl -fSL https://mega.nz/linux/repo/"$RELEASE"/amd64/megasync-"$RELEASE"_amd64.deb -o /tmp/megasync-amd64.deb
apt install -y /tmp/megasync-amd64.deb
#Thunar
if [ $(which thunar) ]; then
    curl -fSL https://mega.nz/linux/repo/"$RELEASE"/amd64/thunar-megasync-"$RELEASE"_amd64.deb -o /tmp/thunar-megasync-amd64.deb
    apt install -y /tmp/thunar-megasync-amd64.deb
fi
#Nautilus
if [ $(which nautilus) ]; then
    curl -fSL https://mega.nz/linux/repo/"$RELEASE"/amd64/nautilus-megasync-"$RELEASE"_amd64.deb -o /tmp/nautilus-megasync-amd64.deb
    apt install -y /tmp/nautilus-megasync-amd64.deb
fi
#Nemo
if [ $(which nemo) ]; then
    curl -fSL https://mega.nz/linux/repo/"$RELEASE"/amd64/nemo-megasync-"$RELEASE"_amd64.deb -o /tmp/nemo-megasync-amd64.deb
    apt install -y /tmp/nemo-megasync-amd64.deb
fi
