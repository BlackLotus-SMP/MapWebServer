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
docker run -d --name mapscnt -p 80:80 -p 443:443 -v $PWD/maps:/otakucraft/maps maps
