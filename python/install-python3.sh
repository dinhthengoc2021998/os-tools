#!/bin/bash

# SET Variables
cur_dir=$(pwd)
abs_filepath=$(readlink -f $0)
abs_dirpath=$(dirname $abs_filepath)
build_dirpath=$abs_dirpath
echo "Build DirPath: $build_dirpath"

# Install lib linux
apt update -y
apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev

# Install Python3
python3_version="3.12.7"
wget https://www.python.org/ftp/python/$python3_version/Python-$python3_version.tgz -O $build_dirpath/Python-$python3_version.tgz
tar -xzvf $build_dirpath/Python-$python3_version.tgz -C $build_dirpath
cd $build_dirpath/Python-$python3_version/
./configure --enable-optimizations
make altinstall

# Clean Garbage
rm -rf $build_dirpath/Python-$python3_version $build_dirpath/Python-$python3_version.tgz
cd $cur_dir
