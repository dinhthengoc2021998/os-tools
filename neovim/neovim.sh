#!/bin/bash

install_dir=/opt/install/os-tools/neovim
cd $install_dir

## Install NeoVim >= v9.0.1
# Download appimage
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
# Extract appimage && expose nvim globally
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version
# Optional: exposing nvim globally.
sudo ln -sf $install_dir/squashfs-root/AppRun /usr/bin/nvim

## Install NvChad
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
# Install fonts
fonts_dir=~/.local/share/fonts
mkdir -p $fonts_dir
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/AnonymousPro.zip -O $fonts_dir/AnonymousPro.zip
unzip -oq -d $fonts_dir AnonymousPro.zip 
rm -rf AnonymousPro.zip
