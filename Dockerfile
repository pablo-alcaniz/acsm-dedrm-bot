FROM ubuntu:24.04
 
ENV DEBIAN_FRONTEND=noninteractive
ENV CALIBRE_CONFIG_DIRECTORY=/config
 
# Calibre + dependencias X11 mínimas para GUI via forwarding
RUN apt-get update && apt-get install -y \
    calibre \
    xauth \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*
 
# Instalar plugins
COPY plugins/DeACSM_0.0.16.zip /tmp/DeACSM.zip
COPY plugins/DeDRM_plugin.zip /tmp/DeDRM_plugin.zip
 
RUN calibre-customize -a /tmp/DeACSM.zip && \
    calibre-customize -a /tmp/DeDRM_plugin.zip && \
    rm /tmp/DeACSM.zip /tmp/DeDRM_plugin.zip
 
VOLUME ["/config", "/output"]
