#!/bin/bash
#Usage example: ./grad_table.sh grad.txt

set -e


for b in $(seq 0 200 10000); do 
dirgen 12 -cartesian tmp.txt -quiet -force;
awk '{ if ($1 != "#") print $0, '$b'; }' < tmp.txt;
done > "$1"
