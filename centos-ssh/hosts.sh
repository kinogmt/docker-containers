#!/bin/sh
NN=$(docker ps |grep w_centos|wc -l)

# IP addresses of workers
for i in $(seq 1 $NN); do
    IP=`docker inspect --format '{{ .NetworkSettings.IPAddress }}' w_centos_$i`
    echo $IP c$i.localdomain c$i
done
