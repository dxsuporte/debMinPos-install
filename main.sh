#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#Mudar lingual do Sistema
update-locale LANG=pt_BR.UTF-8
locale-gen --purge pt_BR.UTF-8
#Desativar CDROM
sed -i 's/deb cdrom:/#deb cdrom:/g' /etc/apt/sources.list
#Habilitar Repositorio extras Debian
apt install -y software-properties-common software-properties-gtk
add-apt-repository -y contrib non-free
#Atualizar sistema
apt update && apt upgrade -y
#Drives
apt install -y linux-headers-$(uname -r)
apt install -y firmware-linux
apt install -y firmware-amd-graphics
apt install -y firmware-iwlwifi
apt install -y firmware-atheros
apt install -y firmware-realtek
apt install -y firmware-b43legacy-installer
apt install -y firmware-b43-installer
apt install -y intel-microcode intel-gpu-tools
apt install -y amd64-microcode amdgcn-tools
#INTEL e AMD
apt install -y mesa-vulkan-drivers mesa-utils
apt install -y libglapi-mesa libgl1-mesa-dri libgles2 libegl1
#Interface grafica XFCE4
apt install -y xfce4-terminal
apt install -y xorg
apt install -y xfce4-session
apt install -y xfce4-panel xfce4-panel-profiles
apt install -y xfce4-power-manager xfce4-taskmanager
apt install -y xfce4-notifyd xfce4-screenshooter xfce4-appfinder
apt install -y xfce4-whiskermenu-plugin xfce4-pulseaudio-plugin
apt install -y xfce4-weather-plugin xfce4-cpugraph-plugin
#Software extras XFCE
apt install -y menulibre mugshot
apt install -y thunar thunar-archive-plugin thunar-media-tags-plugin
apt install -y gigolo gvfs-*
apt install -y parole ristretto
apt install -y mousepad xarchiver
apt install -y xdg-user-dirs xdg-user-dirs-gtk
apt install -y elementary-xfce-icon-theme
#Fonts Padrão
#apt install -y fonts-noto* fonts-powerline fonts-firacode
#Software Padrão
apt install -y firefox-esr atril gnome-calculator
#Gerenciador Login
apt install -y lightdm-gtk-greeter-settings
#Gerenciador Boot
apt install -y plymouth plymouth-themes
#Gerenciador de sistema.
apt install -y network-manager network-manager-gnome gnome-system-tools
#Programas de Shell
apt install -y bash-completion command-not-found
#Codecs para descompaquitar arquivos
apt install -y zip p7zip* unrar* unzip rar arc arj cabextract lhasa unace* xz-utils sharutils uudeview mpack
#Codecs de audio e video
apt install -y ffmpeg mencoder faad lame sox twolame vorbis-tools libavcodec-extra* gstreamer1.0-fdkaac gstreamer1.0-plugins-ugly
####Config####
#Habilitar Theme Grub
sed -i 's/#GRUB_GFXMODE=640x480/GRUB_GFXMODE=1024x768/g' /etc/default/grub
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet"/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash modprobe.blacklist=pcspkr"/g' /etc/default/grub
#Habilitar Usuário no login
sed -i 's/#greeter-hide-users=false/greeter-hide-users=false/g' /etc/lightdm/lightdm.conf
#Tema Login
sed -i 's/#theme-name=/theme-name=Adwaita-dark/g' /etc/lightdm/lightdm-gtk-greeter.conf
sed -i 's/#icon-theme-name=/icon-theme-name=elementary-xfce-dark/g' /etc/lightdm/lightdm-gtk-greeter.conf
#XDG Config
cp -f -r config/xdg/* /etc/xdg/
#Tema padrão XFCE
ln -sf /usr/share/backgrounds/xfce/* /usr/share/backgrounds/
rm -R /usr/share/icons/elementary-xfce-darke*
#Navegador Padrão
sed -i 's/debian-sensible-browser/default-browser.desktop/g' /etc/xdg/xfce4/helpers.rc
#Gerenciar Rede modo grafico
cp -f config/interfaces /etc/network/interfaces
#Aplicar Thema do Boot e Atualizar Boot
plymouth-set-default-theme -R bgrt
update-grub2
#Reiniciar ou Software Extra
read -r -p "Deseta instalar os programas complementares? [y|n] " SOFTWARE
if [ "$SOFTWARE" = "n" ]; then
    #Limpeza no apt
    apt autoremove -y
    apt autoclean
    apt clean
    #Reinicia o sistema
    read -r -p "Instalação concluida! O sistema será reinicializado! [Enter] " REBOOT
    reboot
else
    sh utilities.sh
fi
