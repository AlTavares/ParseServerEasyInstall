#!/bin/sh

sudo cp nginx-files/nginx.conf /etc/nginx/
sudo cp -r nginx-files/sites-available /etc/nginx
sudo mkdir /etc/nginx/sites-enabled

sudo ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

sudo service nginx reload