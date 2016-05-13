#!/bin/sh

sudo apt-get -y install git bc
sudo git clone https://github.com/certbot/certbot.git /opt/letsencrypt

/opt/letsencrypt/letsencrypt-auto certonly -a webroot --webroot-path=/usr/share/nginx/html -d altavares.tk -d www.altavares.tk

export EDITOR=nano
crontab -l | { cat; echo "30 2 * * 1 /opt/letsencrypt/letsencrypt-auto renew >> /var/log/le-renew.log"; } | crontab -
crontab -l | { cat; echo "35 2 * * 1 /etc/init.d/nginx reload"; } | crontab -

sudo openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
sudo service nginx reload
