#!/usr/bin/env bash

CURRENT_IP=$(awk 'END{print $1}' /etc/hosts)

sed -i "s/nginx/${HOSTNAME}/g" /var/www/html/index.nginx-debian.html
sed -i "s/%nginx-child%/${CURRENT_IP}/g" /etc/haproxy/haproxy.cfg

service nginx start
service haproxy start

tail -f /dev/null