FROM ubuntu:16.04

RUN apt-get update && apt-get install -y nginx haproxy && apt-get clean -y
RUN mkdir /devops

COPY files/haproxy.cfg /etc/haproxy/haproxy.cfg
COPY files/default /etc/nginx/sites-enabled/default
COPY files/entrypoint.sh /devops/entrypoint.sh

ENTRYPOINT ["/devops/entrypoint.sh"]