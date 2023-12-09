#!/bin/bash

#####################################
# --- Get AbsPath of this Scripts ---
#####################################
abs_path=$(readlink -f $0)
dir_path=`dirname $abs_path`
yellow=$(tput setaf 3)
normal=$(tput sgr0)

#####################
# --- Install zsh ---
#####################
printf "${yellow}/// Install zsh with ohmyzsh theme///${normal}\n"
yum update -y 
yum install -y zsh
echo Y | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
