#!/bin/bash
################
# --- Config ---
################
install_dir=/opt/os-tools/utils

#################
# --- Network ---
#################
sudo yum install -y epel-release
sudo yum install -y telnet
# --- htop ---
sudo yum install -y htop
mkdir -p /root/.config/htop
touch /root/.config/htop/htoprc
cat $install_dir/htoprc >> ~/.config/htop/htoprc

####################
# --- Management ---
####################
sudo yum install -y tree