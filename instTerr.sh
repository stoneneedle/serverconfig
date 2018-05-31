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

# Add terraria system user as sudoer
sudo useradd -r -m -d /srv/terraria terraria
sudo passwd terraria
sudo usermod -aG sudo terraria

# Make Terraria worlds folder
sudo mkdir /srv/terraria/Worlds

# Copy/chmod essential Terraria system unit/service config files,
# and the serverconfig file
sudo cp ~/serverconfig/serverconfig.txt /opt/terraria/serverconfig.txt
sudo cp ~/serverconfig/terraria.service /etc/systemd/system/terraria.service
sudo cp ~/serverconfig/terrariad /usr/local/bin/terrariad
sudo chmod +x /usr/local/bin/terrariad

# Set the file owner for copied system/unit/serverconfig files
sudo chown -R root:root /opt/terraria/serverconfig.txt /etc/systemd/system/terraria.service /usr/local/bin/terrariad

# Switch to system user terraria
su terraria
