#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
read -r -p "Qual Versão do Node JS? [18|20|22] " NODEJS
#----------Start----------#
curl -fsSL https://deb.nodesource.com/setup_$NODEJS.x -o /tmp/nodesource_setup.sh
sh /tmp/nodesource_setup.sh
apt update
apt install -y nodejs