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
read -r -p "Instalar o Inkscape - Design gráfico? [y|n] " INKSCAPE
read -r -p "Instalar o Gimp - Editor de imagem? [y|n] " GIMP
read -r -p "Instalar o Clementine - Player de Música? [y/n] " CLEMENTINE
read -r -p "Instalar o VLC - Media Player? [y|n] " VLC
read -r -p "Instalar o WinFF - Conversor de vídeos? [y|n] " WINFF
read -r -p "Instalar o LibreOffice? [y|n] " LIBREOFFICE
read -r -p "Instalar o OnlyOffice? [y|n] " ONLYOFFICE
read -r -p "Instalar o Microsoft Edge? [y|n] " EDGE
read -r -p "Instalar o Google Chrome? [y|n] " CHROME
read -r -p "Instalar o Google Earth - Mapas do Google ? [y|n] " EARTH
read -r -p "Instalar o Chromium Browser? [y|n] " CHROMIUM
read -r -p "Instalar o DropBox? [y|n] " DROPBOX
read -r -p "Instalar o MegaSync? [y|n] " MEGASYNC
read -r -p "Instalar o NextCloud? [y|n] " NEXTCLOUD
read -r -p "Instalar o TeamViewer - Acesso remoto? [y|n] " TEAMVIEWER
read -r -p "Instalar o AnyDesk - Acesso remoto ? [y|n] " ANYDESK
read -r -p "Instalar o RustDesk - Acesso remoto ? [y|n] " RUSTDESK
read -r -p "Instalar o BalenaEtcher - Gravador ISO em USB ? [y|n] " BALENAETCHER
read -r -p "Instalar o VSCode? [y|n] " VSCODE
read -r -p "Instalar o VSCodium? [y|n] " VSCODIUM
read -r -p "Instalar o Node JS? [y|n] " NODEJS
read -r -p "Instalar o SQLite? [y|n] " SQLITE
read -r -p "Instalar o Antares SQL? [y|n] " ANTARESSQL
read -r -p "Instalar o DWService? [y|n] " DWSERVICE
######################################################################
#Inkscape - Design gráfico
if [ "$INKSCAPE" = "y" ]; then
    $myPRG install -y inkscape
fi
#Gimp - Editor de imagem
if [ "$GIMP" = "y" ]; then
    $myPRG install -y gimp
    $myPRG install -y shotwell
fi
#Clementine - Player de Música
if [ "$CLEMENTINE" = "y" ]; then
    $myPRG install -y clementine
fi
#VLC - Media Player
if [ "$VLC" = "y" ]; then
    $myPRG install -y vlc
    #$myPRG install -y libdvd-pkg
fi
#WinFF - Conversor de vídeos
if [ "$WINFF" = "y" ]; then
    $myPRG install -y winff
fi
#Chromium Browser
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
#LibreOffice
if [ "$LIBREOFFICE" = "y" ]; then
    sh libreoffice.sh
fi
#OnlyOffice
if [ "$ONLYOFFICE" = "y" ]; then
    sh onlyoffice.sh
fi
#Microsoft Edge
if [ "$EDGE" = "y" ]; then
    sh edge.sh
fi
#Google Chrome
if [ "$CHROME" = "y" ]; then
    sh chrome.sh
fi
#Google Earth
if [ "$EARTH" = "y" ]; then
    sh earth.sh
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
#BalenaEtcher
if [ "$BALENAETCHER" = "y" ]; then
    sh balenaetcher.sh
fi
#VSCode
if [ "$VSCODE" = "y" ]; then
    sh vscode.sh
fi
#VSCodium
if [ "$VSCODIUM" = "y" ]; then
    sh vscodium.sh
fi
#Node JS
if [ "$NODEJS" = "y" ]; then
    sh nodejs.sh
fi
#Antares SQL
if [ "$ANTARESSQL" = "y" ]; then
    sh antares.sh
fi
#DWService
if [ "$DWSERVICE" = "y" ]; then
    sh dwagent.sh
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
