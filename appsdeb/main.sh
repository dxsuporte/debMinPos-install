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
if [ "$NODEJS" = "y" ]; then
    read -r -p "Qual Versão do Node JS? [16|18|20] " NODEVERSION
fi
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
    add-apt-repository -y "deb https://packages.microsoft.com/repos/edge stable main"
    wget -q -O - https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
    $PRG update
    $PRG install -y microsoft-edge-stable
fi
#Google Chrome
if [ "$CHROME" = "y" ]; then
    add-apt-repository -y "deb http://dl.google.com/linux/chrome/deb/ stable main"
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub -O- | apt-key add -
    $PRG update
    $PRG install -y google-chrome-stable
fi
#MegaSync
if [ "$MEGASYNC" = "y" ]; then
    wget -c https://mega.nz/linux/repo/Debian_"$RELEASE"/amd64/megasync-Debian_"$RELEASE"_amd64.deb
    $PRG install -y ./megasync*.deb
    rm -f -r ./megasync*.deb
    #XFCE
    if [ $XDG_CURRENT_DESKTOP = XFCE ]; then
        wget -c https://mega.nz/linux/repo/Debian_"$RELEASE"/amd64/thunar-megasync-Debian_"$RELEASE"_amd64.deb
        $PRG install -y ./thunar*.deb
        rm -f -r ./thunar*.deb
    fi
fi
#TeamViewer
if [ "$TEAMVIEWER" = "y" ]; then
    wget -c https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
    $PRG install -y ./teamviewer*.deb
    rm -f -r ./teamviewer*.deb
fi
#AnyDesk
if [ "$ANYDESK" = "y" ]; then
    add-apt-repository -y "deb http://deb.anydesk.com/ all main"
    wget -q -O - https://keys.anydesk.com/repos/DEB-GPG-KEY -O- | apt-key add -
    $PRG update
    $PRG install -y anydesk
fi
#VSCode
if [ "$VSCODE" = "y" ]; then
    add-apt-repository -y "deb https://packages.microsoft.com/repos/vscode stable main"
    wget -q -O - https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
    $PRG update
    $PRG install -y code
fi
#VSCodium
if [ "$VSCODIUM" = "y" ]; then
    wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor -o /etc/apt/keyrings/vscodium-archive-keyring.gpg
    echo 'deb [ signed-by=/etc/apt/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' | tee /etc/apt/sources.list.d/vscodium.list
    $PRG update
    $PRG install -y codium
fi
#Node JS
if [ "$NODEJS" = "y" ]; then
    wget -qO - https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODEVERSION.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
    $PRG update
    $PRG install -y nodejs
fi
#Antares SQL
if [ "$ANTARESSQL" = "y" ]; then
    add-apt-repository -y "deb https://antares-sql.github.io/antares-ppa ./"
    wget -q -O - https://antares-sql.github.io/antares-ppa/key.gpg -O- | apt-key add -
    $PRG update
    $PRG install -y antares
fi
#DWService
if [ "$DWSERVICE" = "y" ]; then
    wget -cO - https://node213098.dwservice.net/getAgentFile.dw?name=dwagent.sh >dwagent.sh
    chmod +x dwagent.sh && sh dwagent.sh
    rm -f -r ./dwagent.sh
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
