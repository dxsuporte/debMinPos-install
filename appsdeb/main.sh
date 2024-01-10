#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#Include
. "$(pwd)/../myInclude.sh"
#----------Start----------#
#Atualizar sistema
$myPRG update && $myPRG upgrade -y
$myPRG install -y apt-transport-https curl
######################################################################
read -r -p "Instalar o Gimp? - Editor de imagem! [y|n] " GIMP
read -r -p "Instalar o Inkscape? - Design gráfico! [y|n] " INKSCAPE
read -r -p "Instalar o Audacity? - Editor, gravador de áudio! [y|n] " AUDACITY
read -r -p "Instalar o Clementine? - Player de Música! [y/n] " CLEMENTINE
read -r -p "Instalar o VLC? - Media Player! [y|n] " VLC
read -r -p "Instalar o WinFF? - Conversor de vídeos! [y|n] " WINFF
read -r -p "Instalar o Jogos Nativos? [y|n] " JOGOS
read -r -p "Instalar o LibreOffice? - Suite office compatível com Microsoft Office! [y|n] " LIBREOFFICE
read -r -p "Instalar o OnlyOffice? - Suite office! [y|n] " ONLYOFFICE
read -r -p "Instalar o Microsoft Edge? - Navegadores de Internet! [y|n] " EDGE
read -r -p "Instalar o Chromium? - Navegadores de Internet! [y|n] " CHROMIUM
read -r -p "Instalar o Google Chrome? - Navegadores de Internet! [y|n] " CHROME
read -r -p "Instalar o Google Earth? - Mapas do Google! [y|n] " EARTH
read -r -p "Instalar o DropBox? - Arquivos em nuvem! [y|n] " DROPBOX
read -r -p "Instalar o MegaSync? - Arquivos em nuvem! [y|n] " MEGASYNC
read -r -p "Instalar o NextCloud? - Arquivos em nuvem! [y|n] " NEXTCLOUD
read -r -p "Instalar o TeamViewer? - Acesso remoto! [y|n] " TEAMVIEWER
read -r -p "Instalar o AnyDesk? - Acesso remoto! [y|n] " ANYDESK
read -r -p "Instalar o RustDesk? - Acesso remoto! [y|n] " RUSTDESK
read -r -p "Instalar o DWService? - Acesso remoto! [y|n] " DWSERVICE
read -r -p "Instalar o EMBY? - Servidor de multimidia! [y|n] " EMBY
read -r -p "Instalar o BalenaEtcher? - Gravador ISO em USB! [y|n] " BALENAETCHER
read -r -p "Instalar o VSCode? - Editores de código! [y|n] " VSCODE
read -r -p "Instalar o VSCodium? - Editores de código! [y|n] " VSCODIUM
read -r -p "Instalar o Node JS? - Ambiente de execução Javascript server-side! [y|n] " NODEJS
read -r -p "Instalar o SQLite? - Banco de dados sql! [y|n] " SQLITE
read -r -p "Instalar o Antares? SQL - Ferramenta de gerenciamento do banco de dados! [y|n] " ANTARESSQL
read -r -p "Instalar o SAMBA? - Compartilhamento de arquivos de servidores Linux à Windows! [y|n] " SAMBA
read -r -p "Instalar o XAMPP? - Servidor Apache, MySQL,PHP e PHPMYADMIN! [y|n] " XAMPP
read -r -p "Instalar o KVM? - Gerenciador de Virtualização! [y|n] " KVM
read -r -p "Instalar a Gnome Software? - Loja de  Software Gnome! [y|n] " GNOMESOFTWARE
read -r -p "Instalar o Discover? - Loja de  Software KDE! [y|n] " DISCOVER
read -r -p "Instalar o Flatpak? - Loja de Software Flathub! [y|n] " FLATPAK
######################################################################
#Gimp
if [ "$GIMP" = "y" ]; then
    $myPRG install -y gimp
fi
#Inkscape
if [ "$INKSCAPE" = "y" ]; then
    $myPRG install -y inkscape
fi
#AUDACITY
if [ "$AUDACITY" = "y" ]; then
    $myPRG install -y audacity
fi
#Clementine
if [ "$CLEMENTINE" = "y" ]; then
    $myPRG install -y clementine
