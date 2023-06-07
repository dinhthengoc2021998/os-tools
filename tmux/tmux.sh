#!bin/bash

install_dir=/opt/os-tools/tmux
config_dir=~/.config/tmux
# Install tmux default
apt-get install -y tmux
echo $(tmux -V)
# Install Tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
mkdir -p $config_dir
cp $install_dir/tmux.conf  $config_dir/tmux.conf
