#!/bin/bash

# Get Working Dir
curr_dir=$(pwd)
abs_filepath=$(readlink -f $0)
abs_dirpath=$(dirname $abs_filepath)
install_dir=$abs_dirpath
nvim_dir=$HOME/.config/nvim
coc_dir=$HOME/.config/coc
echo "Installing Directory: $install_dir"
cd $install_dir

#################
# Install Neovim
#################
clean_neovim() {
  echo "Start to Clean Config and Old Neovim"
	sudo rm -rf $HOME/.config/nvim 
	sudo rm -rf $HOME/.cache/nvim 
	sudo rm -rf $HOME/.local/share/nvim 
	sudo rm -rf $HOME/.local/state/nvim
  sudo rm -rf $nvim_dir/settings
  sudo rm -rf $nvim_dir/lua
  sudo rm -rf $coc_dir
  echo "Finished cleaning"
}

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

####################
# Custom NVIM Config
####################
custom_nvim_config() {
    mkdir -p $nvim_dir
    ln -sf $install_dir/init.lua $nvim_dir/init.lua
    ln -sf $install_dir/settings $nvim_dir/settings
    ln -sf $install_dir/lua/core $nvim_dir/lua/core
    nvim -c 'Lazy sync' 
    nvim -c "checkhealth" 


    # Export Variables: Should put it to ~/.bashrc
    # export DISPLAY=0 # For use xsel clipboard tool
    export_display_cmd=$(who | grep $USER | awk '{print $2}')
    echo 
    echo "---------------------------------------------------------------------------------------------------"
    echo "WARN: To use Clipboard: Should add this line into $HOME/.bashrc: export DISPLAY=$export_display_cmd"
    echo "WARN: After install: Need to go to nvim -> Use fzf and download binary executable for use fzf later"
    echo "---------------------------------------------------------------------------------------------------"
}
add_nvim_provider() {
    # Prerequisite Lib on OS: nodejs >=16; python3-pip
    sudo apt install -y git python3-pip

    # Install Provider for NVIM
    npm install neovim -g
    python3 -m pip install pynvim doq
}

##############
# Execute Main
##############
main() {
    # Install Default NVIM
    clean_neovim
    install_neovim
    check_neovim
    # Install Custom Config for Myself
    add_nvim_provider
    custom_nvim_config
}

main

