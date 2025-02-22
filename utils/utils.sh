#!/bin/bash

sudo apt update -y 

# NETWORKS
sudo apt install -y traceroute iperf3 nmap iputils-ping telnet \
  net-tools iftop iproute2 tshark tcpdump dnsutils
# This is a software with UI
# sudo apt install -y wireshark

# Basic Utils
sudo apt install -y tree ripgrep fzf python3-venv python3-dev \
  curl wget htop iotop iftop

