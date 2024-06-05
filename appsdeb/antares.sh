#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#----------Start----------#
RELEASE=$(curl -s https://github.com/antares-sql/antares/releases | grep -m1 amd64 | cut -d '-' -f3)
curl -fSL https://github.com/antares-sql/antares/releases/download/v"$RELEASE"/Antares-"$RELEASE"-linux_amd64.deb -o /tmp/antares-linux_amd64.deb
apt install -y /tmp/antares-linux_amd64.deb
#wget -qO - https://antares-sql.github.io/antares-ppa/key.gpg | gpg --dearmor -o /etc/apt/keyrings/antares.gpg
#echo "deb [signed-by=/etc/apt/keyrings/antares.gpg] https://antares-sql.github.io/antares-ppa ./" | tee /etc/apt/sources.list.d/antares.list
#apt update
#apt install -y antares
