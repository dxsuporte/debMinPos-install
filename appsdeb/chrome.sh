#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#Include
. "$(pwd)/../myInclude.sh"
#----------Start----------#
add-apt-repository -y "deb http://dl.google.com/linux/chrome/deb/ stable main" >>/etc/apt/sources.list.d/google-chrome.list
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub -O- | apt-key add -
$myPRG update
$myPRG install -y google-chrome-stable
