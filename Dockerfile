#Развернуть web-кластер из двух docker-машин с помощью одного bash-скрипта
#Среда контейнеризации: Docker 17.x
#Операционная система docker-машины: Ubuntu 16.04
#Балансировщик: HAProxy -any
#Веб-сервер: Nginx - any
#
#Описание
#Написать bash-скрипт, который в существующей среде контейнеризации Docker создаст и запустит два docker-образа
# операционной системы Ubuntu, установит в каждый из образов балансировщик HAProxy и веб-сервер Nginx,
# настроит балансировщики таким образом, чтобы трафик шел на один из доступных веб-серверов Nginx.
# Bash-скрипт после запуска docker-образов операционной системы Ubuntu, должен проверить доступность веб-серверов Nginx,
# используя порты балансировщиков HAProxy.
#
#Принимаются любые варианты исполнения скриптов.


FROM ubuntu:16.04

RUN apt-get update && apt-get install -y nginx haproxy && apt-get clean -y
RUN mkdir /devops

COPY files/haproxy.cfg /etc/haproxy/haproxy.cfg
COPY files/default /etc/nginx/sites-enabled/default
COPY files/entrypoint.sh /devops/entrypoint.sh

ENTRYPOINT ["/devops/entrypoint.sh"]