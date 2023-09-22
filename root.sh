#!/bin/sh
set -e
#Desativar CDROM, codigo font e Habilitar Repositorio extras Debian
sed -i 's/deb cdrom:/#deb cdrom:/g' /etc/apt/sources.list
sed -i 's/deb-src/#deb-src/g' /etc/apt/sources.list
sed -i 's/main non-free-firmware/main non-free-firmware contrib non-free/g' /etc/apt/sources.list
#Mudar lingual do Sistema
update-locale LANG=pt_BR.UTF-8
locale-gen --purge pt_BR.UTF-8
#Instala interface para APT
apt install -y nala
#Atualizar sistema
nala update && nala upgrade -y
#
nala install -y firmware-linux
nala install -y intel-microcode
nala install -y amd64-microcode
nala install -y linux-headers-$(uname -r)
#Instalar e configurar tema no bash do root
nala install -y bash-completion curl wget software-properties-common apt-transport-https
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" --unattended || echo 'OK'
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
nala install -y lightdm lightdm-gtk-greeter-settings
nala install -y python3-gi python3-psutil
nala install -y menulibre mugshot
#Instalar Complementos do sistema
nala install -y xdg-user-dirs-gtk optipng
#Instalar Fonts
nala install -y fonts-noto fonts-noto-core fonts-firacode fonts-powerline
#Otimizar bateria do notebook
nala install -y tlp
#Instalar Theme
nala install -y plymouth plymouth-themes
nala install -y orchis-gtk-theme greybird-gtk-theme
nala install -y elementary-xfce-icon-theme breeze-cursor-theme
#Instalar gerenciador de rede, usuários, impressora e software para X.
nala install -y network-manager
nala install -y network-manager-gnome
nala install -y gnome-system-tools
nala install -y system-config-printer
nala install -y software-properties-gtk
#Instalar Ferramentas do Sistema
nala install -y synaptic gparted gufw
nala install -y neofetch blueman
nala install -y parole clementine
#Instalar Compartilhamento de rede
nala install -y samba smbclient wsdd wsdd2
nala install -y gvfs-backends gvfs-fuse
#Instalar Software Impressora HP
nala install -y hplip printer-driver-all
#Instalar outro programas
nala install -y firefox-esr thunar-dropbox-plugin
nala install -y inkscape gimp qbittorrent
nala install -y galculator atril gigolo
#Codecs para descompaquitar arquivos
nala install -y zip p7zip* unrar* rar arc arj cabextract lhasa unace xz-utils
#Codecs de audio e video
nala install -y ffmpeg faad lame sox twolame vorbis-tools
nala install -y libavcodec-extra* libavdevice60 libgstreamer1.0-0
nala install -y gstreamer1.0-fdkaac gstreamer1.0-libav gstreamer1.0-vaapi gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly
#Programas de terceiros
#Edge e VSCode
bash -c "echo 'deb https://packages.microsoft.com/repos/edge stable main' >> /etc/apt/sources.list.d/microsoft-edge.list"
bash -c "echo 'deb https://packages.microsoft.com/repos/vscode stable main' >> /etc/apt/sources.list.d/microsoft-vscode.list"
wget -q -O https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
#Chrome
bash -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb stable main" >> /etc/apt/sources.list.d/google-chrome.list'
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub -O- | apt-key add -
#AnyDesk
echo "deb http://deb.anydesk.com all main" >/etc/apt/sources.list.d/anydesk-stable.list
wget -q -O - https://keys.anydesk.com/repos/DEB-GPG-KEY -O- | apt-key add -
#TeamViewer
bash -c "echo 'deb https://linux.teamviewer.com/deb stable main' >> /etc/apt/sources.list.d/teamviewer.list"
wget -q -O https://download.teamviewer.com/download/linux/signature/TeamViewer2017.asc -O- | apt-key add -
nala update
nala install -y microsoft-edge-stable
nala install -y google-chrome-stable
nala install -y anydesk
nala install -y teamviewer
nala install -y coxavi
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
#Backgrounds
mv -n backgrounds/* /usr/share/backgrounds
#Theme Panel XFCE
mv -n theme/W7.tar.bz2 /usr/share/xfce4-panel-profiles/layouts/
update-grub2
#Remove interface para APT
nala remove -y nala --remove-essential
#Limpeza no apt
apt autoremove -y && apt autoclean && apt clean
#Reinicia o sistema
reboot
