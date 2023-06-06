#!/bin/bash
# Download
install_dir=/opt/install/os-tools
download_url=https://github.com/aristocratos/btop/releases/latest/download/btop-x86_64-linux-musl.tbz
wget $download_url -O $install_dir/btop.tbz

# Install
sudo tar xf $install_dir/btop.tbz --directory $install_dir
rm -rf /usr/local/bin/btop
mv $install_dir/btop /usr/local/bin/btop
ln -sf /usr/local/bin/btop/bin/btop /usr/bin/btop
chmod +x /usr/bin/btop

# After Finished Install
rm -rf $install_dir/btop.tbz