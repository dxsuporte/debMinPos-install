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
echo "deb http://deb.debian.org/debian/ oldstable main contrib non-free" | tee /etc/apt/sources.list.d/oldstable.list
echo "deb https://www.deb-multimedia.org "$(lsb_release -sc)" main non-free" | tee /etc/apt/sources.list.d/deb-multimedia.list
wget -c https://www.deb-multimedia.org/pool/main/d/deb-multimedia-keyring/deb-multimedia-keyring_2016.8.1_all.deb -O /tmp/deb-multimedia.deb
$PRG install -y /tmp/deb-multimedia.deb
$PRG update && $PRG upgrade -y
#firmware Drives
$PRG install -y linux-headers-$(uname -r)
$PRG install -y firmware-linux
$PRG install -y firmware-amd-graphics
$PRG install -y firmware-iwlwifi firmware-atheros firmware-realtek
$PRG install -y firmware-b43-installer firmware-b43legacy-installer
$PRG install -y intel-microcode amd64-microcode intel-gpu-tools amdgcn-tools
$PRG install -y mesa-vulkan-drivers mesa-utils libglapi-mesa libgl1-mesa-dri libgles2 libegl1
$PRG install -y task-laptop tlp
#Interface grafica XFCE4 Padrão
$PRG install -y task-xfce-desktop
$PRG install -y task-brazilian-portuguese*
#Interface grafica remove app do padrão
$PRG remove libreoffice-* -y
$PRG remove -y xsane xterm exfalso
$PRG remove -y xfce4-dict
$PRG autoremove -y
#Interface grafica XFCE4
$PRG install -y xfce4-taskmanager xfce4-screenshooter xfce4-whiskermenu-plugin xfce4-weather-plugin
$PRG install -y xfce4-panel-profiles || echo 'ok'
#Software extras XFCE
$PRG install -y menulibre mugshot xfburn gigolo gvfs-*
$PRG install -y xdg-user-dirs-gtk elementary-xfce-icon-theme
#Themes
$PRG install -y breeze-gtk-theme breeze-cursor-theme xfwm4-theme-breeze
$PRG install -y arc-theme orchis-gtk-theme bibata-cursor-theme
#Software Padrão
$PRG install -y mate-calc drawing mirage kazam
#Gerenciador Boot Plymouth
$PRG install -y plymouth-themes grub-theme-starfield
plymouth-set-default-theme -R bgrt
#Gerenciador de sistema.
$PRG install -y gnome-system-tools deepin-deb-installer package-update-indicator
#Programas de Shell e Config Net-tools
$PRG install -y net-tools command-not-found neofetch arping
echo 'PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/bin/X11:/snap/bin"' | tee /etc/environment
#Codecs para descompaquitar arquivos
$PRG install -y zip p7zip* unrar* unzip rar arc arj cabextract lhasa unace* xz-utils sharutils uudeview mpack
#Codecs de audio e video
$PRG install -y ffmpeg mencoder faad lame sox twolame vorbis-tools gstreamer1.0-plugins-ugly
####Config####
#Login Lightdm
sed -i 's/#greeter-hide-users=false/greeter-hide-users=false/g' /etc/lightdm/lightdm.conf
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
sed -i '3i Name[pt_BR]=Gerenciador de atualização de pacote' /usr/share/applications/org.guido-berhoerster.code.package-update-indicator.preferences.desktop
sed -i '5i GenericName[pt_BR]=Preferências do indicador de atualização de pacote' /usr/share/applications/org.guido-berhoerster.code.package-update-indicator.preferences.desktop
#Software Extra
sh utilities.sh
