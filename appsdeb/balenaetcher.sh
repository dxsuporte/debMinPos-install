#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#----------Start----------#
curl -1sLf 'https://dl.cloudsmith.io/public/balena/etcher/setup.deb.sh' | sudo -E bash
apt install -y balena-etcher
