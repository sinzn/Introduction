#!/bin/bash

sudo apt update && sudo apt upgrade -y

sudo apt install docker.io -y

sudo systemctl start docker

sudo usermod -aG docker $USER

git clone https://github.com/sinzn/Testing_terra.git

cd Testing_terra || exit

sudo docker build -t dockertest .

sudo docker run -d -p 83:80 dockertest

echo " Deloyment compelete 👌"

curl ipinfo.me/ip
