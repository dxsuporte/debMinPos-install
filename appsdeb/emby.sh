#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#Include
. "$(pwd)/../myInclude.sh"
#----------Start----------#
RELEASE=$(curl -s https://github.com/MediaBrowser/Emby.Releases/releases | grep emby-server-deb | grep -m1 amd64 | cut -d '_' -f2)
wget -c https://github.com/MediaBrowser/Emby.Releases/releases/download/"$RELEASE"/emby-server-deb_"$RELEASE"_amd64.deb -O /tmp/emby-server-deb.deb
$myPRG install -y /tmp/emby-server-deb.deb
