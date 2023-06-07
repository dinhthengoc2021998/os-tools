#!/bin/bash

install_dir=/opt/os-tools/speedtest

cd $install_dir
sudo apt-get install curl
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
sudo apt-get install speedtest

