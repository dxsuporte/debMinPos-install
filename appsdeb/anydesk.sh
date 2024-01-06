#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#APT or NALA
if [ "$(dpkg -l nala 2>&- | grep -c ^ii)" = 1 ]; then
    PRG="nala"
else
    PRG="apt"
fi
#----------Start----------#
add-apt-repository -y "deb http://deb.anydesk.com/ all main"
wget -q -O - https://keys.anydesk.com/repos/DEB-GPG-KEY -O- | apt-key add -
$PRG update
$PRG install -y anydesk
