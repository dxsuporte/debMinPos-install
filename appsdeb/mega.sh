#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#Versão do Debian
if [ $(lsb_release -rs 2 | awk "{print}") = "n/a" ]; then
    RELEASE="testing"
else
    RELEASE=$(lsb_release -rs 2 | awk "{print}")
fi
#----------Start----------#
curl -fsSL https://mega.nz/linux/repo/Debian_"$RELEASE"/amd64/megasync-Debian_"$RELEASE"_amd64.deb -o /tmp/megasync-Debian_amd64.deb
apt install -y /tmp/megasync-Debian_amd64.deb
curl -fsSL https://mega.nz/linux/repo/Debian_"$RELEASE"/amd64/nautilus-megasync-Debian_"$RELEASE"_amd64.deb -o /tmp/nautilus-megasync-Debian_amd64.deb
curl -fsSL https://mega.nz/linux/repo/Debian_"$RELEASE"/amd64/nemo-megasync-Debian_"$RELEASE"_amd64.deb -o /tmp/nemo-megasync-Debian_amd64.deb
curl -fsSL https://mega.nz/linux/repo/Debian_"$RELEASE"/amd64/thunar-megasync-Debian_"$RELEASE"_amd64.deb -o /tmp/thunar-megasync-Debian_amd64.deb
apt install -y /tmp/nautilus-megasync-Debian_amd64.deb
apt install -y /tmp/nemo-megasync-Debian_amd64.deb
apt install -y /tmp/thunar-megasync-Debian_amd64.deb
