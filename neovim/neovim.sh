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
./squashfs-root/AppRun --version
# Optional: exposing nvim globally.
sudo ln -sf $install_dir/squashfs-root/AppRun /usr/bin/nvim

## Install for Python Development
# Linux / Macos (unix)
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
# Install NvChad
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

## Install Package for Python Development
apt update
apt upgrade
apt install -Y python3.10-venv
rm -rf $nvim_dir
cp -rf neovim-user-configs/nvim $nvim_dir
