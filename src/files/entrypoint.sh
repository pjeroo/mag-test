#!/usr/bin/env bash

NGINX_PORT=8080

sed -i "s/nginx/${HOSTNAME}/g" /var/www/html/index.nginx-debian.html
sed -i "s/%nginx-child%/localhost:${NGINX_PORT}/g" /etc/haproxy/haproxy.cfg
sed -i "s/%nginx-port%/${NGINX_PORT}/g" /etc/nginx/sites-enabled/default

service nginx start
service haproxy start

tail -f /dev/null