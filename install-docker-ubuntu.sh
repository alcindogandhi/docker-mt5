#!/bin/sh
#
# Instalação da última versão do Docker no Ubuntu
#
# Autor: Alcindo Gandhi Barreto Almeida
# Data:  2022-04-15
#

UBUNTU_CODENAME=$(cat /etc/os-release | grep UBUNTU_CODENAME | cut -d'=' -f2)
if [ -z $UBUNTU_CODENAME ]; then
    echo "Erro! Este sistema operacional não é baseado no Ubuntu."
    exit
fi

sudo apt-get -y remove docker docker-engine docker.io containerd runc

sudo apt-get -y --no-install-recommends install \
	ca-certificates curl gnupg lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
	| sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) \
signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
https://download.docker.com/linux/ubuntu $UBUNTU_CODENAME stable" \
	| sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get -y --no-install-recommends install \
	docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER

sudo docker run hello-world
