#!/bin/sh
#Atualizar sistema
nala update && nala upgrade -y
#Otimizar bateria do notebook
nala install -y tlp
#Programas de Escritório
#Programas de Gráficos
nala install -y inkscape
nala install -y gimp
#Programas de Internet
nala install -y firefox-esr qbittorrent thunar-dropbox-plugin
nala install -y chromium
nala install -y chromium-l10n
#Programas de Multimídia
nala install -y clementine
#Chrome
bash -c "echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' >> /etc/apt/sources.list.d/google-chrome.list"
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub -O- | apt-key add -
#Edge e VSCode
bash -c "echo 'deb https://packages.microsoft.com/repos/edge stable main' >> /etc/apt/sources.list.d/microsoft-edge.list"
bash -c "echo 'deb https://packages.microsoft.com/repos/vscode stable main' >> /etc/apt/sources.list.d/microsoft-vscode.list"
wget -q -O - https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
#AnyDesk
bash -c "echo deb 'http://deb.anydesk.com/ all main' >> /etc/apt/sources.list.d/anydesk-stable.list"
wget -q -O - https://keys.anydesk.com/repos/DEB-GPG-KEY -O- | apt-key add -
#TeamViewer
wget -c https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
nala install -y ./teamviewer*.deb
rm -R ./teamviewer*.deb
#OnlyOffice
wget -c https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb
nala install -y ./onlyoffice*.deb
rm -R ./onlyoffice*.deb
nala update
nala install -y google-chrome-stable
nala install -y microsoft-edge-stable
nala install -y code
nala install -y anydesk