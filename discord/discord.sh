#!/bin/bash

install_dir=/opt/os-tools/discord
wget "https://discord.com/api/download?platform=linux&format=deb" -O $install_dir/discord.deb
sudo apt install -y $install_dir/discord.deb
rm -rf $install_dir/discord.deb
