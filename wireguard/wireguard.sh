#!/bin/bash

# Install Lib
apt update -y 
apt install -y wireguard resolvconf

# Setup Default Config
cd /etc/wireguard/
umask 077
wg genkey | tee server_private_key | wg pubkey > server_public_key

# Write to file the config to connect
# vi /etc/wireguard/wg0.conf 

# Execute
# sudo wg-quick up wg0
# sudo systemctl enable wg-quick@wg0