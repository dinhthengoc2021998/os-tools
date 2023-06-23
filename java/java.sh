#!/bin/bash
install_dir=/opt/os-tools/java
jdk_version=11

wget https://download.java.net/openjdk/jdk$jdk_version.0.0.1/ri/openjdk-$jdk_version.0.0.1_linux-x64_bin.tar.gz \
    -O $install_dir/openjdk-$jdk_version.0.0.1_linux-x64_bin.tar.gz
tar -xzvf $install_dir/openjdk-$jdk_version.0.0.1_linux-x64_bin.tar.gz -C $install_dir
rm -rf $install_dir/openjdk-$jdk_version.0.0.1_linux-x64_bin.tar.gz
rm -rf /var/lib/jdk-$jdk_version
mv $install_dir/jdk-$jdk_version.0.0.1/ /var/lib/jdk-$jdk_version
# Create Symbollink
ln -sf /var/lib/jdk-$jdk_version/bin/java /usr/bin/java
ln -sf /var/lib/jdk-$jdk_version/bin/javac /usr/bin/javac
ln -sf /var/lib/jdk-$jdk_version/bin/jar /usr/bin/jar
ln -sf /var/lib/jdk-$jdk_version/bin/jlink /usr/bin/jlink

