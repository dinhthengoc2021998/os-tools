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
sudo curl -L https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 -O $dir_scripts/minikube-linux-amd64
sudo install $dir_scripts/minikube-linux-amd64 /usr/local/bin/minikube
sudo rm -rf $dir_scripts/minikube-linux-amd64

############################
# --- Add User minikube ---
# --- User := minikube ---
# --- Pass := minikube ---
# --- Group:= docker ---
############################
sudo adduser minikube
sudo passwd minikube
sudo usermod -aG docker minikube

######################################
# --- Edit bashrc of user minikube ---
######################################
sudo tee -a /home/minikube/.bashrc << EOF
alias kubectl="minikube kubectl --"
EOF

########################
# --- Minikube Start ---
########################
# su - minikube
# minikube start --driver=docker 
