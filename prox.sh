#!/bin/bash

# Add Proxmox repository
echo "deb [arch=amd64] http://download.proxmox.com/debian/pve bookworm pve-no-subscription" > /etc/apt/sources.list.d/pve-install-repo.list

# Download Proxmox GPG key
wget https://enterprise.proxmox.com/debian/proxmox-release-bookworm.gpg -O /etc/apt/trusted.gpg.d/proxmox-release-bookworm.gpg

# Verify the downloaded GPG key
sha512sum /etc/apt/trusted.gpg.d/proxmox-release-bookworm.gpg

# Update and upgrade packages
sudo apt update && sudo apt full-upgrade -y

# Install Proxmox default kernel
sudo apt install proxmox-default-kernel -y

# Reboot the system
sudo systemctl reboot
