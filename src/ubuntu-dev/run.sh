#!/bin/bash

docker build -t dev-machine .
docker run --volume //d/docker-vol:/host dev-machine:latest