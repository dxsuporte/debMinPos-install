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
add-apt-repository -y "deb https://antares-sql.github.io/antares-ppa ./"
wget -q -O - https://antares-sql.github.io/antares-ppa/key.gpg -O- | apt-key add -
$PRG update
$PRG install -y antares
