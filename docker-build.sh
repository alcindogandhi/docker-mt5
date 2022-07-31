#!/bin/sh
#
# Script de construção da imagem do container do MetaTrader
#
# Autor: Alcindo Gandhi
# Data: 29/07/2022
#

docker build -t mt5 .
tar -xJf home.tar.xz
cp -R install home/
chmod +x home/install/*.sh
