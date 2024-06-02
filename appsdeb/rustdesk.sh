#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#----------Start----------#
RELEASE=$(curl -s https://api.github.com/repos/rustdesk/rustdesk/releases/latest | grep tag_name | cut -d '"' -f 4 | sed 's/v//')
curl -fsSL https://github.com/rustdesk/rustdesk/releases/download/$RELEASE/rustdesk-$RELEASE-x86_64.deb -o /tmp/rustdesk.deb
apt install -y /tmp/rustdesk.deb
