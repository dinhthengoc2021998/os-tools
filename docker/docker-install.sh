#!/bin/bash

###############################
# --- Install Docker Engine ---
###############################
# --- Uninstall the old version of Docker if exists ---
sudo yum remove docker \
    docker-client \
    docker-client-latest \
    docker-common \
    docker-latest \
    docker-latest-logrotate \
    docker-logrotate \
    docker-engine
# --- Install using the rpm repository ---
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
# --- Install Docker Engine ---
sudo yum install -y docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin

##############################
# --- Start Docker.service ---
##############################
sudo systemctl start docker