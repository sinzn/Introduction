#!/bin/bash

sudo apt update && sudo apt upgrade -y

sudo apt install docker.io figlet lolcat -y

clear

figlet "Deployment Start...."

sudo systemctl start docker

sudo systemctl enable docker

sudo usermod -aG docker $USER

git clone https://github.com/sinzn/Testing_terra.git

cd Testing_terra || exit

sudo docker build -t hellowebsite .

container_id=$(sudo docker run -d -P hellowebsite)

host_port=$(sudo docker port $container_id 80 | cut -d: -f2)

cd ..

sudo rm -rf Testing_terra

public_ip=$(curl -s ipinfo.io/ip)

echo -e "\n Deployment Complete.."
echo -e "Public access : http://$public_ip:$host_port"
echo -e "Local access  : http://localhost:$host_port \n"
