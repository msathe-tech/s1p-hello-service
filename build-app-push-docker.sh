#!/usr/bin/env bash
./mvnw clean package
docker build -t msathepivotal/s1p-hello-service .
docker push msathepivotal/s1p-hello-service
