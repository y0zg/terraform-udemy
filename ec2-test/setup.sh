#!/bin/bash
sudo add-apt-repository ppa:certbot/certbot
sudo apt update
sudo apt install -y nginx
sudo apt install software-properties-common
sudo apt install -y certbot python3-certbot-nginx
sudo certbot --nginx --noninteractive  --redirect --agree-tos --email webstd.design@gmail.com -d k1.k8slabs.online
