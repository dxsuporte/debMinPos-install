#!/bin/sh
#Stop the script if any command fails. || #Interromper o script se algum comando falhar.
set -e
#Versão do Debian
[ $(lsb_release -rs) = "n/a" ] && { RELEASE="testing" || RELEASE=$(lsb_release -rs); }
#Adicionar Repositorio Debian oldstable
add-apt-repository -y "deb http://deb.debian.org/debian/ oldstable main contrib non-free"
#Atualizar sistema
nala update && nala upgrade -y
#Otimizar bateria do notebook
#nala install -y tlp
#nala install -y cheese
############################################################
read -r -p "Instalar a loja de Software? [y/N] " SOFTWAREDEB
read -r -p "Instalar o Inkscape? [y/N] " INKSCAPE
read -r -p "Instalar o GIMP? [y/N] " GIMP
read -r -p "Instalar o Player de Música Clementine? [y/N] " CLEMENTINE
read -r -p "Instalar o VLC Media Player? [y/N] " VLC
read -r -p "Instalar o LibreOffice? [y/N] " LIBREOFFICE
read -r -p "Instalar o OnlyOffice? [y/N] " ONLYOFFICE
read -r -p "Instalar o Microsoft Edge? [y/N] " EDGE
read -r -p "Instalar o Google Chrome? [y/N] " CHROME
read -r -p "Instalar o Chromium Browser? [y/N] " CHROMIUM
read -r -p "Instalar o DropBox? [y/N] " DROPBOX
read -r -p "Instalar o MegaSync? [y/N] " MEGASYNC
read -r -p "Instalar o NextCloud? [y/N] " NEXTCLOUD
read -r -p "Instalar o acesso remoto TeamViewer? [y/N] " TEAMVIEWER
read -r -p "Instalar o acesso remoto AnyDesk? [y/N] " ANYDESK
read -r -p "Instalar o VSCode? [y/N] " VSCODE
read -r -p "Instalar o VSCodium? [y/N] " VSCODIUM
read -r -p "Instalar o Node JS? [y/N] " NODEJS
read -r -p "Instalar o SQLite? [y/N] " SQLITE
read -r -p "Instalar o Antares SQL? [y/N] " ANTARESSQL
read -r -p "Instalar o DWService? [y/N] " DWSERVICE
############################################################
#Software DEB
if [[ "$SOFTWAREDEB" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    nala install -y gnome-software
else
    nala install -y deepin-deb-installer
fi
#Inkscape
if [[ "$INKSCAPE" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    nala install -y inkscape
fi
#GIMP
if [[ "$GIMP" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    nala install -y gimp
fi
#Player de Música Clementine
if [[ "$CLEMENTINE" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    nala install -y clementine
fi
#VLC Media Player
if [[ "$VLC" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    nala install -y vlc
fi
#LibreOffice
if [[ "$LIBREOFFICE" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    nala install -y --no-install-recommends libreoffice-writer
    nala install -y --no-install-recommends libreoffice-calc
    nala install -y --no-install-recommends libreoffice-draw
    nala install -y libreoffice-style-elementary
    nala install -y libreoffice-gtk3
    nala install -y libreoffice-l10n-pt-br
    wget -c https://pt-br.libreoffice.org/assets/Uploads/PT-BR-Documents/VERO/VeroptBR3215AOC.oxt
    unopkg add --shared VeroptBR3215AOC.oxt
    cp -f libreoffice/* /etc/libreoffice/registry/
fi
#OnlyOffice
if [[ "$ONLYOFFICE" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    wget -c https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb
    nala install -y ./onlyoffice*.deb
    rm -R ./onlyoffice*.deb
fi
#Microsoft Edge
if [[ "$EDGE" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    add-apt-repository -y "deb https://packages.microsoft.com/repos/edge stable main"
    wget -q -O - https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
    nala update
    nala install -y microsoft-edge-stable
fi
#Google Chrome
if [[ "$CHROME" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    add-apt-repository -y "deb http://dl.google.com/linux/chrome/deb/ stable main"
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub -O- | apt-key add -
    nala update
    nala install -y google-chrome-stable
fi
#Chromium Browser
if [[ "$CHROMIUM" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    nala install -y chromium
    nala install -y chromium-l10n
fi
#DropBox
if [[ "$DROPBOX" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    nala install -y thunar-dropbox-plugin
fi
#MegaSync
if [[ "$MEGASYNC" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    wget -c https://mega.nz/linux/repo/Debian_"$RELEASE"/amd64/megasync-Debian_"$RELEASE"_amd64.deb
    wget -c https://mega.nz/linux/repo/Debian_"$RELEASE"/amd64/thunar-megasync-Debian_"$RELEASE"_amd64.deb
    nala install -y ./megasync*.deb
    nala install -y ./thunar*.deb
    rm -R ./megasync*.deb
    rm -R ./thunar*.deb
fi
#NextCloud
if [[ "$NEXTCLOUD" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    nala install -y nextcloud-desktop
fi
#TeamViewer
if [[ "$TEAMVIEWER" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    wget -c https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
    nala install -y ./teamviewer*.deb
    rm -R ./teamviewer*.deb
fi
#AnyDesk
if [[ "$ANYDESK" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    add-apt-repository -y "deb http://deb.anydesk.com/ all main"
    wget -q -O - https://keys.anydesk.com/repos/DEB-GPG-KEY -O- | apt-key add -
    nala update
    nala install -y anydesk
fi
#VSCode
if [[ "$VSCODE" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    add-apt-repository -y "deb https://packages.microsoft.com/repos/vscode stable main"
    wget -q -O - https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
    nala update
    nala install -y code
fi
#VSCodium
if [[ "$VSCODIUM" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor -o /etc/apt/keyrings/vscodium-archive-keyring.gpg
    echo 'deb [ signed-by=/etc/apt/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' | tee /etc/apt/sources.list.d/vscodium.list
    nala update
    nala install -y codium
fi
#Node JS
if [[ "$NODEJS" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    wget -qO - https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
    NODE_MAJOR=20
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
    nala update
    nala install -y nodejs
fi
#SQLite
if [[ "$SQLITE" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    nala install -y sqlite3
    nala install -y sqlitebrowser
fi
#Antares SQL
if [[ "$ANTARESSQL" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    add-apt-repository -y "deb https://antares-sql.github.io/antares-ppa ./"
    wget -q -O - https://antares-sql.github.io/antares-ppa/key.gpg -O- | apt-key add -
    nala update
    nala install -y antares
fi
#DWService
if [[ "$DWSERVICE" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    wget -cO - https://node213098.dwservice.net/getAgentFile.dw?name=dwagent.sh >dwagent.sh
    chmod +x dwagent.sh && sh dwagent.sh
    rm -R ./dwagent.sh
fi
#Limpeza no apt
nala autoremove -y
apt autoclean
nala clean
#Reinicia o sistema
reboot
