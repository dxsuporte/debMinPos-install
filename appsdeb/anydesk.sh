#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#Include
. "$(pwd)/../myInclude.sh"
#----------Start----------#
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | gpg --dearmor -o /etc/apt/keyrings/DEB-GPG-KEY
echo "deb [signed-by=/etc/apt/keyrings/DEB-GPG-KEY] http://deb.anydesk.com/ all main" | tee /etc/apt/sources.list.d/anydesk.list
$myPRG update
$myPRG install -y anydesk
