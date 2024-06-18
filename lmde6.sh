#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#----------Start----------#
apt update && apt upgrade -y
#Mudar lingual do Sistema
apt install -y locales-all task-brazilian-portuguese*
update-locale LANG=pt_BR.UTF-8 && locale-gen --purge pt_BR.UTF-8
#Remove aplicativos
apt remove -y hexchat firefox-esr libreoffice-*
apt autoremove -y
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
apt install -y kazam elementary-xfce-icon-theme
#Codecs para descompaquitar arquivos
apt install -y p7zip* unrar* rar arc
#Codecs de audio e video
apt install -y ffmpeg mencoder faad lame sox twolame vorbis-tools
#Outros Codecs
apt install -y python3-unidecode
#Programas de Shell e Config Net-tools
apt install -y net-tools command-not-found neofetch arping
echo 'PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/bin/X11:/snap/bin"' | tee /etc/environment
#Copiar aquivo de configurações
cp -f -r config/usr/share/backgrounds/* /usr/share/backgrounds/
cp -f -r config/usr/share/icons/* /usr/share/icons/
cp -f -r config/usr/share/themes/* /usr/share/themes/
#Remover Configurações
rm -f -r /usr/share/icons/elementary-xfce-darke*
#Grub
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet"/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash modprobe.blacklist=pcspkr"/g' /etc/default/grub
sed -i 's/#GRUB_DISABLE_OS_PROBER=false/GRUB_DISABLE_OS_PROBER=false/g' /etc/default/grub
sed -i 's/#GRUB_GFXMODE=640x480/GRUB_GFXMODE=1024x768/g' /etc/default/grub
sed -i 's/#GRUB_DISABLE_RECOVERY="true"/GRUB_DISABLE_RECOVERY=true/g' /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg
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
