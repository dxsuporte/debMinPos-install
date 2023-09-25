#!/bin/sh
#Stop the script if any command fails. || #Interromper o script se algum comando falhar. 
set -e
#Permission to execute as a program. || #Permissão de execução como programa.
chmod +x xampp-linux*.run
#Run the Xampp installer. || #Executa o instalador Xampp.
./xampp-linux*.run
#Copy the pkexec permission configuration script. || #Copiá o script de configuração da permissão pkexec.
cp -f org.apachefriends.xampp-control-panel.policy /usr/share/polkit-1/actions/
#Copy the execution script through the terminal. || #Copiá o script de execução pelo terminal.
cp -f xampp-control-panel /usr/bin/
#Copy the icon script to the menu. || #Copiá a script do ícone para o menu.
cp -f xampp-control-panel.desktop /usr/share/applications/
#Copy the icon image to the menu. || #Copiá a imagem do ícone para o menu.
cp -f xampp.svg /usr/share/icons/
#Copy the systemd configuration script. || #Copiá o script de configuração do systemd.
cp -f xampp.service /etc/systemd/system/
#Enables the script in systemd to start at boot. || #Habilita o script no systemd para iniciar no boot.
systemctl enable xampp.service
#Message to the user. || #Mensagem para o usuário.
echo "It was installed successfully"
echo "Foi instalado com sucesso"


