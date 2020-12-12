FROM ubuntu:18.04

# Install prerequisites (later add vim and net utils)
RUN  dpkg --add-architecture i386 \
  && apt update \
  && apt install -y curl vim iputils-ping traceroute lib32gcc1 \
  && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /steam/install /steam/csgo

# Install steamcmd
WORKDIR /steam/install
RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxf -
RUN chmod +x /steam/install/linux32/steamcmd
WORKDIR /steam

# Copy scripts
COPY --chown=1000 entry.sh /steam/entry.sh
RUN chmod +x /steam/entry.sh

COPY csgo_install /steam/csgo_install

# TODO: copy maps and config into container

# Install csgo
RUN /steam/install/steamcmd.sh +runscript /steam/csgo_install

EXPOSE 27015/udp

# Switch user and start csgo
RUN chown -R 1000 /steam
USER 1000
CMD ["/steam/entry.sh"]
#CMD ["/bin/bash"]
