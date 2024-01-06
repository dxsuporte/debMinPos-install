#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#Include
. "$(pwd)/../myInclude.sh"
#----------Start----------#
add-apt-repository -y "deb https://antares-sql.github.io/antares-ppa ./"
wget -q -O - https://antares-sql.github.io/antares-ppa/key.gpg -O- | apt-key add -
$myPRG update
$myPRG install -y antares
