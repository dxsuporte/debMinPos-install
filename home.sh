#!/bin/sh
#Atualizar sistema
nala update && nala upgrade -y
#Otimizar bateria do notebook
nala install -y tlp
#Programas de Acessórios
nala install -y galculator
#Programas de Escritório
nala install -y atril
#Programas de Gráficos
nala install -y inkscape gimp
#Programas de Internet
nala install -y firefox-esr qbittorrent thunar-dropbox-plugin
#Programas de Multimídia
nala install -y parole clementine
#Chrome
bash -c "echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' >> /etc/apt/sources.list.d/google-chrome.list"
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub -O- | apt-key add -
#Edge e VSCode
bash -c "echo 'deb https://packages.microsoft.com/repos/edge stable main' >> /etc/apt/sources.list.d/microsoft-edge.list"
bash -c "echo 'deb https://packages.microsoft.com/repos/vscode stable main' >> /etc/apt/sources.list.d/microsoft-vscode.list"
wget -q -O - https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
#OnlyOffice
bash -c "echo deb 'https://download.onlyoffice.com/repo/debian squeeze main' >> /etc/apt/sources.list.d/onlyoffice.list"
wget -q -O - http://download.onlyoffice.com/repo/onlyoffice.key -O- | apt-key add -
#AnyDesk
bash -c "echo deb 'http://deb.anydesk.com/ all main' >> /etc/apt/sources.list.d/anydesk-stable.list"
wget -q -O - https://keys.anydesk.com/repos/DEB-GPG-KEY -O- | apt-key add -
#TeamViewer
bash -c "echo 'deb http://linux.teamviewer.com/deb stable main' >> /etc/apt/sources.list.d/teamviewer.list"
wget -q -O - https://download.teamviewer.com/download/linux/signature/TeamViewer2017.asc -O- | apt-key add -
nala update
nala install -y google-chrome-stable
nala install -y microsoft-edge-stable
nala install -y code
nala install -y anydesk
nala install -y teamview
