#!/bin/sh
#Atualizar sistema
apt update && apt -y upgrade
#Instalar App de internet
apt install -y firefox-esr thunar-dropbox-plugin
#Instalar Plugins
apt install -y zip p7zip* p7zip*
#Instalar Compartilhamento de rede
apt install -y nfs-kernel-server samba wsdd wsdd2