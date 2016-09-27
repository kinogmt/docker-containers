#!/bin/sh
: ${PROJ:=w}
: ${SERVICE:=centos}
: ${SERVICEM:=centos_m}

CONTS=$(docker ps --format "{{.Names}}"|grep ${PROJ}_${SERVICE}_ \
               |grep -v $SERVICEM |sort -V)
CONTM=$(docker ps --format "{{.Names}}"|grep ${PROJ}_${SERVICEM}_)

# IP addresses of workers
i=1
for CONT in $CONTM $CONTS; do
    IP=`docker inspect --format '{{.NetworkSettings.Networks.w_net1.IPAddress}}' $CONT`
    echo $IP c$i.localdomain c$i
    i=$(( i + 1 ))
done
