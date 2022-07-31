#!/bin/sh
#
# Script de instalação do Clear Trader via Wine
#
# Autor: Alcindo Gandhi
# Data:  31/07/2022
#

URL="https://www.nelogica.com.br/produtos/bin/profitchart/ClearTrader.exe"
SETUP="clearTrader.exe"
wget $URL -O $SETUP

# Set environment to Windows 10
WINEPREFIX=~/.wine winecfg -v=win10
# Start MetaTrader installer
/usr/bin/wine /usr/lib/wine/explorer.exe
WINEPREFIX=~/.wine wine $SETUP

rm -f $SETUP
rm ~/Desktop/*.lnk
