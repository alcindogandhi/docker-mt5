FROM x11docker/lxde

MAINTAINER Alcindo Gandhi

ENV DEBIAN_FRONTEND=noninteractive

COPY sources.list /etc/apt/sources.list

RUN dpkg --add-architecture i386 && \
	apt-get update && \
	apt-get -y dist-upgrade

RUN echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections && \
	apt-get install -y --no-install-recommends fontconfig ttf-mscorefonts-installer && \
	fc-cache -f -v && \
    apt-get -y install sudo wget curl nano vim ca-certificates scite && \
    apt-get -y install --install-recommends wine wine32 wine64 && \
    mkdir /usr/share/wine/mono /usr/share/wine/gecko && \
	wget -O - https://dl.winehq.org/wine/wine-mono/4.9.4/wine-mono-bin-4.9.4.tar.gz | sudo tar -xzv -C /usr/share/wine/mono && \
	wget -O /usr/share/wine/gecko/wine-gecko-2.47.1-x86.msi https://dl.winehq.org/wine/wine-gecko/2.47.1/wine-gecko-2.47.1-x86.msi && \
	wget -O /usr/share/wine/gecko/wine-gecko-2.47.1-x86_64.msi https://dl.winehq.org/wine/wine-gecko/2.47.1/wine-gecko-2.47.1-x86_64.msi

#CMD ["startlxde"]
