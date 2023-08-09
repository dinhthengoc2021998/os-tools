#!/bin/bash

###########################
# --- Working Directory ---
###########################
path_scripts=$(readlink -f "$0")
dir_scripts=$(dirname $path_scripts)
echo "#########################################"
echo "Path of Scripts:      => $path_scripts"
echo "Directory of Scripts: => $dir_scripts"
echo "#########################################"

######################
# --- Installation ---
######################
sudo yum install -y ansible

###################
# --- Reference ---
###################
# https://wpcademy.com/how-to-install-ansible-on-centos-7/