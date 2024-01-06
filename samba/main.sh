#!/bin/sh
#Stop the script if any command fails. || #Interromper o script se algum comando falhar.
set -e
#APT or NALA
if [ "$(dpkg -l nala 2>&- | grep -c ^ii)" = 1 ]; then
    PRG="nala"
else
    PRG="apt"
fi
#Atualizar sistema e Instalar Compartilhamento de rede
$PRG update
$PRG install -y samba smbclient cifs-utils wsdd wsdd2
#-----------------------------Configurações do Sistema-----------------------------------------#
#Samba config
sed -i 's/;   bind interfaces only = yes/bind interfaces only = yes/g' /etc/samba/smb.conf
if [ $(grep -c '/home/samba/public' /etc/samba/smb.conf) = 0 ]; then
    echo "
    [public]
    path = /home/samba/public
    writable = yes
    guest ok = yes
    guest only = yes
    force create mode = 777
    force directory mode = 777
    " | tee -a /etc/samba/smb.conf
fi
if [ $(grep -c '/home/samba/private' /etc/samba/smb.conf) = 0 ]; then
    echo "
    [private]
    security = user
    path = /home/samba/private
    writable = yes
    guest ok = no
    valid users = @sambashare
    force group = sambashare
    force create mode = 770
    force directory mode = 770
    inherit permissions = yes
    " | tee -a /etc/samba/smb.conf
fi
mkdir -m 777 -p /home/samba/public
mkdir -m 770 -p /home/samba/private
chgrp sambashare /home/samba/private
usermod -aG sambashare $(id 1000 -u -n)
smbpasswd -a $(id 1000 -u -n)
echo "[Desktop Entry]" | tee /etc/xdg/autostart/samba-public.desktop
echo 'Exec=sh -c "[ ! -d "$HOME/share" ] && { ln -s /home/samba $HOME/Compartilhado; }"' | tee -a /etc/xdg/autostart/samba-public.desktop
#Limpeza apt
$PRG autoremove -y && apt autoclean && apt clean
#Reinicia o sistema
read -r -p "Instalação concluida! Seu pc precisa ser reiniciad! [Enter] " REBOOT
if [ "$REBOOT" = "y" ]; then
    reboot
else
    reboot
fi
