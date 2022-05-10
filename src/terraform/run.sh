#!/bin/bash

docker build -t terraform-dev .
docker run --volume //d/docker-vol:/host terraform-dev:latest