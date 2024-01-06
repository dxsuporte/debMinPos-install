#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
#Verifica se o arquivo está dentro da pasta principal.
if [ -e ./xampp-linux*.run ]; then
    #Permissão de execução como programa.
    chmod +x xampp-linux*.run
    #Executa o instalador Xampp.
    ./xampp-linux*.run
    #Copiá o script de configuração da permissão pkexec.
    cp -f config/org.apachefriends.xampp-control-panel.policy /usr/share/polkit-1/actions/
    #Copiá o script de execução pelo terminal.
    cp -f config/xampp-control-panel /usr/bin/
    #Copiá a script do ícone para o menu.
    cp -f config/xampp-control-panel.desktop /usr/share/applications/
    #Copiá a imagem do ícone para o menu.
    cp -f config/xampp.svg /usr/share/icons/
    #Copiá o script de configuração do systemd.
    cp -f config/xampp.service /etc/systemd/system/
    #Habilita o script no systemd para iniciar no boot.
    systemctl enable xampp.service
    #Mensagem para o usuário.
    echo "Foi instalado com sucesso"

else
    #Mensagem para o usuário.
    echo "Erro ao instalar o XAMPP! O XAMPP deve ser baixado e colocado dentro da pasta principal do instalador."
fi
