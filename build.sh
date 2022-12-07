#!/bin/sh
#
# Script de construção da imagem do container do MetaTrader
#
# Autor: Alcindo Gandhi
# Data: 29/07/2022
#

SCRIPT=$(readlink -f "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")

# Construindo a imagem do sistema
docker build -t mt5 .
tar -xJf home.tar.xz
cp -R install home/

# Atalho para execução do container
cat <<EOF >$HOME/.local/share/applications/trader.desktop
[Desktop Entry]
Version=8
Name=Trader
Exec=sh $SCRIPT_PATH/run.sh
Terminal=false
Icon=$SCRIPT_PATH/img/trader.png
Type=Application
Categories=Office;
GenericName=Trader
StartupWMClass=Xephyr
EOF
