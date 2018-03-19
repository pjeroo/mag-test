FROM ubuntu:16.04

RUN apt-get update && apt-get install -y nginx haproxy curl && apt-get clean -y
RUN mkdir /devops

COPY files/haproxy.cfg /etc/haproxy/haproxy.cfg
COPY files/default /etc/nginx/sites-enabled/default
COPY files/entrypoint.sh /devops/entrypoint.sh

HEALTHCHECK CMD curl --fail http://localhost:80 || exit 1
HEALTHCHECK CMD curl --fail http://localhost:8080 || exit 1

ENTRYPOINT ["/devops/entrypoint.sh"]