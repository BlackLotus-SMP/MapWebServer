#!/bin/bash

CERTS_DIR="certs"

if [ ! -d "$CERTS_DIR" ]; then
    chmod +x certificates.sh
    mkdir -p "$CERTS_DIR"
    ./certificates.sh "$CERTS_DIR"
fi

docker build -t maps .
chmod +x stop.sh
./stop.sh
docker run -d --name mapscnt -p 80:80 -p 443:443 -v $PWD/maps:/maps maps
docker exec mapscnt certbot --nginx -d maps.kahzerx.com --agree-tos --register-unsafely-without-email --no-redirect
docker exec mapscnt service cron start
docker exec mapscnt crontab crn
