#!/bin/sh
if [ $# -ne 1 ];
then
    echo "usage: $0 <number-of-containers>"
    exit 1
fi

NN=$1

# IP addresses of workers
for i in $(seq 1 $NN); do
    IP=`docker inspect --format '{{ .NetworkSettings.IPAddress }}' w_centos_$i`
    echo $IP c$i.localdomain c$i
done
