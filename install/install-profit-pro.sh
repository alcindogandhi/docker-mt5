#!/bin/sh
#
# Script de instalação do Profit Pro via Wine
#
# Autor: Alcindo Gandhi
# Data:  29/07/2022
#

URL="https://www.nelogica.com.br/produtos/bin/profitchart/Profit.exe"
SETUP="profit.exe"
PREFIX=".profit"

wget $URL -O $SETUP

# Set environment to Windows 10
WINEPREFIX=~/$PREFIX winecfg -v=win10
WINEPREFIX=~/$PREFIX wine $SETUP
rm -f $SETUP ~/Desktop/*.lnk
