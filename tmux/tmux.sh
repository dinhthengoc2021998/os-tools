#!/bin/bash

# Get Working Dir
abs_filepath=$(readlink -f $0)
abs_dirpath=$(dirname $abs_filepath)
install_dir=$abs_dirpath
tmux_dir="$HOME/.config/tmux"

# Install tmux default
sudo apt-get install -y tmux
echo "$(tmux -V)"

# Install Tmux plugins
#git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
mkdir -p "$tmux_dir"
cp -f "$install_dir/tmux.conf" "$tmux_dir/tmux.conf"
