#!/bin/sh
#
# Instalação da última versão do Docker no Debian/Ubuntu
#
# Autor: Alcindo Gandhi Barreto Almeida
# Data:  2022-04-15
#

OS_RELEASE="/etc/os-release"
VERSION_CODENAME=$(cat $OS_RELEASE | grep "^VERSION_CODENAME" | cut -d'=' -f2)
UBUNTU_CODENAME=$(cat $OS_RELEASE  | grep "^UBUNTU_CODENAME"  | cut -d'=' -f2)
CODENAME=${1:-$([ -z $UBUNTU_CODENAME ] && echo $VERSION_CODENAME || echo $UBUNTU_CODENAME)}
DISTRO=$([ -z $UBUNTU_CODENAME ] && echo "debian" || echo "ubuntu")

sudo apt-get -y remove docker docker-engine docker.io containerd runc

sudo apt-get -y --no-install-recommends install \
	ca-certificates curl gnupg lsb-release

curl -fsSL "https://download.docker.com/linux/$DISTRO/gpg" \
	| sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) \
signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
https://download.docker.com/linux/$DISTRO \
$CODENAME stable" \
	| sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get -y --no-install-recommends install \
	docker-ce docker-ce-cli containerd.io docker-*-plugin
sudo usermod -aG docker $USER

sudo docker run hello-world

