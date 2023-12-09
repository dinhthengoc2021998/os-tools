#!/bin/bash
##########################################
# --- Get AbsolutePath of this Scripts ---
#########################################
abs_path=$(readlink -f $0)
dir_path=`dirname $abs_path`
yellow=$(tput setaf 3)
normal=$(tput sgr0)

# Install vi command
printf "${yellow}/// Install vi command /// ${normal}\n"
yum update -y
yum install -y vi

# Copy vimrc from here to local for using
printf "${yellow}/// Create .vimrc /// ${normal}\n"
touch ~/.vimrc
cat $dir_path/vimrc > ~/.vimrc 
printf "${yellow}/// Finished Install vi command /// ${normal}\n"

