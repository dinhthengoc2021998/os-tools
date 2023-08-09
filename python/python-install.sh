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
# --- Download ---
######################
yum install gcc openssl-devel bzip2-devel libffi-devel -y
curl https://www.python.org/ftp/python/3.10.0/Python-3.10.0.tgz --output $dir_scripts/Python-3.10.0.tgz
tar -xzf $dir_scripts/Python-3.10.0.tgz -C $dir_scripts

######################
# --- Installation ---
######################
cd $dir_scripts/Python-3.10.0
sh configure --enable-optimizations
make altinstall

################################
# --- Clean Garbage ---
# --- Create Symbol Link ---
################################
rm -rf $dir_scripts/Python-3.10.0.tgz $dir_scripts/Python-3.10.0
ln -sf $(which python3.10) /usr/local/bin/python3

###################
# --- Reference ---
###################
# https://www.liquidweb.com/kb/how-to-install-python-3-on-centos-7/