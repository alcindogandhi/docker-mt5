#!/bin/sh
#
# Script de execução do container do MetaTrader.
#
# Autor: Alcindo Gandhi
# Data:  29/07/2022
#

SCRIPT=$(readlink -f "$0")
HOME=$(dirname "$SCRIPT")/home

x11docker --desktop --clipboard --home=$HOME --network=host mt5 &
