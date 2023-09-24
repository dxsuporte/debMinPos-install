#!/bin/sh
set -e
#XAMPP
chmod +x xampp-linux*.run && ./xampp-linux*.run
cp -f xampp.service /etc/systemd/system/
systemctl enable xampp.service


