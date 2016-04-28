#!/bin/bash

#Gathers PV information and if Bound or Available DC,LOC,SIZE,Bound,Available
#

NDCLOC=$(oc get nodes |awk '/datacenter/{print $2}'|cut -d',' -f1,5|sort -u|cut -d',' -f1|cut -d'=' -f2)
NLOC=$(oc get nodes |awk '/datacenter/{print $2}'|cut -d',' -f1,5|sort -u|cut -d',' -f2|cut -d'=' -f2)

for i in $(oc get pv |awk '/Gi/{print $3}'|sort -u)
 do

 GASIZE=$(oc get pv|awk "/${i}/ && /Available/"'{print $3 $5}' ORS=' ')
 GBSIZE=$(oc get pv|awk "/${i}/ && /Bound/"'{print $3 $5}' ORS=' ')
 PVAVCNT=$(echo ${GASIZE}|awk '{print NF}')
 PVBCNT=$(echo ${GBSIZE}|awk '{print NF}')
  
 echo "${NDCLOC},${NLOC},${i},${PVBCNT},${PVAVCNT}"
done
