#!/bin/bash
#
#
#


# /root/admin-openrcv3.sh
#source /root/admin-openrcv3.sh

mtuValue=8900
echo $mtuValue

tapItem=`netstat -i |grep tap | awk -F' ' '{print $1}'`
qvbItem=`netstat -i |grep qvb | awk -F' ' '{print $1}'`
qbrItem=`netstat -i |grep qbr | awk -F' ' '{print $1}'`
qvoItem=`netstat -i |grep qvo | awk -F' ' '{print $1}'`

tapArray=(${tapItem// /});
qvbArray=(${qvbItem// /});
qbrArray=(${qbrItem// /});
qvoArray=(${qvoItem// /});

for((i=0; i<${#tapArray[@]}; ++i))
do
    echo "tap:" ${tapArray[$i]}
    ifconfig ${tapArray[$i]} mtu $mtuValue
    sleep .5
done

for((i=0; i<${#qvbArray[@]}; ++i))
do
    echo "qvb:" ${qvbArray[$i]}
    ifconfig ${qvbArray[$i]} mtu $mtuValue
    sleep .5
done

for((i=0; i<${#qbrArray[@]}; ++i))
do
    echo "qbr:" ${qbrArray[$i]}
    ifconfig ${qbrArray[$i]} mtu $mtuValue
    sleep .5
done

for((i=0; i<${#qvoArray[@]}; ++i))
do
    echo "qvo:" ${qvoArray[$i]}
    ifconfig ${qvoArray[$i]} mtu $mtuValue
    sleep .5
done

echo "change complete~"
