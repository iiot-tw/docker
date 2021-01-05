#!/bin/sh -e

if ! id | grep -q root; then
        echo "must be run as root"
        exit
fi

if ! [ -a /opt/source/docker/nodered.tar]; then
  wget https://www.dropbox.com/s/91y7l1zisp4sl7j/docker.nodered.tar?dl=1 -O /opt/source/docker/nodered.tar
fi
docker load -i /opt/source/docker/nodered.tar

mkdir -p /neousys/nodered_data
chmod 777 /neousys/nodered_data

docker run -d --restart unless-stopped -p 1880:1880 -v /neousys/nodered_data:/data --name igtnodered nodered/node-red
