#!/bin/bash
install_dir=/opt/os-tools/java
jdk_version=20

wget https://download.java.net/openjdk/jdk$jdk_version/ri/openjdk-$jdk_version+36_linux-x64_bin.tar.gz -O $install_dir/openjdk-$jdk_version+36_linux-x64_bin.tar.gz
tar -xzvf $install_dir/openjdk-$jdk_version+36_linux-x64_bin.tar.gz -C $install_dir
rm -rf $install_dir/openjdk-$jdk_version+36_linux-x64_bin.tar.gz
rm -rf /var/lib/jdk-$jdk_version
mv jdk-$jdk_version/ /var/lib/jdk-$jdk_version
ln -sf /var/lib/jdk-$jdk_version/bin/java /usr/bin/java
ln -sf /var/lib/jdk-$jdk_version/bin/javac /usr/bin/javac
