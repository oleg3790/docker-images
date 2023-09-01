#!/bin/bash

docker build -t directory-stitch .
docker run -v //d/Other\ Projects/project1:/project1 \
           -v //d/work/project2:/project2 \
           -t directory-stitch \
           directory-stitch:latest
