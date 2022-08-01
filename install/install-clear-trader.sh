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

wget $URL -O $SETUP

# Set environment to Windows 10
WINEPREFIX=~/$PREFIX winecfg -v=win10
WINEPREFIX=~/$PREFIX wine $SETUP
rm -f $SETUP ~/Desktop/*.lnk