fi
#VLC
if [ "$VLC" = "y" ]; then
    $myPRG install -y vlc
    $myPRG install -y libdvd-pkg
    dpkg-reconfigure libdvd-pkg
fi
#WinFF
if [ "$WINFF" = "y" ]; then
    $myPRG install -y winff
fi
#JOGOS
if [ "$JOGOS" = "y" ]; then
    $myPRG install -y aisleriot gnome-chess gnome-nibbles
    $myPRG install -y kpat kcheckers quadrapassel mednafen
fi
#Chromium
if [ "$CHROMIUM" = "y" ]; then
    $myPRG install -y chromium
    $myPRG install -y chromium-l10n
fi
#DropBox
if [ "$DROPBOX" = "y" ]; then
    $myPRG install -y thunar-dropbox-plugin
fi
#NextCloud
if [ "$NEXTCLOUD" = "y" ]; then
    $myPRG install -y nextcloud-desktop
fi
#SQLite
if [ "$SQLITE" = "y" ]; then
    $myPRG install -y sqlite3
    $myPRG install -y sqlitebrowser
fi
#KVM
if [ "$KVM" = "y" ]; then
    $myPRG install -y virt-manager
fi
#Gnome Software
if [ "$GNOMESOFTWARE" = "y" ]; then
    $myPRG install -y gnome-software
fi
#Discover
if [ "$DISCOVER" = "y" ]; then
    $myPRG install -y plasma-discover
fi
#Flatpak / Flathub
if [ "$FLATPAK" = "y" ]; then
    $myPRG install -y flatpak
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    if [ "$GNOMESOFTWARE" = "y" ]; then
        $myPRG install -y gnome-software-plugin-flatpak
    fi
    if [ "$DISCOVER" = "y" ]; then
        $myPRG install -y plasma-discover-backend-flatpak
    fi
fi
#LibreOffice
if [ "$LIBREOFFICE" = "y" ]; then
    sh libreoffice.sh
fi
#OnlyOffice
if [ "$ONLYOFFICE" = "y" ]; then
    sh onlyoffice.sh
fi
#MegaSync
if [ "$MEGASYNC" = "y" ]; then
    sh mega.sh
fi
#TeamViewer
if [ "$TEAMVIEWER" = "y" ]; then
    sh teamviewer.sh
fi
#AnyDesk
if [ "$ANYDESK" = "y" ]; then
    sh anydesk.sh
fi
#RustDesk
if [ "$RUSTDESK" = "y" ]; then
    sh rustdesk.sh
fi
#Enby
if [ "$EMBY" = "y" ]; then
    sh emby.sh
fi
#BalenaEtcher
if [ "$BALENAETCHER" = "y" ]; then
    sh balenaetcher.sh
fi
#VSCodium
if [ "$VSCODIUM" = "y" ]; then
    sh vscodium.sh
fi
#Antares SQL
if [ "$ANTARESSQL" = "y" ]; then
    sh antares.sh
fi
#Google - Chrome e Earth
if [ "$CHROME" = "y" ]; then
    sh chrome.sh
fi
if [ "$EARTH" = "y" ]; then
    sh earth.sh
fi
#Microsoft - Edge e VSCode
if [ "$EDGE" = "y" ]; then
    sh edge.sh
fi
if [ "$VSCODE" = "y" ]; then
    sh vscode.sh
fi
#Node JS
if [ "$NODEJS" = "y" ]; then
    sh nodejs.sh
fi
#SAMBA
if [ "$SAMBA" = "y" ]; then
    sh samba.sh
fi
#DWService
if [ "$DWSERVICE" = "y" ]; then
    sh dwagent.sh
fi
#XAMPP
if [ "$XAMPP" = "y" ]; then
    sh xampp.sh
fi
#----------End----------#
#Atualizar Grub, Limpeza apt
update-grub2 && $myPRG autoremove -y && apt autoclean && apt clean
#Reinicia o sistema
read -r -p "Instalação concluida! Seu pc precisa ser reiniciad! [Enter] " REBOOT
if [ "$REBOOT" = "y" ]; then
    rm -f -r /tmp/* && reboot
else
    rm -f -r /tmp/* && reboot
fi
