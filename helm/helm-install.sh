#!/bin/bash

####################################
# --- Config Install Helm for K8s---
####################################
install_dir="/opt/os-tools/helm"
helm_version=3.12.0

#############################
# --- Install Helm for K8s---
#############################
wget https://get.helm.sh/helm-v$helm_version-linux-amd64.tar.gz && \
tar xvf helm-v$helm_version-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin
rm helm-v$helm_version-linux-amd64.tar.gz && \
rm -rf linux-amd64

#############################
# --- Recheck Helm for K8s---
#############################
helm version
