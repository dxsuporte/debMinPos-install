#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#Include
. "$(pwd)/../myInclude.sh"
#----------Start----------#
wget -qO - https://antares-sql.github.io/antares-ppa/key.gpg | gpg --dearmor -o /etc/apt/keyrings/antares.gpg
echo "deb [signed-by=/etc/apt/keyrings/antares.gpg] https://antares-sql.github.io/antares-ppa ./" | tee /etc/apt/sources.list.d/antares.list
$myPRG update
$myPRG install -y antares
