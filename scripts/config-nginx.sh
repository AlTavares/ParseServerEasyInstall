#!/bin/sh

sudo cp nginx.conf /etc/nginx/
sudo cp ./sites-available /etc/nginx
mkdir /etc/nginx/sites-enabled

sudo ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

sudo service nginx reload