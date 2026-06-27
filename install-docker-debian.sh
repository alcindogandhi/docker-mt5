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
SCRIPT_USER=${SUDO_USER:-$USER}

# Verifica se o script possui os privilégios necessários
if [ "$(id -u)" != "0" ]; then
   echo "Este script deve ser executado como root." 1>&2
   exit 1
fi

apt-get -y remove docker docker-engine docker.io containerd runc
#if [ $? -ne 0 ]; then
#    echo "Erro! Falha na remoção dos componentes antigos do Docker do sistema." >&2
#	exit 2
#fi

apt-get -y --no-install-recommends install \
	ca-certificates curl gnupg lsb-release
if [ $? -ne 0 ]; then
    echo "Erro! Falha na instalação das dependências para execução do script de instalação do Docker." >&2
	exit 3
fi

curl -fsSL "https://download.docker.com/linux/$DISTRO/gpg" \
	| gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
if [ $? -ne 0 ]; then
    echo "Erro! Falha na instalação da chave do repositório Docker." >&2
	exit 4
fi

echo "deb [arch=$(dpkg --print-architecture) \
signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
https://download.docker.com/linux/$DISTRO \
$CODENAME stable" \
	| tee /etc/apt/sources.list.d/docker.list > /dev/null
if [ $? -ne 0 ]; then
    echo "Erro! Falha na instalação dos novo repositório de pacotes do Docker." >&2
	exit 5
fi

apt-get update
if [ $? -ne 0 ]; then
    echo "Erro! Falha na atualização da lista de pacotes do sistema." >&2
	exit 6
fi

apt-get -y --no-install-recommends install \
	docker-ce docker-ce-cli containerd.io docker-*-plugin
if [ $? -ne 0 ]; then
    echo "Erro! Falha na instalação dos pacotes do Docker." >&2
	exit 7
fi	

usermod -aG docker $SCRIPT_USER
if [ $? -ne 0 ]; then
    echo "Erro! Falha na adição do usuário $SCRIPT_USER no grupo \"docker\"" >&2
	exit 8
fi

docker run hello-world
if [ $? -ne 0 ]; then
    echo "Erro! Falha na execução do container de teste do Docker" >&2
	exit 9
fi

