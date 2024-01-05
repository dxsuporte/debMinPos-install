#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#APT or NALA
PRG="$1"
#----------Start----------#
wget -cO - https://node213098.dwservice.net/getAgentFile.dw?name=dwagent.sh >dwagent.sh
chmod +x dwagent.sh && sh dwagent.sh
rm -f -r ./dwagent.sh
