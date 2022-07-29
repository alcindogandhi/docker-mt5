#!/bin/sh
#
# Script de instalação do MetaTrader 5 via Wine
#
# Autor: Alcindo Gandhi
# Data:  29/07/2022
#

URL="https://download.mql5.com/cdn/web/metaquotes.software.corp/mt5/mt5setup.exe"
wget $URL -O mt5setup.exe

# Set environment to Windows 10
WINEPREFIX=~/.mt5 winecfg -v=win10
# Start MetaTrader installer
/usr/bin/wine /usr/lib/wine/explorer.exe
WINEPREFIX=~/.mt5 wine mt5setup.exe

rm mt5setup.exe install-mt.sh
