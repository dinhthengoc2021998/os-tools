#!/bin/bash

install_dir=/opt/os-tools/neovim
nvim_dir=~/.config/nvim
cd $install_dir

## Install NeoVim >= v9.0.1
# Download appimage
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
# Extract appimage && expose nvim globally
./nvim.appimage --appimage-extract
rm -rf $install_dir/nvim.appimage
./squashfs-root/AppRun --version
rm -rf /var/lib/nvim
mv $install_dir/squashfs-root /var/lib/nvim 

# Optional: exposing nvim globally.
sudo ln -sf /var/lib/nvim/AppRun /usr/bin/nvim

