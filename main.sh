#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#Desativar CDROM
sed -i 's/deb cdrom:/#deb cdrom:/g' /etc/apt/sources.list
#----------Start----------#
#Habilitar repositorios extra e oldstable
apt install -y software-properties-common software-properties-gtk wget curl gpg
add-apt-repository -y contrib non-free
echo "deb http://deb.debian.org/debian/ oldstable main contrib non-free" | tee /etc/apt/sources.list.d/oldstable.list
echo "deb https://www.deb-multimedia.org "$(lsb_release -sc)" main non-free" | tee /etc/apt/sources.list.d/deb-multimedia.list
wget -c https://www.deb-multimedia.org/pool/main/d/deb-multimedia-keyring/deb-multimedia-keyring_2016.8.1_all.deb -O /tmp/deb-multimedia.deb
apt install -y /tmp/deb-multimedia.deb
apt update && apt upgrade -y
#XFCE DESKTOP e Remove aplicativos
apt install -y task-xfce-desktop
apt remove -y xsane xterm exfalso hv3 libreoffice-*
apt autoremove -y
#Mudar lingual do Sistema
apt install -y locales-all task-brazilian-portuguese*
update-locale LANG=pt_BR.UTF-8 && locale-gen --purge pt_BR.UTF-8
#firmware Drives
apt install -y linux-headers-$(uname -r)
apt install -y firmware-linux
apt install -y firmware-iwlwifi firmware-atheros firmware-realtek
apt install -y firmware-b43-installer firmware-b43legacy-installer
apt install -y firmware-amd-graphics amd64-microcode amdgcn-tools
apt install -y intel-microcode intel-gpu-tools
apt install -y mesa-vulkan-drivers mesa-utils libglapi-mesa libgl1-mesa-dri
apt install -y task-laptop tlp
#Software extras
apt install -y menulibre gigolo gdebi mate-calc drawing kazam
#Gerenciador geral do sistema.
apt install -y gvfs* gnome-system-tools xdg-user-dirs-gtk tracker elementary-xfce-icon-theme bibata-cursor-theme
#Gerenciador Boot Plymouth
apt install -y plymouth-themes grub-theme-starfield
plymouth-set-default-theme -R bgrt
#Codecs para descompaquitar arquivos
apt install -y p7zip* unrar* rar arc arj cabextract lhasa unace* sharutils uudeview mpack
#Codecs de audio e video
apt install -y ffmpeg mencoder faad lame sox twolame vorbis-tools
#Outros Codecs
apt install -y python3-unidecode
#Programas de Shell e Config Net-tools
apt install -y net-tools command-not-found neofetch arping
echo 'PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/bin/X11:/snap/bin"' | tee /etc/environment
#Copiar aquivo de configurações
cp -f -r config/usr/* /usr/
cp -f -r config/etc/* /etc/
#Remover Configurações
rm -f -r /usr/share/icons/elementary-xfce-darke*
rm -f -r /usr/share/themes/Daloa*
rm -f -r /usr/share/themes/Kokodi*
rm -f -r /usr/share/themes/Moheli*
#Desktop Base
unlink /etc/alternatives/desktop-theme
ln -s /usr/share/desktop-base/dx-theme/ /etc/alternatives/desktop-theme
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
#Backgrounds
ln -sf /usr/share/backgrounds/xfce/* /usr/share/backgrounds/
ln -sf /usr/share/desktop-base/dx-theme/login/background.svg /usr/share/backgrounds/default.svg
ln -sf /usr/share/desktop-base/emerald-theme/login/background.svg /usr/share/backgrounds/01.svg
ln -sf /usr/share/desktop-base/futureprototype-theme/login/background.svg /usr/share/backgrounds/02.svg
ln -sf /usr/share/desktop-base/homeworld-theme/login/background.svg /usr/share/backgrounds/03.svg
ln -sf /usr/share/desktop-base/joy-theme/login/background.svg /usr/share/backgrounds/04.svg
ln -sf /usr/share/desktop-base/lines-theme/login/background.svg /usr/share/backgrounds/05.svg
ln -sf /usr/share/desktop-base/moonlight-theme/login/background.svg /usr/share/backgrounds/06.svg
ln -sf /usr/share/desktop-base/softwaves-theme/login/background.svg /usr/share/backgrounds/07.svg
ln -sf /usr/share/desktop-base/spacefun-theme/login/background.svg /usr/share/backgrounds/08.svg
ln -sf /usr/share/desktop-base/emerald-theme/login/background-nologo.svg /usr/share/backgrounds/09.svg
ln -sf /usr/share/desktop-base/futureprototype-theme/login/background-nologo.svg /usr/share/backgrounds/10.svg
ln -sf /usr/share/desktop-base/homeworld-theme/login/background-nologo.svg /usr/share/backgrounds/11.svg
ln -sf /usr/share/desktop-base/lines-theme/login/background-nologo.svg /usr/share/backgrounds/12.svg
ln -sf /usr/share/desktop-base/moonlight-theme/login/background-nologo.svg /usr/share/backgrounds/13.svg
ln -sf /usr/share/desktop-base/softwaves-theme/login/background-nologo.svg /usr/share/backgrounds/14.svg
ln -sf /usr/share/plymouth/themes/emerald/Emerald_plymouth.svg /usr/share/backgrounds/15.svg
#----------End----------#
#Atualizar Grub, Limpeza apt
update-grub2 && apt autoremove -y && apt autoclean && apt clean
#Reinicia o sistema
read -r -p "Instalação concluida! Seu pc precisa ser reiniciad! Deseja reiniciar agora? [y|n] " REBOOT
if [ "$REBOOT" = "y" ]; then
    rm -f -r /tmp/* && reboot
else
    rm -f -r /tmp/*
fi
