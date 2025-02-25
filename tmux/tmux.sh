#!/bin/bash

# Get Working Dir
abs_filepath=$(readlink -f "$0")
abs_dirpath=$(dirname "$abs_filepath")
install_dir=$abs_dirpath
git_tmp_dir="$HOME/tmux"
tmux_conf_path="$HOME/.tmux.conf"

# Install tmux default
sudo apt-get install -y tmux

# Clean Tmux
rm -rf "$git_tmp_dir"
rm -rf "$tmux_conf_path"

# Install Tmux plugins
git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
cp -f "$install_dir/tmux.conf" "$tmux_conf_path"

# Run this to source config file. 
# Then Press `prefix + I` to install 
# tmux source "$tmux_dir/tmux.conf"
