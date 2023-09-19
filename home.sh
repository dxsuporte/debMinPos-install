#!/bin/sh
#Atualizar sistema
apt update && apt -y upgrade
#Instalar App de internet
apt install -y thunar-dropbox-plugin
