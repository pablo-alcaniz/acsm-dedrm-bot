FROM lscr.io/linuxserver/calibre:latest

ENV CALIBRE_CONFIG_DIRECTORY=/config

COPY plugins/DeACSM_0.0.16.zip /plugins/DeACSM.zip
COPY plugins/DeDRM_plugin.zip /plugins/DeDRM_plugin.zip
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

VOLUME ["/config", "/output"]

ENTRYPOINT ["/entrypoint.sh"]
