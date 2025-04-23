#!/bin/sh

# DNS-based adblock script for DD-WRT + Entware
# Author: Chr0nicHacker

ADBLOCK_DIR=/opt/adblock
HOSTS_FILE=$ADBLOCK_DIR/hosts_adblock.txt
URL=https://someonewhocares.org/hosts/zero/hosts

echo "[*] Updating adblock host list..."

mkdir -p $ADBLOCK_DIR
wget -q -O $HOSTS_FILE $URL

if ! grep -q "addn-hosts=$HOSTS_FILE" /tmp/dnsmasq.conf; then
  echo "addn-hosts=$HOSTS_FILE" >> /tmp/dnsmasq.conf
fi

echo "[*] Restarting dnsmasq to apply changes..."
stopservice dnsmasq
startservice dnsmasq

echo "[✓] Adblock list applied successfully."

# Be sure to make this file executable:

chmod +x scripts/adblock-setup.sh
