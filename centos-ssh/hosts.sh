#!/bin/sh
if [ $# -ne 1 ];
then
    echo "usage: $0 <number-of-containers>"
    exit 1
fi

# number-of-containers include both master and workers
NN=$(( $1 - 1 ))

# IP address of master
MIP=`docker inspect --format '{{ .NetworkSettings.IPAddress }}' m_centos_run_1`

echo $MIP c0.localdomain c0

# IP addresses of workers
for i in $(seq 1 $NN); do
    IP=`docker inspect --format '{{ .NetworkSettings.IPAddress }}' w_centos_$i`
    echo $IP c$i.localdomain c$i
done
