#!/usr/bin/env bash
./mvnw clean package
version="$(git log -n1 --format="%h")"
echo $version
docker build -t msathepivotal/s1p-hello-service:$version .
docker push msathepivotal/s1p-hello-service:$version
