#!/bin/bash 
# Parsing absolute filepath of this script 
abs_filepath=$(readlink -f $0)
abs_dirpath=$(dirname $abs_filepath)
build_dirpath=$abs_dirpath
echo "Build DirPath: $build_dirpath"

install_dir=$build_dirpath
maven_version=3.9.9
maven_download_url=https://downloads.apache.org/maven/maven-3/$maven_version/binaries/apache-maven-$maven_version-bin.tar.gz

wget $maven_download_url -O $install_dir/apache-maven-$maven_version-bin.tar.gz
tar -xzvf $install_dir/apache-maven-$maven_version-bin.tar.gz -C $install_dir
rm -rf $install_dir/apache-maven-$maven_version-bin.tar.gz
ln -sf $install_dir/apache-maven-$maven_version/bin/mvn /usr/bin/mvn