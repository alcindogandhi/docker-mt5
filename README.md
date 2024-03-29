# docker-mt5
Scripts para criação de um container Docker para execução do MetaTrader 5 no Linux

## Atenção
As plataformas de negociação que são instaladas neste projeto foram concebidas para a execução no [Microsoft Windows](https://www.microsoft.com/pt-br/windows/). A execução das plataformas no [Linux](https://pt.wikipedia.org/wiki/Linux) via [Wine](https://www.winehq.org/) não oferece a mesma estabilidade e confiabilidade da plataforma nativa, seja rodando em máquina real ou virtual. Nenhuma das desenvolvedoras das plataformas oferece suporte ou garantia para execução no Linux, muito menos este projeto. Use-o por sua própria conta e risco.

## Introdução
Este projeto contém um conjunto de scripts para criação de uma imagem [Docker](https://www.docker.com/) coma interface gráfica [LXDE](http://www.lxde.org/) por meio do [X11Docker](https://github.com/mviereck/x11docker) e o Wine configurado, permitindo a execução no Linux de plataformas de negociação na [B3](https://www.b3.com.br/) feitas para Windows. Atualmente o projeto disponibiliza scripts para a instalação do [Metratrader 5](https://www.metatrader5.com/) e do [Profit Pro](https://www.nelogica.com.br/produtos/profit-pro).

## Instalação e execução
Para a criação das imagens, é necessária a instalação do Docker e do X11Docker no seu sistema Linux.
Em sistemas baseados no [Ubuntu](https://ubuntu.com/), a instalação pode ser feita por meio dos seguintes scripts:
```bash
sudo sh install-docker-ubuntu.sh
sudo sh install-x11docker.sh
```
Após instaladas as dependências, para se criar a imagem do container, basta executar o seguinte comando:
```bash
sh build.sh
```
Além de criar a imagem, o script acima cria o atalho _Trader_ no sistema para a execução do container
Também é possível executá-lo por meio do script run.sh:
```bash
sh run.sh
```
Ao executar o container, aparecerá uma janela com o ambiente LXDE limpo, semelhante a uma máquina virtual.
Na pasta _install_, dentro da pasta do usuário, ficam os scripts de instalação das plataformas de negociação, um para cada plataforma. Esses scripts efetuam o download do instalador e o executa.

Assim, para a instalação do Metatrader 5, abra um terminal dentro do container e execute os seguintes comandos:
```bash
cd ~/install
sh install-mt5.sh
```
Para a instalação do Profit Pro é só executar os comandos:
```bash
cd ~/install
sh install-profit-pro.sh
```
Após a instalação, são criados ícones na área de trabalho do container para a execução das plataformas.

## Bugs conhecidos

### - Metatrader 5
- Para logar na [Comunidade MQL5](https://www.mql5.com/) e poder baixar robôs e indicadores disponíveis na comunidade, utilize como login o endereço de email cadastrado ao invés do *username*.
- O copiar e colar não funciona na tela normal de login na cominidade, mas funciona indo em *Tools → Options → Community*.

### - Profit Pro
- Para efetuar uma venda no Chart Trading, use _Ctrl+Alt_ ao invés de _Alt_ para selecionar o preço
- Erro na atualização da plataforma por dentro do Profit. Para atualizá-lo, execute novamente o script de instalação e selecione a opção _reparar_.
