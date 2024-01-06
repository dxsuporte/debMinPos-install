#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#Include
. "$(pwd)/../myInclude.sh"
#Atualizar sistema e Instalar Samba
$myPRG update
$myPRG install -y samba smbclient cifs-utils wsdd wsdd2
#Samba config
sed -i 's/;   bind interfaces only = yes/bind interfaces only = yes/g' /etc/samba/smb.conf
if [ $(grep -c '/home/samba/public' /etc/samba/smb.conf) = 0 ]; then
    cat public | tee -a /etc/samba/smb.conf
fi
if [ $(grep -c '/home/samba/private' /etc/samba/smb.conf) = 0 ]; then
    cat private | tee -a /etc/samba/smb.conf
fi
mkdir -m 777 -p /home/samba/public /home/samba/private
chgrp sambashare /home/samba/private
usermod -aG sambashare $(id 1000 -u -n)
smbpasswd -a $(id 1000 -u -n)
#AutoStart
cp -f -r samba-public.desktop /etc/xdg/autostart/
#----------End----------#
#Atualizar Grub, Limpeza apt
$myPRG autoremove -y && apt autoclean && apt clean
#Reinicia o sistema
read -r -p "Instalação concluida! Seu pc precisa ser reiniciad! [Enter] " REBOOT
if [ "$REBOOT" = "y" ]; then
    rm -f -r /tmp/* && reboot
else
    rm -f -r /tmp/* && reboot
fi
