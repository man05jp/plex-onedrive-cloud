FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    sudo \
    gnupg \
    apt-transport-https \
    ca-certificates \
    software-properties-common \
    fuse \
    libfuse2 \
    unzip \ 
    && rm -rf /var/lib/apt/lists/*

RUN curl https://rclone.org/install.sh | bash

RUN curl https://downloads.plex.tv/plex-keys/PlexSign.key | apt-key add - && \
    echo "deb https://downloads.plex.tv/repo/deb public main" > /etc/apt/sources.list.d/plexmediaserver.list && \
    apt-get update && apt-get install -y plexmediaserver

RUN mkdir /mnt/onedrive
RUN groupadd fuse || true
RUN usermod -aG fuse root

EXPOSE 32400

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
