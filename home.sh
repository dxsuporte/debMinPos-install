#!/bin/sh
#Stop the script if any command fails. || #Interromper o script se algum comando falhar.
set -e
#Versão do Debian
[ $(lsb_release -rs) = "n/a" ] && { RELEASE="testing" || RELEASE=$(lsb_release -rs); }
#Adicionar Repositorio Debian oldstable
add-apt-repository -y "deb http://deb.debian.org/debian/ oldstable main contrib non-free"
#Atualizar sistema
nala update && nala upgrade -y
######################################################################
read -r -p "Gostaria de otimizar a bateria do notebook? [y|n] " TLP
read -r -p "Instalar o Software para WebCam? [y|n] " CHEESE
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
if [ "$NODEJS" = "y" ]; then
    read -r -p "Qual Versão do Node JS? [16|18|20] " NODEVERSION
fi
read -r -p "Instalar o SQLite? [y|n] " SQLITE
read -r -p "Instalar o Antares SQL? [y|n] " ANTARESSQL
read -r -p "Instalar o DWService? [y|n] " DWSERVICE
read -r -p "Instalar a loja de Software? [y|n] " SOFTWAREDEB
######################################################################
#Otimizar bateria do notebook
if [ "$TLP" = "y" ]; then
    nala install -y tlp
fi
#Cheese webcam
if [ "$CHEESE" = "y" ]; then
    nala install -y cheese
fi
#Inkscape - Design gráfico
if [ "$INKSCAPE" = "y" ]; then
    nala install -y inkscape
fi
#Gimp - Editor de imagem
if [ "$GIMP" = "y" ]; then
    nala install -y gimp
fi
#Clementine - Player de Música 
if [ "$CLEMENTINE" = "y" ]; then
    nala install -y clementine
fi
#VLC - Media Player
if [ "$VLC" = "y" ]; then
    nala install -y vlc
fi
#LibreOffice
if [ "$LIBREOFFICE" = "y" ]; then
    nala install -y --no-install-recommends libreoffice-writer
    nala install -y --no-install-recommends libreoffice-calc
    nala install -y --no-install-recommends libreoffice-draw
    nala install -y libreoffice-style-elementary
    nala install -y libreoffice-gtk3
    nala install -y libreoffice-l10n-pt-br
    wget -c https://pt-br.libreoffice.org/assets/Uploads/PT-BR-Documents/VERO/VeroptBR3215AOC.oxt
    unopkg add --shared VeroptBR3215AOC.oxt
    cp -f config/libreoffice/* /etc/libreoffice/registry/
fi
#OnlyOffice
if [ "$ONLYOFFICE" = "y" ]; then
    wget -c https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb
    nala install -y ./onlyoffice*.deb
    rm -R ./onlyoffice*.deb
fi
#Microsoft Edge
if [ "$EDGE" = "y" ]; then
    add-apt-repository -y "deb https://packages.microsoft.com/repos/edge stable main"
    wget -q -O - https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
    nala update
    nala install -y microsoft-edge-stable
fi
#Google Chrome
if [ "$CHROME" = "y" ]; then
    add-apt-repository -y "deb http://dl.google.com/linux/chrome/deb/ stable main"
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub -O- | apt-key add -
    nala update
    nala install -y google-chrome-stable
fi
#Chromium Browser
if [ "$CHROMIUM" = "y" ]; then
    nala install -y chromium
    nala install -y chromium-l10n
fi
#DropBox
if [ "$DROPBOX" = "y" ]; then
    #XFCE
    if [ $XDG_CURRENT_DESKTOP = XFCE ]; then
        nala install -y thunar-dropbox-plugin
    fi
fi
#MegaSync
if [ "$MEGASYNC" = "y" ]; then
    wget -c https://mega.nz/linux/repo/Debian_"$RELEASE"/amd64/megasync-Debian_"$RELEASE"_amd64.deb
    nala install -y ./megasync*.deb
    rm -R ./megasync*.deb
    #XFCE
    if [ $XDG_CURRENT_DESKTOP = XFCE ]; then
        wget -c https://mega.nz/linux/repo/Debian_"$RELEASE"/amd64/thunar-megasync-Debian_"$RELEASE"_amd64.deb
        nala install -y ./thunar*.deb
        rm -R ./thunar*.deb
    fi
fi
#NextCloud
if [ "$NEXTCLOUD" = "y" ]; then
    nala install -y nextcloud-desktop
fi
#TeamViewer
if [ "$TEAMVIEWER" = "y" ]; then
    wget -c https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
    nala install -y ./teamviewer*.deb
    rm -R ./teamviewer*.deb
fi
#AnyDesk
if [ "$ANYDESK" = "y" ]; then
    add-apt-repository -y "deb http://deb.anydesk.com/ all main"
    wget -q -O - https://keys.anydesk.com/repos/DEB-GPG-KEY -O- | apt-key add -
    nala update
    nala install -y anydesk
fi
#VSCode
if [ "$VSCODE" = "y" ]; then
    add-apt-repository -y "deb https://packages.microsoft.com/repos/vscode stable main"
    wget -q -O - https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
    nala update
    nala install -y code
fi
#VSCodium
if [ "$VSCODIUM" = "y" ]; then
    wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor -o /etc/apt/keyrings/vscodium-archive-keyring.gpg
    echo 'deb [ signed-by=/etc/apt/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' | tee /etc/apt/sources.list.d/vscodium.list
    nala update
    nala install -y codium
fi
#Node JS
if [ "$NODEJS" = "y" ]; then
    wget -qO - https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODEVERSION.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
    nala update
    nala install -y nodejs
fi
#SQLite
if [ "$SQLITE" = "y" ]; then
    nala install -y sqlite3
    nala install -y sqlitebrowser
fi
#Antares SQL
if [ "$ANTARESSQL" = "y" ]; then
    add-apt-repository -y "deb https://antares-sql.github.io/antares-ppa ./"
    wget -q -O - https://antares-sql.github.io/antares-ppa/key.gpg -O- | apt-key add -
    nala update
    nala install -y antares
fi
#DWService
if [ "$DWSERVICE" = "y" ]; then
    wget -cO - https://node213098.dwservice.net/getAgentFile.dw?name=dwagent.sh >dwagent.sh
    chmod +x dwagent.sh && sh dwagent.sh
    rm -R ./dwagent.sh
fi
#Software DEB
if [ "$SOFTWAREDEB" = "y" ]; then
    nala install -y gnome-software
else
    nala install -y deepin-deb-installer
    nala install -y gnome-package-updater
fi
#Limpeza no apt
nala autoremove -y
apt autoclean
nala clean
#Reinicia o sistema
read -r -p "Instalação concluida! Seu pc precisa ser reiniciad! [Enter] " REBOOT
reboot