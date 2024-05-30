#!/bin/bash

abs_filepath=$(readlink -f $0)
abs_dirpath=$(dirname $abs_filepath)

echo "Install NodeJS and NPM"
yum update -y
yum install -y gcc-c++ make 
curl -sL https://rpm.nodesource.com/setup_16.x | sudo -E bash - 
sudo yum install -y nodejs

echo "Check version of Node and NPM"
node -v 
npm -v