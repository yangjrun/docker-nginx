#! /usr/bin/bash
# 定义一个名称变量
network_name="nginx_bridge"

filterName=`docker network ls | grep $network_name | awk '{ print $2 }'`

if [ "$filterName" == "" ]; then
    # 不存在就创建
    docker network create $network_name
    echo "Created network $network_name success!!"
fi

docker-compose -f ./compose-nginx.yaml up -d
docker ps -a
docker logs -f nginx-alpine
