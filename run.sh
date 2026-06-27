#!/bin/sh
#
# Script de execução do container do MetaTrader.
#
# Autor: Alcindo Gandhi
# Data:  29/07/2022
#

SCRIPT=$(readlink -f "$0")
HOME=$(dirname "$SCRIPT")/home
DISPLAY_SIZE="1760x990"

x11docker --desktop --clipboard --size $DISPLAY_SIZE --home=$HOME --network=host mt5 &
