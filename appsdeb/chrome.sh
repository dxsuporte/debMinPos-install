#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#----------Start----------#
wget -qO- https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor > packages.google.gpg
install -D -o root -g root -m 644 packages.google.gpg /etc/apt/keyrings/packages.google.gpg
echo "deb [signed-by=/etc/apt/keyrings/packages.google.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google-chrome.list > /dev/null
rm -f packages.google.gpg
apt update
apt install -y google-chrome-stable

#curl -fSL https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o /tmp/google-chrome-amd64.deb
#apt install -y /tmp/google-chrome-amd64.deb
