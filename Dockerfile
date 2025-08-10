FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    gnupg \
    ca-certificates \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Install rclone
RUN curl https://rclone.org/install.sh | bash

# Install Plex
RUN curl https://downloads.plex.tv/plex-keys/PlexSign.key | gpg --dearmor -o /usr/share/keyrings/plex.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/plex.gpg] https://downloads.plex.tv/repo/deb public main" \
    > /etc/apt/sources.list.d/plexmediaserver.list && \
    apt-get update && apt-get install -y plexmediaserver

# Plex default port
EXPOSE 32400

# rclone serve port
EXPOSE 8080

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
