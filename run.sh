#!/usr/bin/env bash

docker build . -t mag-test:latest

docker network create --subnet=172.38.0.0/16 --ip-range=172.38.5.0/24 mag

docker run --name=mag-test1 --network=mag --ip=172.38.5.2 -d mag-test:latest
docker run --name=mag-test2 --network=mag --ip=172.38.5.3 -d mag-test:latest

sleep 1

NGINX1_RESP=$(curl -s -o /dev/null -w "%{http_code}" 172.38.5.2:80)
NGINX2_RESP=$(curl -s -o /dev/null -w "%{http_code}" 172.38.5.3:80)

if [ "${NGINX1_RESP}" == 200 ]
then
    echo "CHECK NGINX 1 - ok"
else
    echo "CHECK NGINX 1 - failed. status code: ${NGINX1_RESP}"
fi

if [ "${NGINX2_RESP}" == 200 ]
then
    echo "CHECK NGINX 2 - ok"
else
    echo "CHECK NGINX 2 - failed. status code: ${NGINX2_RESP}"
fi