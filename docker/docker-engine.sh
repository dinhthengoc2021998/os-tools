#!/bin/bash

############################
# --- Install Ubuntu Lib ---
############################
apt update -y
apt install -y dpkg-dev

#####################################
# --- Install Docker from package ---
#####################################
app_arch=$(dpkg-architecture -q DEB_BUILD_ARCH)
download_url=https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/$app_arch
containerd=containerd.io_1.6.21-1_amd64.deb
docker_ce=docker-ce_24.0.1-1~ubuntu.22.04~jammy_amd64.deb
docker_ce_cli=docker-ce-cli_24.0.1-1~ubuntu.22.04~jammy_amd64.deb  
docker_compose=docker-compose-plugin_2.18.1-1~ubuntu.22.04~jammy_amd64.deb 
docker_buildx=docker-buildx-plugin_0.10.4-1~ubuntu.22.04~jammy_amd64.deb
prefix_download_dir=/opt/os-tools/docker
#################################
# --- Download all .rpm files ---
#################################
wget $download_url/$containerd --output-document=$prefix_download_dir/$containerd
wget $download_url/$docker_ce --output-document=$prefix_download_dir/$docker_ce
wget $download_url/$docker_ce_cli --output-document=$prefix_download_dir/$docker_ce_cli
wget $download_url/$docker_buildx --output-document=$prefix_download_dir/$docker_buildx
wget $download_url/$docker_compose --output-document=$prefix_download_dir/$docker_compose

#################################
# --- Install all .rpm files ---
#################################
echo $prefix_download_dir/$containerd | xargs sudo dpkg -i
echo $prefix_download_dir/$docker_ce | xargs sudo dpkg -i
echo $prefix_download_dir/$docker_ce_cli | xargs sudo dpkg -i
echo $prefix_download_dir/$docker_buildx | xargs sudo dpkg -i
echo $prefix_download_dir/$docker_compose | xargs sudo dpkg -i

#############################
# --- Create Docker group ---
#############################
sudo groupadd docker
sudo usermod -aG docker root

##############################
# --- Start Service Docker ---
##############################
sudo systemctl start docker  
echo "Status of Docker: $(sudo systemctl status docker | grep Active)"
