#!/bin/bash

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
. $HOME/.bashrc
nvm_version="16.20.0"

# Should run the following cmd outside of this file scripts
#nvm install $nvm_version
#nvm use $nvm_version
#nvm alias default $nvm_version

# Check version
#node --version
