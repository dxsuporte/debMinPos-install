#!/bin/sh
set -e
#DWService
wget -cO - https://node213098.dwservice.net/getAgentFile.dw?name=dwagent.sh > dwagent.sh
chmod +x dwagent.sh && sh dwagent.sh
rm -R ./dwagent.sh


