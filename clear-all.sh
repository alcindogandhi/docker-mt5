#!/bin/sh
#
# Limpeza das imagens Docker criadas
#
# Autor: Alcindo Gandhi
# Data: 29/07/2022
#

docker rm -f $(docker ps -aq) 2>/dev/null
docker rmi -f $(docker images -q) 2>/dev/null
