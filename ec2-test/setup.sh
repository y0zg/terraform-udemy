#!/bin/bash
sudo add-apt-repository ppa:certbot/certbot
sudo apt update
sudo apt install -y nginx software-properties-common
sudo apt install -y certbot python3-certbot-nginx
cat > /etc/nginx/sites-enabled/default << __EOF
# Master nginx on virtual machine
server {

  listen 80;
  listen [::]:80;

  server_name k1.k8slabs.online;


  location / {
                proxy_pass http://localhost:3000;
                proxy_http_version  1.1;
                proxy_set_header Connection "upgrade";
                proxy_redirect http:// https://;
  }
}

server {

    listen 80;
    listen [::]:80;

    server_name k2.k8slabs.online;

    location / {
                proxy_pass http://localhost:3001;
                proxy_http_version  1.1;
                proxy_set_header Connection "upgrade";
                proxy_redirect http:// https://;
        }
}


__EOF
sudo certbot --nginx --noninteractive  --redirect --agree-tos --email webstd.design@gmail.com -d k1.k8slabs.online
sudo certbot --nginx --noninteractive  --redirect --agree-tos --email webstd.design@gmail.com -d k2.k8slabs.online
# sudo certbot --nginx --noninteractive  --agree-tos --email webstd.design@gmail.com -d k1.k8slabs.online
