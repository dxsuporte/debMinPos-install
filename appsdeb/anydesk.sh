#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#Include
. "$(pwd)/../myInclude.sh"
#----------Start----------#
add-apt-repository -y "deb http://deb.anydesk.com/ all main" >>/etc/apt/sources.list.d/anydesk.list
wget -q -O - https://keys.anydesk.com/repos/DEB-GPG-KEY -O- | apt-key add -
$myPRG update
$myPRG install -y anydesk
