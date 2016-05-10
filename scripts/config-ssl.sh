#!/bin/sh

sudo apt-get -y install git bc
sudo git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt

/opt/letsencrypt-auto certonly -a webroot --webroot-path=/usr/share/nginx/html -d altavares.tk -d www.altavares.tk

sudo service nginx reload

export EDITOR=nano
crontab -l | { cat; echo "30 2 * * 1 /opt/letsencrypt/letsencrypt-auto renew >> /var/log/le-renew.log"; } | crontab -
crontab -l | { cat; echo "35 2 * * 1 /etc/init.d/nginx reload"; } | crontab -

