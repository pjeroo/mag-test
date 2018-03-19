#!/usr/bin/env bash

docker swarm init
docker service create --name mag-test --publish 80:80 --health-interval 5s --replicas 2 badfin/mag-test:latest

sleep 10

docker ps --format='{{.ID}}' --filter="name=mag-test" | xargs docker inspect \
 --format='Status of {{.Name}} is {{.State.Health.Status}}'