#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#Include
. "$(pwd)/../myInclude.sh"
#----------Start----------#
RELEASE=$(curl -s https://api.github.com/repos/rustdesk/rustdesk/releases/latest | grep tag_name | cut -d '"' -f 4 | sed 's/v//')
wget -c https://github.com/rustdesk/rustdesk/releases/download/$RELEASE/rustdesk-$RELEASE-x86_64.deb -O /tmp/rustdesk.deb
$myPRG install -y /tmp/rustdesk.deb
