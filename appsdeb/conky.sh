#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#----------Start----------#
apt install -y conky-all
apt install -y fonts-font-awesome
cp -f -r /etc/conky/conky.conf /etc/conky/bkp.conky.conf
cp -f -r /config/conky/conky.conf /etc/conky/conky.conf
#REDE
ETH="$(lshw -c network | grep 'logical' | grep -m1 en | awk {'print $3'})"
if [ $ETH ]; then
    sed -i "s|ETH|$ETH|g" /etc/conky/conky.conf
fi
#WI-FI
WTH="$(lshw -c network | grep 'logical' | grep -m1 wl | awk {'print $3'})"
if [ $WTH ]; then
    sed -i "s|WTH|$WTH|g" /etc/conky/conky.conf
fi