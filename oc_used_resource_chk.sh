#!/bin/bash

#Gathers Allocated resources for each OSE node 
#   CPU Requests    CPU Limits    Memory Requests    Memory Limits
#  ────────────     ──────────    ───────────────    ─────────────
#    0 (0%)          0 (0%)             0 (0%)             0 (0%)


for i in $(oc get nodes|awk '/datacenter/{print $1}')
 do
 RESOURCES=$(oc describe node ${i} |grep -A4 "Allocated resources:"|awk '/%\)/{print $1"," $2"," $3"," $4"," $5"," $6"," $7"," $8}')
 echo "${i},${RESOURCES}"
done
