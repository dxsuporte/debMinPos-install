#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#APT or NALA
if [ "$(dpkg -l nala 2>&- | grep -c ^ii)" = 1 ]; then
    PRG="nala"
else
    PRG="apt"
fi
#----------Start----------#
#Versão do Debian
if [ $(lsb_release -rs 2 | awk "{print}") = "n/a" ]; then
    RELEASE="testing"
else
    RELEASE=$(lsb_release -rs 2 | awk "{print}")
fi
#
$PRG install -y apt-transport-https
$PRG install -y wget
#Atualizar sistema
$PRG update && $PRG upgrade -y
######################################################################
read -r -p "Instalar o Inkscape - Design gráfico? [y|n] " INKSCAPE
read -r -p "Instalar o Gimp - Editor de imagem? [y|n] " GIMP
read -r -p "Instalar o Clementine - Player de Música? [y/n] " CLEMENTINE
read -r -p "Instalar o VLC - Media Player? [y|n] " VLC
read -r -p "Instalar o LibreOffice? [y|n] " LIBREOFFICE
read -r -p "Instalar o OnlyOffice? [y|n] " ONLYOFFICE
read -r -p "Instalar o Microsoft Edge? [y|n] " EDGE
read -r -p "Instalar o Google Chrome? [y|n] " CHROME
read -r -p "Instalar o Chromium Browser? [y|n] " CHROMIUM
read -r -p "Instalar o DropBox? [y|n] " DROPBOX
read -r -p "Instalar o MegaSync? [y|n] " MEGASYNC
read -r -p "Instalar o NextCloud? [y|n] " NEXTCLOUD
read -r -p "Instalar o TeamViewer - Acesso remoto? [y|n] " TEAMVIEWER
read -r -p "Instalar o AnyDesk - Acesso remoto ? [y|n] " ANYDESK
read -r -p "Instalar o VSCode? [y|n] " VSCODE
read -r -p "Instalar o VSCodium? [y|n] " VSCODIUM
read -r -p "Instalar o Node JS? [y|n] " NODEJS
read -r -p "Instalar o SQLite? [y|n] " SQLITE
read -r -p "Instalar o Antares SQL? [y|n] " ANTARESSQL
read -r -p "Instalar o DWService? [y|n] " DWSERVICE
######################################################################
#Inkscape - Design gráfico
if [ "$INKSCAPE" = "y" ]; then
    $PRG install -y inkscape
fi
#Gimp - Editor de imagem
if [ "$GIMP" = "y" ]; then
    $PRG install -y gimp
fi
#Clementine - Player de Música
if [ "$CLEMENTINE" = "y" ]; then
    $PRG install -y clementine
fi
#VLC - Media Player
if [ "$VLC" = "y" ]; then
    $PRG install -y vlc
    #$PRG install -y libdvd-pkg
fi
#Chromium Browser
if [ "$CHROMIUM" = "y" ]; then
    $PRG install -y chromium
    $PRG install -y chromium-l10n
fi
#DropBox
if [ "$DROPBOX" = "y" ]; then
    #XFCE
    if [ $XDG_CURRENT_DESKTOP = XFCE ]; then
        $PRG install -y thunar-dropbox-plugin
    fi
fi
#NextCloud
if [ "$NEXTCLOUD" = "y" ]; then
    $PRG install -y nextcloud-desktop
fi
#SQLite
if [ "$SQLITE" = "y" ]; then
    $PRG install -y sqlite3
    $PRG install -y sqlitebrowser
fi
#LibreOffice
if [ "$LIBREOFFICE" = "y" ]; then
    sh libreoffice.sh $PRG
fi
#OnlyOffice
if [ "$ONLYOFFICE" = "y" ]; then
    sh onlyoffice.sh $PRG
fi
#Microsoft Edge
if [ "$EDGE" = "y" ]; then
    sh edge.sh $PRG
fi
#Google Chrome
if [ "$CHROME" = "y" ]; then
    sh chrome.sh $PRG
fi
#MegaSync
if [ "$MEGASYNC" = "y" ]; then
    sh mega.sh $PRG
fi
#TeamViewer
if [ "$TEAMVIEWER" = "y" ]; then
    sh teamviewer.sh $PRG
fi
#AnyDesk
if [ "$ANYDESK" = "y" ]; then
    sh anydesk.sh $PRG
fi
#VSCode
if [ "$VSCODE" = "y" ]; then
    sh vscode.sh $PRG
fi
#VSCodium
if [ "$VSCODIUM" = "y" ]; then
    sh vscodium.sh $PRG
fi
#Node JS
if [ "$NODEJS" = "y" ]; then
    sh nodejs.sh $PRG
fi
#Antares SQL
if [ "$ANTARESSQL" = "y" ]; then
    sh antares.sh $PRG
fi
#DWService
if [ "$DWSERVICE" = "y" ]; then
    sh dwagent.sh $PRG
fi
#----------End----------#
#Atualizar Grub, Limpeza apt
update-grub2 && $PRG autoremove -y && apt autoclean && apt clean
#Reinicia o sistema
read -r -p "Instalação concluida! Seu pc precisa ser reiniciad! [Enter] " REBOOT
if [ "$REBOOT" = "y" ]; then
    reboot
else
    reboot
fi
