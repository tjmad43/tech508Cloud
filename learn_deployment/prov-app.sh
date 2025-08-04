#!/bin/bash
# provision for sparta app
# for Ubuntu 22.04

echo "Update..."
sudo DEBIAN_FRONTEND=noninteractive apt update
echo "Done"
echo

# fix! expects user input
echo "Upgrade..."
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
echo "Done"
echo

# fix! expects user input
echo "Install nginx..."
sudo apt-get install nginx -y
echo "Done"
echo

# configure reverse proxy using nginx


# install node.js v20 (installs npm commands too)
echo "Install node.js"
sudo DEBIAN_FRONTEND=noninteractive bash -c "curl -fsSL https://deb.nodesource.com/setup_20.x | bash -" && \
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs
echo "Done"
echo 

# check node version
echo "Check node version"
node -v
echo

# download app code to a "repo" folder
echo "Download git repo"
git clone https://github.com/tjmad43/tech508-sparta-app repo
echo "Done"
echo

# cd into app folder
cd repo/app

# database instance private IP
export DB_HOST=mongodb://54.246.66.165:27017/posts

# install packages for app
echo "Install packages..."
npm install
echo "Done"
echo

# start app
echo "Start app..."
npm start

