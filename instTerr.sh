#!/bin/bash

# instTerr.sh - Install Terraria

cd /opt && sudo curl -O http://terraria.org/server/terraria-server-1353.zip
ls -l

sudo unzip terraria-server-1353.zip
ls -l

sudo mv /opt/1353/Linux /opt/terraria
ls -l

# Delete the now unneeded files
sudo rm -rf /opt/1353
sudo rm /opt/terraria-server-1353.zip
ls -l

# Set up dir owner and file execute permission
sudo chown -R root:root /opt/terraria
sudo chmod +x /opt/terraria/TerrariaServer.bin.x86_64

# Add terraria system user
sudo useradd -r -m -d /srv/terraria terraria

# Modify terraria user permissions
