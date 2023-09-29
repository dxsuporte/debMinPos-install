#!/bin/sh
#Stop the script if any command fails. || #Interromper o script se algum comando falhar.
set -e
#Mudar lingual do Sistema
update-locale LANG=pt_BR.UTF-8
locale-gen --purge pt_BR.UTF-8
#Interface para APT
apt install -y nala
#Ultilitario de Terminal
nala install -y software-properties-common
nala install -y apt-transport-https
nala install -y bash-completion
nala install -y neofetch
nala install -y curl
nala install -y wget
#Desativar CDROM, codigo font e Habilitar Repositorio extras Debian
sed -i 's/deb cdrom:/#deb cdrom:/g' /etc/apt/sources.list
sed -i 's/deb-src/#deb-src/g' /etc/apt/sources.list
add-apt-repository -y contrib non-free
#Atualizar sistema
nala update
nala upgrade -y
#Drives
#nala install -y intel-microcode
#nala install -y amd64-microcode
nala install -y firmware-linux
nala install -y linux-headers-$(uname -r)
nala install -y intel-gpu-tools
#Interface grafica XFCE4
nala install -y xfce4-terminal
nala install -y xorg
nala install -y xfce4
nala install -y xfce4-goodies
nala install -y xfce4-*
#Instalar Theme
nala install -y orchis-gtk-theme
nala install -y greybird-gtk-theme
nala install -y elementary-xfce-icon-theme
nala install -y breeze-cursor-theme
#Instalar Fonts
nala install -y fonts-noto
nala install -y fonts-noto-core
nala install -y fonts-firacode
nala install -y fonts-powerline
#Interface Carregamento do X
nala install -y lightdm
nala install -y lightdm-gtk-greeter-settings
nala install -y plymouth
nala install -y plymouth-themes
#Ferramenta do Sistema
nala install -y gnome-system-tools
nala install -y gufw
nala install -y gparted
nala install -y xdg-user-dirs-gtk
nala install -y menulibre
nala install -y mugshot
nala install -y python3-gi
nala install -y python3-psutil
#Gerenciador de software.
nala install -y software-properties-gtk
nala install -y synaptic
#Gerenciador de rede.
nala install -y network-manager
nala install -y network-manager-gnome
nala install -y blueman
#Programas de Básicos
nala install -y firefox-esr
nala install -y qbittorrent
nala install -y parole
nala install -y galculator
nala install -y atril
nala install -y mintstick
#Instalar Compartilhamento de rede
nala install -y samba
nala install -y smbclient
nala install -y wsdd
nala install -y wsdd2
nala install -y gvfs-backends
nala install -y gvfs-fuse
nala install -y gigolo
#Instalar Software Impressora HP
nala install -y system-config-printer
nala install -y hplip
nala install -y printer-driver-all
nala install -y simple-scan
#Codecs para descompaquitar arquivos
nala install -y zip p7zip* unrar* rar arc arj cabextract lhasa unace xz-utils
#Codecs de audio e video
nala install -y ffmpeg faad lame sox twolame vorbis-tools libavcodec-extra* gstreamer1.0-fdkaac
#-----------------------------Configurações do Sistema-----------------------------------------#
#Gerenciar Rede modo grafico
cp -f config/interfaces /etc/network/interfaces
#Menu e configuraçães do xfce
cp -f menu/* /etc/xdg/menus/
cp -f xfce/* /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/
#Tema da tela de login
cp -f config/lightdm-gtk-greeter.conf /etc/lightdm
#Aplicativos Padrão
sed -i 's/debian-sensible-browser/firefox/g' /etc/xdg/xfce4/helpers.rc
#Habilitar Mostra usuario no login
sed -i 's/#greeter-hide-users=false/greeter-hide-users=false/g' /etc/lightdm/lightdm.conf
#Samba config
sed -i 's/;   bind interfaces only = yes/bind interfaces only = yes/g' /etc/samba/smb.conf
echo "[public]" | tee -a /etc/samba/smb.conf
echo "path = /home/samba/public" | tee -a /etc/samba/smb.conf
echo "public = yes" | tee -a /etc/samba/smb.conf
echo "guest only = yes" | tee -a /etc/samba/smb.conf
echo "writable = yes" | tee -a /etc/samba/smb.conf
echo "force create mode = 0666" | tee -a /etc/samba/smb.conf
echo "force directory mode = 0777" | tee -a /etc/samba/smb.conf
echo "browseable = yes" | tee -a /etc/samba/smb.conf
mkdir /home/samba/public
chmod -R ugo+w /home/samba/public
touch /etc/xdg/autostart/samba-public.desktop
echo '[Desktop Entry]' | tee -a /etc/xdg/autostart/samba-public.desktop
echo 'Exec=sh -c "gio mount smb://localhost/public -a; [ ! -d "$HOME/share" ] && { ln -s /home/samba/public $HOME/share; }"' | tee -a /etc/xdg/autostart/samba-public.desktop
#Icones
cp -f icons/dx-logo.svg /usr/share/icons/hicolor/scalable/apps
#Backgrounds
mv -n backgrounds/* /usr/share/backgrounds
ln -s /usr/share/backgrounds/xfce/* /usr/share/backgrounds/
ln -s /usr/share/desktop-base/emerald-theme/login/background.svg /usr/share/backgrounds/01.svg
ln -s /usr/share/desktop-base/futureprototype-theme/login/background.svg /usr/share/backgrounds/02.svg
ln -s /usr/share/desktop-base/homeworld-theme/login/background.svg /usr/share/backgrounds/03.svg
ln -s /usr/share/desktop-base/joy-theme/login/background.svg /usr/share/backgrounds/04.svg
ln -s /usr/share/desktop-base/lines-theme/login/background.svg /usr/share/backgrounds/05.svg
ln -s /usr/share/desktop-base/moonlight-theme/login/background.svg /usr/share/backgrounds/06.svg
ln -s /usr/share/desktop-base/softwaves-theme/login/background.svg /usr/share/backgrounds/07.svg
ln -s /usr/share/desktop-base/spacefun-theme/login/background.svg /usr/share/backgrounds/08.svg
ln -s /usr/share/desktop-base/emerald-theme/login/background-nologo.svg /usr/share/backgrounds/09.svg
ln -s /usr/share/desktop-base/futureprototype-theme/login/background-nologo.svg /usr/share/backgrounds/10.svg
ln -s /usr/share/desktop-base/homeworld-theme/login/background-nologo.svg /usr/share/backgrounds/11.svg
ln -s /usr/share/desktop-base/lines-theme/login/background-nologo.svg /usr/share/backgrounds/12.svg
ln -s /usr/share/desktop-base/moonlight-theme/login/background-nologo.svg /usr/share/backgrounds/13.svg
ln -s /usr/share/desktop-base/softwaves-theme/login/background-nologo.svg /usr/share/backgrounds/14.svg
ln -s /usr/share/plymouth/themes/emerald/Emerald_plymouth.svg /usr/share/backgrounds/15.svg
#Modelo Thema Panel XFCE
mv -n theme/W7.tar.bz2 /usr/share/xfce4-panel-profiles/layouts/
#Habilitar theme de carregamento do sistemax
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet"/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"/g' /etc/default/grub
sed -i 's/#GRUB_GFXMODE=640x480/GRUB_GFXMODE=1024x768/g' /etc/default/grub
plymouth-set-default-theme -R bgrt
update-grub2
#Bash User Root
bash -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)" --unattended || echo 'OK'
sed -i 's/OSH_THEME="font"/OSH_THEME="zork"/g' /root/.bashrc
#Bash User First Home
runuser -l $(id 1000 -u -n) -c 'bash -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)" --unattended' || echo 'OK'
sed -i 's/OSH_THEME="font"/OSH_THEME="mairan"/g' /home/$(id 1000 -u -n)/.bashrc
#Limpeza no apt
nala autoremove -y
apt autoclean
nala clean
#Reinicia o sistema
reboot