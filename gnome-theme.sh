#!/bin/sh
#Interromper o script se algum comando falhar.
set -e
read -r -p "Aplicativos gnome no modo dark? [y|n] " GNOMEDARK
#GNOMEDARK
if [ "$SYNAPTIC" = "y" ]; then
    gsettings set org.gnome.desktop.interface color-scheme prefer-dark
else
    gsettings set org.gnome.desktop.interface color-scheme default
fi