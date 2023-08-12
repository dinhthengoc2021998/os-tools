#!/bin/bash

yum -y install qemu-kvm libvirt virt-install bridge-utils
lsmod | grep kvm
systemctl enable libvirtd
systemctl start libvirtd

yum install -y NetworkManager
systemctl enable NetworkManager
systemctl start NetworkManager

# add bridge "br0"
nmcli connection add type bridge autoconnect yes con-name br0 ifname br0
# Connection 'br0' (0f4b7bc8-8c7a-461a-bff1-d516b941a6ec) successfully added.
# set IP for br0
nmcli connection modify br0 ipv4.addresses 10.0.0.30/24 ipv4.method manual
# set Gateway for br0
nmcli connection modify br0 ipv4.gateway 10.0.0.1
# set DNS for "br0"
nmcli connection modify br0 ipv4.dns 10.0.0.1
# remove the current setting
nmcli connection delete eth0
# add an interface again as a member of br0
nmcli connection add type bridge-slave autoconnect yes con-name eth0 ifname eth0 master br0
# restart
# reboot
ip addr

wget http://mirrors.vhost.vn/centos/7.9.2009/isos/x86_64/CentOS-7-x86_64-Minimal-2009.iso \ 
  -O /opt/os-tools/kvm/CentOS-7-x86_64-Minimal-2009.iso
chmod 755 /opt/os-tools/kvm/CentOS-7-x86_64-Minimal-2009.iso

mkdir -p /var/kvm/images     # create a new Storage Pool
mkdir -p /dev/net
mknod /dev/net/tun c 10 200
chmod 600 /dev/net/tun

virt-install \
  --name centos7 \
  --ram 1024 \
  --disk path=/var/kvm/images/centos7.img,size=3 \
  --vcpus 1 \
  --os-type linux \
  --os-variant centos7.0 \
  --network bridge=br0 \
  --graphics none \
  --console pty,target_type=serial \
  --location '/opt/os-tools/kvm/CentOS-7-x86_64-Minimal-2009.iso' \
  --extra-args 'console=ttyS0,115200n8 serial'
