#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#APT or NALA
if [ "$(dpkg -l nala 2>&- | grep -c ^ii)" = 1 ]; then
    PRG="nala"
else
    PRG="apt"
fi
#----------Start----------#
wget -cO - https://node213098.dwservice.net/getAgentFile.dw?name=dwagent.sh -O /tmp/dwagent.sh
chmod +x /tmp/dwagent.sh
sh /tmp/dwagent.sh
