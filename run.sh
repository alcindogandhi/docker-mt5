#!/bin/sh
#
# Script de execução do container do MetaTrader.
#
# Autor: Alcindo Gandhi
# Data:  29/07/2022
#

x11docker --clipboard --home=$(pwd)/home --network=host mt5

