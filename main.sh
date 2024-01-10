#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#Desativar CDROM
sed -i 's/deb cdrom:/#deb cdrom:/g' /etc/apt/sources.list
#APT or NALA
read -r -p "Instalar como o thema NALA para APT ? [y|n] " NALA
if [ "$NALA" = "y" ]; then
    apt install -y nala
    PRG="nala"
else
    PRG="apt"
fi
#----------Start----------#
#Mudar lingual do Sistema
$PRG install -y locales locales-all
update-locale LANG=pt_BR.UTF-8 && locale-gen --purge pt_BR.UTF-8
#Habilitar repositorios extra e oldstable
$PRG install -y software-properties-common software-properties-gtk wget curl
add-apt-repository -y contrib non-free
add-apt-repository -y "deb http://deb.debian.org/debian/ oldstable main contrib non-free"
add-apt-repository -y "deb https://www.deb-multimedia.org "$(lsb_release -sc)" main non-free"
wget -c https://www.deb-multimedia.org/pool/main/d/deb-multimedia-keyring/deb-multimedia-keyring_2016.8.1_all.deb -O /tmp/deb-multimedia.deb
$PRG install -y /tmp/deb-multimedia.deb
$PRG update && $PRG upgrade -y
#firmware Drives
$PRG install -y linux-headers-$(uname -r)
$PRG install -y firmware-linux
$PRG install -y firmware-amd-graphics
$PRG install -y firmware-iwlwifi
$PRG install -y firmware-atheros
$PRG install -y firmware-realtek
$PRG install -y firmware-b43legacy-installer
$PRG install -y firmware-b43-installer
$PRG install -y intel-microcode intel-gpu-tools
$PRG install -y amd64-microcode amdgcn-tools
$PRG install -y mesa-vulkan-drivers mesa-utils
$PRG install -y libglapi-mesa libgl1-mesa-dri libgles2 libegl1 tlp
#Interface grafica XFCE4
$PRG install -y xfce4-terminal
$PRG install -y xorg
$PRG install -y xfce4-session
$PRG install -y xfce4-panel xfce4-panel-profiles
$PRG install -y xfce4-power-manager xfce4-taskmanager
$PRG install -y xfce4-notifyd xfce4-screenshooter xfce4-appfinder
$PRG install -y xfce4-whiskermenu-plugin xfce4-pulseaudio-plugin
$PRG install -y xfce4-weather-plugin xfce4-cpugraph-plugin
#Software extras XFCE
$PRG install -y menulibre mugshot libxfce4ui-utils
$PRG install -y thunar thunar-archive-plugin thunar-media-tags-plugin
$PRG install -y gigolo gvfs-*
$PRG install -y mousepad xarchiver parole xfburn
$PRG install -y xdg-user-dirs xdg-user-dirs-gtk
$PRG install -y elementary-xfce-icon-theme
#Themes
$PRG install -y breeze-gtk-theme breeze-cursor-theme xfwm4-theme-breeze
$PRG install -y arc-theme orchis-gtk-theme bibata-cursor-theme
#Software Padrão
$PRG install -y firefox-esr atril galculator mate-calc
$PRG install -y drawing gthumb kazam hardinfo
#Gerenciador Login Lightdm
$PRG install -y lightdm lightdm-gtk-greeter
sed -i 's/#greeter-hide-users=false/greeter-hide-users=false/g' /etc/lightdm/lightdm.conf
#Gerenciador Boot Plymouth
$PRG install -y plymouth plymouth-themes grub-theme-starfield
plymouth-set-default-theme -R bgrt
#Gerenciador de sistema.
$PRG install -y network-manager network-manager-gnome gnome-system-tools
$PRG install -y deepin-deb-installer package-update-indicator
#Programas de Shell e Config Net-tools
$PRG install -y bash-completion net-tools command-not-found neofetch arping
echo 'PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/bin/X11:/snap/bin"' | tee /etc/environment
#Codecs para descompaquitar arquivos
$PRG install -y zip p7zip* unrar* unzip rar arc arj cabextract lhasa unace* xz-utils sharutils uudeview mpack
#Codecs de audio e video
$PRG install -y ffmpeg mencoder faad lame sox twolame vorbis-tools gstreamer1.0-plugins-ugly
####Config####
#Grub
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet"/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash modprobe.blacklist=pcspkr"/g' /etc/default/grub
sed -i '11i GRUB_THEME="/usr/share/grub/themes/starfield/theme.txt"' /etc/default/grub
sed -i 's/#GRUB_DISABLE_OS_PROBER=false/GRUB_DISABLE_OS_PROBER=false/g' /etc/default/grub
sed -i 's/#GRUB_GFXMODE=640x480/GRUB_GFXMODE=1024x768/g' /etc/default/grub
sed -i 's/#GRUB_DISABLE_RECOVERY=true/GRUB_DISABLE_RECOVERY=true/g' /etc/default/grub
sed -i 's/starfield.png/\/usr\/share\/images\/desktop-base\/desktop-grub.png/g' /usr/share/grub/themes/starfield/theme.txt
grub-mkconfig -o /boot/grub/grub.cfg
#Desktop Base
unlink /etc/alternatives/desktop-theme
ln -s /usr/share/desktop-base/dx-theme/ /etc/alternatives/desktop-theme
#Copy Files Configs
cp -f -r config/etc/* /etc/
cp -f -r config/usr/* /usr/
#XFCE Backgrounds e Navegador Padrão
ln -sf /usr/share/backgrounds/xfce/* /usr/share/backgrounds/
sed -i 's/debian-sensible-browser/default-browser.desktop/g' /etc/xdg/xfce4/helpers.rc
rm -f -r /usr/share/icons/elementary-xfce-darke*
rm -f -r /usr/share/themes/Daloa*
rm -f -r /usr/share/themes/Kokodi*
rm -f -r /usr/share/themes/Moheli*
#Configurações Extras
sed -i '4i Name[pt_BR]=Calculadora' /usr/share/applications/galculator.desktop
sed -i '3i Name[pt_BR]=Gerenciador de atualização de pacote' /usr/share/applications/org.guido-berhoerster.code.package-update-indicator.preferences.desktop
sed -i '5i GenericName[pt_BR]=Preferências do indicador de atualização de pacote' /usr/share/applications/org.guido-berhoerster.code.package-update-indicator.preferences.desktop
#Software Extra
sh utilities.sh
