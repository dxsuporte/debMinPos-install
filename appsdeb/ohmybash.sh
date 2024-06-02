#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#----------Start----------#
#Theme Bash User Root
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" --unattended || echo 'OK'
sed -i 's/OSH_THEME="font"/OSH_THEME="zork"/g' /root/.bashrc
#Theme Bash User First Home
runuser -l $(id 1000 -u -n) -c 'bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" --unattended' || echo 'OK'
sed -i 's/OSH_THEME="font"/OSH_THEME="mairan"/g' /home/$(id 1000 -u -n)/.bashrc
