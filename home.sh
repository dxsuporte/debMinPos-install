#!/bin/sh
#Stop the script if any command fails. || #Interromper o script se algum comando falhar.
set -e
#Versão do Debian
[ $(lsb_release -rs) = "n/a" ] && { RELEASE="testing" || RELEASE=$(lsb_release -rs); }
#Atualizar sistema
add-apt-repository -y "deb http://deb.debian.org/debian/ oldstable main contrib non-free"
nala update && nala upgrade -y
#Otimizar bateria do notebook
nala install -y tlp
nala install -y cheese
#Programas de Escritório
#nala install -y libreoffice
#nala install -y libreoffice-l10n-pt-br
#nala install -y libreoffice-gtk3
#Programas de Gráficos
nala install -y inkscape
nala install -y gimp
#Programas de Internet
nala install -y firefox-esr
nala install -y qbittorrent
nala install -y thunar-dropbox-plugin
nala install -y chromium
nala install -y chromium-l10n
nala install -y sqlite3
nala install -y sqlitebrowser
nala install -y gnome-software
nala install -y nextcloud-desktop
#Programas de Multimídia
nala install -y clementine
nala install -y vlc
#Mega
wget -c https://mega.nz/linux/repo/Debian_"$RELEASE"/amd64/megasync-Debian_"$RELEASE"_amd64.deb
wget -c https://mega.nz/linux/repo/Debian_"$RELEASE"/amd64/thunar-megasync-Debian_"$RELEASE"_amd64.deb
nala install -y ./megasync*.deb
nala install -y ./thunar*.deb
rm -R ./megasync*.deb
rm -R ./thunar*.deb
#OnlyOffice
wget -c https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb
nala install -y ./onlyoffice*.deb
rm -R ./onlyoffice*.deb
#TeamViewer
wget -c https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
nala install -y ./teamviewer*.deb
rm -R ./teamviewer*.deb
#AnyDesk
add-apt-repository -y "deb http://deb.anydesk.com/ all main"
wget -q -O - https://keys.anydesk.com/repos/DEB-GPG-KEY -O- | apt-key add -
nala update
nala install -y anydesk
#Antares SQL
add-apt-repository -y "deb https://antares-sql.github.io/antares-ppa ./"
wget -q -O - https://antares-sql.github.io/antares-ppa/key.gpg -O- | apt-key add -
nala update
nala install -y antares
#Edge e VSCode
add-apt-repository -y "deb https://packages.microsoft.com/repos/edge stable main"
add-apt-repository -y "deb https://packages.microsoft.com/repos/vscode stable main"
wget -q -O - https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
nala update
nala install -y microsoft-edge-stable
nala install -y code
#Chrome
add-apt-repository -y "deb http://dl.google.com/linux/chrome/deb/ stable main"
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub -O- | apt-key add -
nala update
nala install -y google-chrome-stable
#VSCodium
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor -o /etc/apt/keyrings/vscodium-archive-keyring.gpg
echo 'deb [ signed-by=/etc/apt/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' | tee /etc/apt/sources.list.d/vscodium.list
nala update
nala install -y codium
#Node JS
wget -qO - https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
nala update
nala install -y nodejs
#
nala autoremove -y && apt autoclean && nala clean







