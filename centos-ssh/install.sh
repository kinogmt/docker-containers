#!/bin/sh
PKG=~/CloudianHyperStore-5.2.1.bin
LIC=~/cloudian_12345.lic
SURV=~/test.csv


mkdir -p tmp
cd tmp

sh $PKG $LIC

export COM=/etc/cloudian-5.2.1-puppet/manifests/extdata/common.csv
sed -i 's/.*cassandra_max_heap_size,.*/cassandra_max_heap_size,500m/' $COM
sed -i 's/.*cassandra_heap_newsize,.*/cassandra_heap_newsize,100m/' $COM

./cloudianInstall.sh -b -s $SURV no-hosts no-dnsmasq
