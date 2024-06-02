#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#Verifica se o arquivo está dentro da pasta principal.
if [ -e ./xampp-linux*.run ]; then
    chmod +x xampp-linux*.run
    sh xampp-linux*.run
else
    RELEASE=$(curl -s https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/ | grep -m1 "net.sf.files" | cut -d '"' -f 2)
    wget -c https://sinalbr.dl.sourceforge.net/project/xampp/XAMPP%20Linux/"$RELEASE"/xampp-linux-x64-"$RELEASE"-0-installer.run -O /tmp/xampp-linux-x64-installer.run
    chmod +x /tmp/xampp-linux-x64-installer.run
    sh /tmp/xampp-linux-x64-installer.run
fi
#Copiá o script de configuração da permissão pkexec.
cp -f config/xampp/org.apachefriends.xampp-control-panel.policy /usr/share/polkit-1/actions/
#Copiá o script de execução pelo terminal.
cp -f config/xampp/xampp-control-panel /usr/bin/
#Copiá a script do ícone para o menu.
cp -f config/xampp/xampp-control-panel.desktop /usr/share/applications/
#Copiá a imagem do ícone para o menu.
cp -f config/xampp/xampp.svg /usr/share/icons/
#Copiá o script de configuração do systemd.
cp -f config/xampp/xampp.service /etc/systemd/system/
#Habilita o script no systemd para iniciar no boot.
systemctl enable xampp.service
