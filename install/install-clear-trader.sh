#!/bin/sh
#
# Script de instalação do Clear Trader via Wine
#
# Autor: Alcindo Gandhi
# Data:  31/07/2022
#

URL="https://www.nelogica.com.br/produtos/bin/profitchart/ClearTrader.exe"
SETUP="clearTrader.exe"
PREFIX=".clear"
USER_AGENT="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36"

wget -U "$USER_AGENT" "$URL" -O "$SETUP"
if [ $? -ne 0 ]; then
    echo "Erro: não foi possível baixar o instalador do Clear Trader."
    exit 1
fi

# Set environment to Windows 10
WINEPREFIX=~/$PREFIX winecfg -v=win10
WINEPREFIX=~/$PREFIX wine $SETUP
rm -f $SETUP ~/Desktop/*.lnk
