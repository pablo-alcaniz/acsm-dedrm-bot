#!/bin/bash
 
# Install plugins on first run (when /config is the persistent volume)
if [ ! -f /config/.plugins_installed ]; then
    echo "[acsm-bot] Installing Calibre plugins..."
    calibre-customize -a /plugins/DeACSM.zip
    calibre-customize -a /plugins/DeDRM_plugin.zip
    touch /config/.plugins_installed
    echo "[acsm-bot] Plugins installed."
else
    echo "[acsm-bot] Plugins already installed, skipping."
fi
 
# Run the original linuxserver entrypoint
exec /init
