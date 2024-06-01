#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#----------Start----------#
wget -qO - https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /etc/apt/keyrings/google-earth-pro.gpg
echo "deb [signed-by=/etc/apt/keyrings/google-earth-pro.gpg] http://dl.google.com/linux/earth/deb/ stable main" | tee /etc/apt/sources.list.d/google-earth-pro.list
apt update
apt install -y google-earth-pro-stable
