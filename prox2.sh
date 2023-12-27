#!/bin/bash

# Install Proxmox VE, postfix, open-iscsi, and chrony
sudo apt install proxmox-ve postfix open-iscsi chrony -y

# Remove specific Linux kernel images
sudo apt remove linux-image-amd64 'linux-image-6.1*' -y
sudo apt remove os-prober -y

# Auto-detect and connect to the Proxmox admin web interface
# (You may need to add the specific command to open a web browser to the Proxmox admin interface)
# Example:
# xdg-open https://your-proxmox-server-ip:8006

# Create a Linux Bridge called vmbr0 and add the first network interface to it
# Note: You need to replace 'your_network_interface' with the actual network interface name
sudo systemctl stop networking
sudo systemctl stop systemd-networkd
sudo ip link set enp0s3 down
sudo brctl addbr vmbr0
sudo brctl addif vmbr0 enp0s3
sudo ip link set enp0s3 up
sudo systemctl start networking
sudo systemctl start systemd-networkd

echo "Proxmox setup completed. Please check the Proxmox admin web interface for further configuration."
