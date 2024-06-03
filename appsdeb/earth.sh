#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#----------Start----------#
wget -qO- https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor > packages.google.gpg
install -D -o root -g root -m 644 packages.google.gpg /etc/apt/keyrings/packages.google.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.google.gpg] http://dl.google.com/linux/earth/deb/ stable main" | tee /etc/apt/sources.list.d/google-earth-pro.list > /dev/null
rm -f packages.google.gpg
apt update
apt install -y google-earth-pro-stable

#curl -fSL https://dl.google.com/dl/earth/client/current/google-earth-pro-stable_current_amd64.deb -o /tmp/google-earth-amd64.deb
#apt install -y /tmp/google-earth-amd64.deb

#wget -qO - https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /etc/apt/keyrings/google-earth-pro.gpg
#echo "deb [signed-by=/etc/apt/keyrings/google-earth-pro.gpg] http://dl.google.com/linux/earth/deb/ stable main" | tee /etc/apt/sources.list.d/google-earth-pro.list
#apt update
#apt install -y google-earth-pro-stable