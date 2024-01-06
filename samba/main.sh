#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#Include
. "$(pwd)/../myInclude.sh"
#Atualizar sistema e Instalar Samba
$myPRG update && $myPRG install -y samba smbclient cifs-utils wsdd wsdd2
#Criar Pasta public e private
mkdir -m 777 -p /home/samba/public /home/samba/private
#Samba config
sed -i 's/;   bind interfaces only = yes/bind interfaces only = yes/g' /etc/samba/smb.conf
#Criar configuração da Pasta public e private no samba
grep -c '/home/samba/public' /etc/samba/smb.conf || cat public | tee -a /etc/samba/smb.conf
grep -c '/home/samba/private' /etc/samba/smb.conf || cat private | tee -a /etc/samba/smb.conf
#Adicionar Usuário, Senha do Usuário e Pasta private ao SambaShare
usermod -aG sambashare $(id 1000 -u -n)
smbpasswd -a $(id 1000 -u -n)
chgrp sambashare /home/samba/private
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
