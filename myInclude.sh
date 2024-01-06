#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#APT or NALA
if [ "$(dpkg -l nala 2>&- | grep -c ^ii)" = 1 ]; then
    myPRG="nala"
else
    myPRG="apt"
fi
#Versão do Debian
if [ $(lsb_release -rs 2 | awk "{print}") = "n/a" ]; then
    myRELEASE="testing"
else
    myRELEASE=$(lsb_release -rs 2 | awk "{print}")
fi
