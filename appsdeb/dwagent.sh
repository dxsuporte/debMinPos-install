#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#APT or NALA
PRG="$1"
#----------Start----------#
wget -cO - https://node213098.dwservice.net/getAgentFile.dw?name=dwagent.sh -O /tmp/dwagent.sh >dwagent.sh
chmod +x /tmp/dwagent.sh
sh /tmp/dwagent.sh
