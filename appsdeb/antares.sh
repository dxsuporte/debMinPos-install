#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#APT or NALA
PRG="$1"
#----------Start----------#
add-apt-repository -y "deb https://antares-sql.github.io/antares-ppa ./"
wget -q -O - https://antares-sql.github.io/antares-ppa/key.gpg -O- | apt-key add -
$PRG update
$PRG install -y antares
