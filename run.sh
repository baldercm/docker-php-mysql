#!/bin/bash
set -e

docker run --name db -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=poc -e MYSQL_USER=poc -e MYSQL_PASSWORD=poc -d mysql:5.6

docker build -t phpapp .
docker run -it --rm -p 80:80 --link db:db --name phpapp phpapp
