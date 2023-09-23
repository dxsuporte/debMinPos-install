#!/bin/sh
#Atualizar sistema
add-apt-repository -y "deb http://deb.debian.org/debian/ oldstable main contrib non-free"
nala update && nala upgrade -y
#Otimizar bateria do notebook
nala install -y tlp
#Programas de Escritório
#Programas de Gráficos
nala install -y inkscape
nala install -y gimp
#Programas de Internet
nala install -y firefox-esr
nala install -y qbittorrent
nala install -y thunar-dropbox-plugin
nala install -y chromium
nala install -y chromium-l10n
#Programas de Multimídia
nala install -y clementine
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
apt autoremove -y && apt autoclean && apt clean
