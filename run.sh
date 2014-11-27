#!/bin/bash

sudo docker rm -f wordpress nginx-proxy data-mysql &>/dev/null

#sudo docker pull jwilder/nginx-proxy
#sudo docker pull tutum/wordpress

VIRTUAL_HOST=wordpressexample.home24.com

sudo docker run --name data-mysql -v $PWD/data/mysql:/var/lib/mysql scratch bash &>/dev/null

sudo docker run -d --name=nginx-proxy -p 80:80 -v /var/run/docker.sock:/tmp/docker.sock jwilder/nginx-proxy
sudo docker run -d --name=wordpress -e VIRTUAL_HOST=${VIRTUAL_HOST} --volumes-from data-mysql -t tutum/wordpress

echo Please access via http://${VIRTUAL_HOST}
