#!/bin/bash

#################################
# --- Get AbsPath of this Scripts
#################################
abs_path=$(readlink -f $0)
dir_path=`dirname $abs_path`
yellow=$(tput setaf 3)
normal=$(tput sgr0)

##############################
# --- Install tmux command ---
##############################
printf "${yellow}/// INSTALL TMUX COMMAND ///${normal}\n"
yum update -y
yum install -y tmux 

######################
# --- Tmux Plugins ---
######################
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#####################
# --- Tmux Config ---
#####################
touch ~/.tmux.conf
cat $dir_path/tmux.conf > ~/.tmux.conf

############################
# --- Tmux Reload Config ---
############################
tmux source ~/.tmux.conf
printf "${yellow}/// RELOAD CONFIG ///${normal}\n"

