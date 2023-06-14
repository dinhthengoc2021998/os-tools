#!/bin/bash 

install_dir=/opt/os-tools/maven
maven_version=3.9.2
maven_download_url=https://downloads.apache.org/maven/maven-3/$maven_version/binaries/apache-maven-$maven_version-bin.tar.gz

wget $maven_download_url -O $install_dir/apache-maven-$maven_version-bin.tar.gz
tar -xzvf $install_dir/apache-maven-$maven_version-bin.tar.gz -C $install_dir
rm -rf $install_dir/apache-maven-$maven_version-bin.tar.gz
ln -sf $install_dir/apache-maven-$maven_version/bin/mvn /usr/bin/mvn