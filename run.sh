#!/bin/bash

docker build -t maps .
./stop.sh
docker run -d --name mapscnt -p 80:80 -v $PWD/maps:/otakucraft/maps maps
