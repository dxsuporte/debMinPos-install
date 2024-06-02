#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#----------Start----------#
wget -cO - https://node213098.dwservice.net/getAgentFile.dw?name=dwagent.sh -q -O /tmp/dwagent.sh
chmod +x /tmp/dwagent.sh
sh /tmp/dwagent.sh
