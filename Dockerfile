FROM x11docker/lxde-wine

LABEL maintainer="Alcindo Gandhi"

ENV DEBIAN_FRONTEND=noninteractive

#COPY sources.list /etc/apt/sources.list

#RUN dpkg --add-architecture i386 && \
#	apt-get update && \
#	apt-get -y dist-upgrade

RUN apt-get update && \
	apt-get -y dist-upgrade && \
	echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections && \
	apt-get install -y --no-install-recommends fontconfig ttf-mscorefonts-installer && \
	fc-cache -f -v && \
    apt-get -y install sudo wget curl nano vim ca-certificates scite
