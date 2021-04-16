#!/usr/bin/env bash

docker stop commonbash
docker rm commonbash
docker-compose up -d commonbash
