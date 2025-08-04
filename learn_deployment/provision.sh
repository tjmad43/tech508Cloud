#!/bin/bash
# provision for sparta app

echo "Update..."
sudo DEBIAN_FRONTEND=noninteractiv apt update
echo "Done"
echo

# fix! expects user input
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y

# fix! expects user input
sudo apt-get install nginx -y

# configure reverse proxy using nginx

# install node.js v20 (installs npm commands too)
sudo DEBIAN_FRONTEND=noninteractive bash -c "curl -fsSL https://deb.nodesource.com/setup_20.x | bash -" && \
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs
 
 # check node version
node -v

# download app code to a "repo" folder
git clone https://github.com/tjmad43/tech508-sparta-app repo

# cd into app folder
cd repo/app

# database instance private IP
export DB_HOST=mongodb://172.31.26.123:27017/posts

# install packages for app
npm install

# start app
npm start

