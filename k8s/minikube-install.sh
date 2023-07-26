#!/bin/bash

###########################
# --- Install minikube ---
###########################
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb

#########################
# --- Install kubectl ---
#########################
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm -rf kubectl

########################################################
# --- Add User "minikube" with password = "minikube" ---
# --- Add User to the Docker Group ---
########################################################
# minikube_user=minikube
# minikube_password=minikube
# adduser $minikube_user 
# usermod -aG sudo $minikube_user
# sudo groupadd docker
# sudo usermod -aG docker $minikube_user

############################################
# --- Start a Cluster as "minikube" user ---
############################################
# su - minikube 
# minikube start --driver=docker
