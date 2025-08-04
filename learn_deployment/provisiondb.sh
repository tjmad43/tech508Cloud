#!/bin/bash

echo "Update..."
sudp DEBIAN_FRONTEND=noninteractiv apt-get update
echo "Done"
echo

echo "Upgrade..."
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
echo "Done"
echo

# import public key
sudo apt-get install gnupg curl

curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor

# create list file
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

# reload package database
sudo apt-get update

# install mongo db
# fix! needs input
sudo apt-get install -y \
   mongodb-org=7.0.22 \
   mongodb-org-database=7.0.22 \
   mongodb-org-server=7.0.22 \
   mongodb-mongosh \
   mongodb-org-shell=7.0.22 \
   mongodb-org-mongos=7.0.22 \
   mongodb-org-tools=7.0.22 \
   mongodb-org-database-tools-extra=7.0.22


# change   bindIp: 127.0.0.1 to 0.0.0.0 in
#cd /etc
#sudo cp mongod.conf mongod.conf.bk
#sudo nano mongod.conf
# use sed


sudo systemctl start mongod

sudo systemctl status mongod

sudo systemctl enable mongod

