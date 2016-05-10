#!/bin/sh

#fix locale
echo "export LC_ALL=en_US.UTF-8" >> ~/.bash_profile
echo "export LANG=en_US.UTF-8" >> ~/.bash_profile
. ~/.bash_profile

#ppa nginx mainline
echo "deb http://nginx.org/packages/mainline/ubuntu/ trusty nginx" | sudo tee -a /etc/apt/sources.list
echo "deb-src http://nginx.org/packages/mainline/ubuntu/ trusty nginx" | sudo tee -a /etc/apt/sources.list

#install nginx
wget http://nginx.org/keys/nginx_signing.key
sudo apt-key add nginx_signing.key
sudo apt-key update -y
sudo apt-get update -y
sudo apt-get install -y nginx

#install nodejs
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install MongoDB
sudo apt-get -y install mongodb

# Create app directory
sudo mkdir -p /usr/src/apps
sudo chown -R ubuntu /usr/src/apps/ParseServer

# Bundle app source
sudo cp -rf ../ParseServer /usr/src/apps

cd /usr/src/apps/ParseServer/app
sudo npm install