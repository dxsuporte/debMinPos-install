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
add-apt-repository -y "deb https://packages.microsoft.com/repos/edge stable main"
wget -q -O - https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
$PRG update
$PRG install -y microsoft-edge-stable
