#!/bin/bash
# provision for sparta app
# for Ubuntu 22.04
# install dependencies - no app folder

echo "Update..."
sudo DEBIAN_FRONTEND=noninteractive apt update
echo "Done"
echo

echo "Upgrade..."
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
echo "Done"
echo

echo "Install nginx..."
sudo DEBIAN_FRONTEND=noninteractive apt-get install nginx -y
echo "Done"
echo

# configure reverse proxy using nginx
echo "Configure nginx..."
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bk
sudo sed -i 's|try_files \$uri \$uri/ =404;|proxy_pass http://localhost:3000;|' /etc/nginx/sites-available/default
sudo systemctl reload nginx
echo "Done"
echo

# install node.js v20 (installs npm commands too)
echo "Install node.js"
sudo DEBIAN_FRONTEND=noninteractive bash -c "curl -fsSL https://deb.nodesource.com/setup_20.x | bash -" && \
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs
echo "Done"
echo 

# install packages for app
echo "Install packages..."
npm install
echo "Done"
echo

# install pm2
echo "Install pm2"
sudo npm install -g pm2
echo "Done"
echo

# start app
echo "Start app..."
pm2 start app.js

