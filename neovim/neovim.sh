#!/bin/bash

# Get Working Dir
curr_dir=$(pwd)
abs_filepath=$(readlink -f $0)
abs_dirpath=$(dirname $abs_filepath)
install_dir=$abs_dirpath
nvim_dir=$HOME/.config/nvim
echo "Installing Directory: $install_dir"
cd $install_dir

install_neovim() {
	
	## Install NeoVim >= v9.0.1
	# Download appimage
	nvim_version="v0.10.0"
	curl -LO https://github.com/neovim/neovim/releases/download/$nvim_version/nvim.appimage
	chmod u+x nvim.appimage
	# Extract appimage && expose nvim globally
	./nvim.appimage --appimage-extract
	rm -rf $install_dir/nvim.appimage
	./squashfs-root/AppRun --version
	sudo rm -rf /var/lib/nvim
	sudo mv $install_dir/squashfs-root /var/lib/nvim 
	
	# Optional: exposing nvim globally.
	sudo ln -sf /var/lib/nvim/AppRun /usr/bin/nvim
}
check_neovim() {
  echo "Checking neovim version"
  nvim --version 
}
main() {
  install_neovim
  check_neovim
}

main

