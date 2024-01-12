#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#Include
. "$(pwd)/../myInclude.sh"
#----------Start----------#
add-apt-repository -y "deb https://packages.microsoft.com/repos/vscode stable main" >>/etc/apt/sources.list.d/vscode.list
wget -q -O - https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
$myPRG update
$myPRG install -y code
