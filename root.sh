#!/bin/sh
#Atualizar sistema
apt update && apt -y upgrade
#Mudar lingual do Sistema
update-locale LANG=pt_BR.UTF-8
locale-gen --purge pt_BR.UTF-8
#Instalar Interface grafica XFCE4
apt install -y xorg xfce4 lightdm lightdm-gtk-greeter xfce4* python3-gi python3-psutil menulibre mugshot
#Instalar gerenciador de rede, usuários, impressora e software para X.
apt install -y network-manager network-manager-gnome gnome-system-tools system-config-printer software-properties-gtk
#Instalar Fonts
apt install -y fonts-noto fonts-powerline
#Instalar Theme
apt install -y elementary-xfce-icon-theme orchis-gtk-theme greybird-gtk-theme breeze-cursor-theme
#Instalar Ferramentas do Sistema
apt install -y synaptic gparted neofetch gdebi gufw xdg-user-dirs-gtk
#Instalar App de internet
apt install -y firefox-esr thunar-dropbox-plugin
#Instalar Plugins
apt install -y zip p7zip* p7zip* optipng
#Instalar outro programas
apt install -y curl wget
#Instalar Compartilhamento de rede
apt install -y samba wsdd wsdd2
#Aplicar Theme no terminal bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" --unattended
sed -i 's/OSH_THEME="font"/OSH_THEME="zork"/g' /root/.bashrc
#Backup do arquivo interfaces
mv -m /etc/network/interfaces /etc/network/interfaces.bkp.deMinPros
#Substitui o arquivo inface para network-manager ter controle da rede no X
cp -f interfaces /etc/network/interfaces
#Habilitar Mostra usuario no login
sed -i 's/#greeter-hide-users=false/greeter-hide-users=false/g' /etc/lightdm/lightdm.conf
