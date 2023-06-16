#!/bin//bash

install_dir=/opt/os-tools/gradle
gradle_version=8.1.1
gradle_download_url=https://downloads.gradle.org/distributions/gradle-$gradle_version-bin.zip

## Download 
wget $gradle_download_url -O $install_dir/gradle-$gradle_version-bin.zip
unzip -d $install_dir $install_dir/gradle-$gradle_version-bin.zip

# Link to Bins for use
ln -sf $install_dir/gradle-$gradle_version/bin/gradle /usr/bin/gradle