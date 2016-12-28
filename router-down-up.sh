#!/bin/bash
#
#
#


# /root/admin-openrcv3.sh
source /root/admin-openrcv3.sh

routerIds=`neutron router-list | awk -F"|" '{print $2}' | sed '1,3d'`

idArray=(${routerIds// /});

for((i=0; i<${#idArray[@]}; ++i))
do
    echo "router:" ${idArray[$i]}
    neutron router-update ${idArray[$i]} --admin-state-up False
    sleep 5
    neutron router-update ${idArray[$i]} --admin-state-up True
    sleep 7
done
