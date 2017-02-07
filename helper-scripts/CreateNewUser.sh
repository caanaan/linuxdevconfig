#! /bin/sh

#Get the sudo password out of the way
sudo -v

#Create the user
sudo adduser $1

#Add them to the sudo and docker groups
sudo usermod -aG sudo $1
sudo gpasswd -a $1 docker

#Restart the docker service
sudo service docker restart

#Give a warning about enabling SSH access
echo "To enable SSH access, add the user to the AllowUsers element in /etc/ssh/ssh_config file."
echo " Then reload the SSH server config - `sudo service ssh reload`"
