#!/bin/sh
#Desativar CDROM, codigo font e Habilitar Repositorio extras Debian
sed -i 's/deb cdrom:/#deb cdrom:/g' /etc/apt/sources.list
sed -i 's/deb-src/#deb-src/g' /etc/apt/sources.list
sed -i 's/main non-free-firmware/main non-free-firmware contrib non-free/g' /etc/apt/sources.list
#Atualizar sistema
apt update && apt -y upgrade
#Mudar lingual do Sistema
update-locale LANG=pt_BR.UTF-8
locale-gen --purge pt_BR.UTF-8
#Instalar Interface grafica XFCE4
apt install -y xorg
apt install -y xfce4 xfce4-*
apt install -y lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
apt install -y python3-gi menulibre mugshot
#Instalar gerenciador de rede, usuários, impressora e software para X.
apt install -y network-manager network-manager-gnome gnome-system-tools system-config-printer software-properties-gtk
#Instalar Fonts
apt install -y fonts-noto fonts-powerline
#Instalar Theme
apt install -y plymouth plymouth-themes elementary-xfce-icon-theme orchis-gtk-theme greybird-gtk-theme breeze-cursor-theme
#Instalar Ferramentas do Sistema
apt install -y synaptic gparted neofetch gdebi gufw blueman
#Instalar Complementos do sistema
apt install -y firmware-linux xdg-user-dirs-gtk optipng
#Instalar Compartilhamento de rede
apt install -y samba wsdd wsdd2
#Instalar outro programas
apt install -y firefox-esr curl wget atril mate-calc zip p7zip* p7zip*
#Aplicar Theme no terminal bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" --unattended
sed -i 's/OSH_THEME="font"/OSH_THEME="zork"/g' /root/.bashrc
#Substituir o arquivo inface para network-manager ter controle da rede no X
cp -f interfaces /etc/network/interfaces
#Substituir o arquivo xfce settings manager menu
cp -f xfce-settings-manager.menu /etc/xdg/menus/xfce-settings-manager.menu
cp -f xfce4-panel.xml /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
cp -f dx-logo.svg /usr/share/icons/hicolor/scalable/apps/xfce4-logo.svg
#Habilitar Mostra usuario no login
sed -i 's/#greeter-hide-users=false/greeter-hide-users=false/g' /etc/lightdm/lightdm.conf
#Habilitar theme de carregamento do sistemax
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet"/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"/g' /etc/default/grub
sed -i 's/#GRUB_GFXMODE=640x480/GRUB_GFXMODE=1024x768/g' /etc/default/grub
plymouth-set-default-theme -R bgrt
#Theme Panel XFCE
mv -n W7.tar.bz2 /usr/share/xfce4-panel-profiles/layouts/
update-grub2
#Reinicia o sistema
reboot
