#!/bin/sh

# Create app directory
sudo mkdir -p /usr/src/apps

# Bundle app source
sudo cp -rf ../ParseServer /usr/src/apps

cd /usr/src/apps/ParseServer
sudo chown -R ubuntu /usr/src/apps
sudo npm install

pm2 start /usr/src/apps/ParseServer/start.sh --name="ParseServer"
pm2 startup ubuntu
sudo su -c "env PATH=$PATH:/usr/bin pm2 startup ubuntu -u ubuntu --hp /home/ubuntu"
pm2 save
