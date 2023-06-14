#!/bin/bash

install_dir=/opt/os-tools/nerdfonts
fonts_download_url=https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip
filename=Hack.zip

# Install Specific Fonts
cd $install_dir
wget $fonts_download_url -O $install_dir/$filename
unzip $filename -d ~/.local/share/fonts/
