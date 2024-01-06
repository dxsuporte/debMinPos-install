#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#APT or NALA
PRG="$1"
#----------Start----------#
add-apt-repository -y "deb http://deb.anydesk.com/ all main"
wget -q -O - https://keys.anydesk.com/repos/DEB-GPG-KEY -O- | apt-key add -
$PRG update
$PRG install -y anydesk
