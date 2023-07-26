#!/bin/bash

#####################################################
# /// Install Visual Studio Code on Ubuntu 22.04 ///
#####################################################

# /// Step1: Update System
sudo apt update 

# /// Step2: Import the GPG Key
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/ms-vscode-keyring.gpg

# /// Step3: Add Vscode Repository 
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/ms-vscode-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list

# /// Step4: Re Update System
sudo apt update

# /// Step5: Install the editor
sudo apt install code

