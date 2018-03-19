#!/usr/bin/env bash

CURRENT_IP=$(awk 'END{print $1}' /etc/hosts)
NGINX_PORT=8080

sed -i "s/nginx/${HOSTNAME}/g" /var/www/html/index.nginx-debian.html
sed -i "s/%nginx-child%/${CURRENT_IP}:${NGINX_PORT}/g" /etc/haproxy/haproxy.cfg
sed -i "s/%nginx-port%/${NGINX_PORT}/g" /etc/nginx/sites-enabled/default

service nginx start
service haproxy start

tail -f /dev/null