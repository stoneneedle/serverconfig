#!/bin/bash

# UFWterrSSH.sh - Configure firewall for Terraria/SSH

sudo apt install ufw

# SSH
sudo ufw allow ssh

# terraria
sudo ufw allow 7777/tcp

sudo ufw enable
sudo ufw status verbose

echo "If you want, sudo ufw delete 4"
