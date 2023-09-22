#!/bin/sh
set -e
#Desativar CDROM, codigo font e Habilitar Repositorio extras Debian
sed -i 's/deb cdrom:/#deb cdrom:/g' /etc/apt/sources.list
sed -i 's/deb-src/#deb-src/g' /etc/apt/sources.list
sed -i 's/main non-free-firmware/main non-free-firmware contrib non-free/g' /etc/apt/sources.list
#Instala interface para APT
apt install -y nala
#Atualizar sistema
nala update && nala upgrade -y
#Mudar lingual do Sistema
update-locale LANG=pt_BR.UTF-8
locale-gen --purge pt_BR.UTF-8
#Instalar e configurar tema no bash do root
nala install -y bash-completion curl wget
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" --unattended  || echo 'OK'
sed -i 's/OSH_THEME="font"/OSH_THEME="rjorgenson"/g' /root/.bashrc
#Instalar e configurar tema no bash do 1º usuario
runuser -l $(id 1000 -u -n) -c 'bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" --unattended' || echo 'OK'
sed -i 's/OSH_THEME="font"/OSH_THEME="powerline-light"/g' /home/$(id 1000 -u -n)/.bashrc
#Instalar Interface grafica XFCE4
nala install -y xfce4-terminal
nala install -y xorg
nala install -y xfce4
nala install -y xfce4-goodies
nala install -y xfce4-*
nala install -y lightdm
nala install -y lightdm-gtk-greeter-settings
nala install -y python3-gi
nala install -y python3-psutil
nala install -y menulibre
nala install -y mugshot
#Instalar Fonts
nala install -y fonts-noto
nala install -y fonts-noto-core
nala install -y fonts-powerline
#Instalar Theme
nala install -y plymouth
nala install -y plymouth-themes
nala install -y gnome-brave-icon-theme
nala install -y orchis-gtk-theme
nala install -y greybird-gtk-theme
nala install -y elementary-xfce-icon-theme
nala install -y breeze-cursor-theme
#Instalar gerenciador de rede, usuários, impressora e software para X.
nala install -y network-manager
nala install -y network-manager-gnome
nala install -y gnome-system-tools
nala install -y system-config-printer
nala install -y software-properties-gtk
#Instalar Ferramentas do Sistema
nala install -y synaptic
nala install -y gparted
nala install -y neofetch
nala install -y parole
nala install -y clementine
nala install -y gufw
nala install -y blueman
#Instalar Complementos do sistema
nala install -y firmware-linux
nala install -y xdg-user-dirs-gtk
nala install -y optipng
#Instalar Compartilhamento de rede
nala install -y samba
nala install -y smbclient
nala install -y wsdd wsdd2
nala install -y gvfs-backends gvfs-fuse
#Instalar Software Impressora HP
nala install -y hplip
nala install -y printer-driver-all
#Instalar outro programas
nala install -y firefox-esr thunar-dropbox-plugin
nala install -y inkscape gimp qbittorrent
nala install -y galculator atril gigolo
nala install -y zip p7zip* unrar*
#Substituir o arquivo inface para network-manager ter controle da rede no X
cp -f config/interfaces /etc/network/interfaces
#Configuração da tela de login
cp -f config/lightdm-gtk-greeter.conf /etc/lightdm
#Menu e painel de configuraçães do xfce
cp -f menu/* /etc/xdg/menus
cp -f xfce/* /etc/xdg/xfce4/xfconf/xfce-perchannel-xml
#Icones
cp -f dx-logo.svg /usr/share/icons/hicolor/scalable/apps
#Habilitar Mostra usuario no login
sed -i 's/#greeter-hide-users=false/greeter-hide-users=false/g' /etc/lightdm/lightdm.conf
#Habilitar theme de carregamento do sistemax
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet"/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"/g' /etc/default/grub
sed -i 's/#GRUB_GFXMODE=640x480/GRUB_GFXMODE=1024x768/g' /etc/default/grub
plymouth-set-default-theme -R bgrt
#Theme Panel XFCE
mv -n theme/W7.tar.bz2 /usr/share/xfce4-panel-profiles/layouts/
update-grub2
#Remove interface para APT
apt remove -y nala
#Limpeza no apt
apt autoremove -y && apt autoclean && apt clean
#Reinicia o sistema
reboot
