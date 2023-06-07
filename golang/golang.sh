#!/bin/bash 

install_dir=/opt/os-tools/golang
cd $install_dir
wget https://go.dev/dl/go1.20.5.linux-amd64.tar.gz -O $install_dir/go1.20.5.linux-amd64.tar.gz
rm -rf /usr/bin/go 
tar -C $install_dir -xzf $install_dir/go1.20.5.linux-amd64.tar.gz
ln -sf $install_dir/go/bin/go /usr/bin/go
go version
rm -rf $install_dir/go1.20.5.linux-amd64.tar.gz

