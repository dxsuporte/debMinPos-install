#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#----------Start----------#
curl -fSL https://node213098.dwservice.net/getAgentFile.dw?name=dwagent.sh -o /tmp/dwagent.sh
sh /tmp/dwagent.sh
