#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#Include
. "$(pwd)/../myInclude.sh"
#----------Start----------#
RELEASE=$(curl -s https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/ | grep -m1 "net.sf.files" | cut -d '"' -f 2)
wget -c https://sinalbr.dl.sourceforge.net/project/xampp/XAMPP%20Linux/"$RELEASE"/xampp-linux-x64-"$RELEASE"-0-installer.run -O /tmp/xampp.run
chmod +x /tmp/xampp.run
./tmp/xampp.run
