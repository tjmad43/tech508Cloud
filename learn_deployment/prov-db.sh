#!/bin/bash

echo "Update..."
sudp DEBIAN_FRONTEND=noninteractive apt-get update
echo "Done"
echo

echo "Upgrade..."
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
echo "Done"
echo

# import public key
echo "Import public key..."
sudo DEBIAN_FRONTEND=noninteractive apt-get install gnupg curl

echo "Import public key..."
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   gpg --dearmor | \
   sudo tee /usr/share/keyrings/mongodb-server-7.0.gpg > /dev/null
echo "Done"
echo


# create list file
echo "Create list file..."
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
echo "Done"
echo

# reload package database
echo "Reload package database..."
sudo DEBIAN_FRONTEND=noninteractive apt-get update
echo "Done"
echo

# install mongo db
echo "Install mongodb..."
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
   mongodb-org=7.0.22 \
   mongodb-org-database=7.0.22 \
   mongodb-org-server=7.0.22 \
   mongodb-mongosh \
   mongodb-org-shell=7.0.22 \
   mongodb-org-mongos=7.0.22 \
   mongodb-org-tools=7.0.22 \
   mongodb-org-database-tools-extra=7.0.22
echo "Done"
echo


# change bindIp to allow anywhere
echo "Change bindIp..."
sudo sed -i 's/bindIp: 127.0.0.1/bindIp: 0.0.0.0/' /etc/mongod.conf
echo "Done"
echo

echo "Start db..."
sudo systemctl start mongod
echo "Done"
echo

echo "db status..."
sudo systemctl status mongod
echo

echo "Enable mongodb..."
sudo systemctl enable mongod
echo "Done"
echo
