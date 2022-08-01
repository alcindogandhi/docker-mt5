#!/bin/sh
#
# Script de instalação do MetaTrader 5 via Wine
#
# Autor: Alcindo Gandhi
# Data:  29/07/2022
#

URL="https://download.mql5.com/cdn/web/metaquotes.software.corp/mt5/mt5setup.exe"
SETUP="mt5setup.exe"
PREFIX=".mt5"

wget $URL -O $SETUP

# Set environment to Windows 10
WINEPREFIX=~/$PREFIX winecfg -v=win10
WINEPREFIX=~/$PREFIX wine $SETUP
rm -f $SETUP ~/Desktop/*.lnk
