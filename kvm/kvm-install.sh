#!/bin/bash

#####################################
# Base Vars; Funcs;
#####################################

# Default Variables
RED=$(tput bold setaf 1)
GREEN=$(tput bold setaf 2)
YELLOW=$(tput bold setaf 3)
BLUE=$(tput bold setaf 4)
NORMAL=$(tput sgr0)
abs_filepath=$(readlink -f $0)
abs_dirpath=$(dirname "$abs_filepath")

# Default Function
line_break() {
  printf '%*s-' 50 | tr ' ' '-'
  echo
}
ask_storage_dir() {
    # Set a default storage directory
    default_dir="$HOME/storage"

    # Prompt the user to enter the storage directory
    read -p "Your Storage Dirpath (default: $default_dir): " storage_dir

    # Use the default directory if the user input is empty
    storage_dir=${storage_dir:-$default_dir}

    # Expand variables like $HOME in the storage_dir path
    eval storage_dir="$storage_dir"

    # Check if the directory exists
    if [ -d "$storage_dir" ]; then
        echo "Storage Directory exists: $storage_dir"
    else
        echo "Error: Storage Directory $storage_dir does not exist. Exiting."
        exit 1
    fi
}

#####################################
# --- Install KVM on Ubuntu 22.04 ---
#####################################
install_kvm() {

    line_break
    ask_storage_dir

    # Update system
    sudo apt update

    # install_kvm_virt_manager
    echo "${GREEN}Installing KVM, QEMU, and Virtual Machine Manager...${NORMAL}"
    sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager -y
    sudo systemctl enable --now libvirtd
    line_break

    # check_virtualization
    echo "${GREEN}Checking CPU virtualization support...${NORMAL}"
    if egrep -c '(vmx|svm)' /proc/cpuinfo > /dev/null; then
        echo "${GREEN}Virtualization is supported.${NORMAL}"
    else
        echo "${GREEN}Virtualization is NOT supported. Check BIOS/UEFI settings.${NORMAL}"
    fi

    echo "${GREEN}Adding user to libvirt group...${NORMAL}"
    sudo usermod -aG libvirt $(whoami)

    # Download Ubuntu iso if not exist
    ubuntu_iso_filename="ubuntu-22.04.5-live-server-amd64.iso"
    ubuntu_iso_filepath="$storage_dir/$ubuntu_iso_filename"
    if [ -f "$ubuntu_iso_filepath" ]; then
        echo "${GREEN}$ubuntu_iso_filepath already exists.${NORMAL}"
    else
        echo "${GREEN}$ubuntu_iso_filepath not found. Downloading...${NORMAL}"
        wget "https://releases.ubuntu.com/22.04/$ubuntu_iso_filename" -P $storage_dir
    fi
}
main() {
    install_kvm
}
main
