#!/bin/bash

docker build -t appautomation-test .
docker run -v //d/Other\ Projects/project1:/project1 \
           -v //d/work/project2:/project2 \
           -t appautomation-dev \
           appautomation-test:latest
