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
apt install -y xorg xfce4* lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings python3-gi menulibre mugshot
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
#Instalar outro programas
apt install -y curl wget
#Aplicar Theme no terminal bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" --unattended
sed -i 's/OSH_THEME="font"/OSH_THEME="zork"/g' /root/.bashrc
#Backup e Substituir o arquivo inface para network-manager ter controle da rede no X
mv -n /etc/network/interfaces /etc/network/interfaces.bkp.debMinPros
cp -f interfaces /etc/network/interfaces
#Backup e Substituir o arquivo xfce settings manager menu
mv -n /etc/xdg/menus/xfce-settings-manager.menu /etc/xdg/menus/xfce-settings-manager.menu.bkp.debMinPros
cp -f xfce-settings-manager.menu /etc/xdg/menus/xfce-settings-manager.menu
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
