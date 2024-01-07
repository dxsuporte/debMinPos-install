#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#Include
. "$(pwd)/../myInclude.sh"
#----------Start----------#
curl -1sLf 'https://dl.cloudsmith.io/public/balena/etcher/setup.deb.sh' | sudo -E bash
$myPRG install -y balena-etcher
#Não funciounou dessa maneira, erro no pacote deb
#RELEASE=$(curl -s https://api.github.com/repos/balena-io/etcher/releases/latest | grep tag_name | cut -d '"' -f 4 | sed 's/v//')
#wget -c https://github.com/balena-io/etcher/releases/download/v$RELEASE/balena-etcher_"$RELEASE"_amd64.deb -O /tmp/balenaetcher.deb
#$myPRG install -y -f /tmp/balenaetcher.deb
