#!/bin/bash

# Add Proxmox Repository and GPG Key
echo "deb [arch=amd64] http://download.proxmox.com/debian/pve bullseye pve-no-subscription" > /etc/apt/sources.list.d/pve-install-repo.list
wget https://enterprise.proxmox.com/debian/proxmox-release-bullseye.gpg -O /etc/apt/trusted.gpg.d/proxmox-release-bullseye.gpg

# Verify the GPG Key
sha512sum /etc/apt/trusted.gpg.d/proxmox-release-bullseye.gpg

# Update and Install Proxmox Packages
apt update
apt full-upgrade -y
apt install proxmox-ve postfix open-iscsi chrony -y

# Install Proxmox Default Kernel
apt install proxmox-default-kernel -y

# Reboot the system
echo "Rebooting the system..."
sleep 5
systemctl reboot

# Sleep for a while to allow the system to restart
sleep 60

# Display Proxmox Admin Web Interface URL
echo "Proxmox Admin Web Interface: https://$(hostname -I | awk '{print $1}'):8006/"
