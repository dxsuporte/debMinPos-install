#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#APT or NALA
PRG="$1"
#----------Start----------#
add-apt-repository -y "deb http://dl.google.com/linux/chrome/deb/ stable main"
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub -O- | apt-key add -
$PRG update
$PRG install -y google-chrome-stable
