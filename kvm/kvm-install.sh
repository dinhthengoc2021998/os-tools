#!/bin/bash

####################
# --- Update Apt ---
####################
sudo apt update

############################################
# --- Check if Virtualization is enabled ---
############################################
egrep -c '(vmx|svm)' /proc/cpuinfo

###################################################
# --- Install command "kvm" through cpu-checker ---
###################################################
sudo apt install -y cpu-checker
kvm-ok

#####################################
# --- Install KVM on Ubuntu 22.04 ---
#####################################
sudo apt-get install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager netplan.io

#####################################################
# --- Enable the virtualization daemon (libvirtd) ---
#####################################################
sudo systemctl enable --now libvirtd
sudo systemctl start libvirtd

#####################################
# --- Create Network Bridge (br0) ---
#####################################
tee /etc/netplan/01-netcfg.yaml <<EOF
network:
  ethernets:
    enp0s3:
      dhcp4: false
      dhcp6: false
  # add configuration for bridge interface
  bridges:
    br0:
      interfaces: [enp0s3]
      dhcp4: false
      addresses: [192.168.1.162/24]
      macaddress: 08:00:27:4b:1d:45
      routes:
        - to: default
          via: 192.168.1.1
          metric: 100
      nameservers:
        addresses: [4.2.2.2]
      parameters:
        stp: false
      dhcp6: false
  version: 2
EOF
sudo netplan apply
ip add show

