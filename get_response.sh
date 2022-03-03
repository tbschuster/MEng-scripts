#!/bin/bash
#To use, example: ./get_response.sh

set -e

dwi2response dhollander dwi_shells.mif wm.txt gm.txt csf.txt -force

awk '{ if ($2=="Shells:") print $0",10000"; else print $0} END { print "0 0 0 0 0 0"; }' wm.txt > wm_new.txt

awk '{ if ($2=="Shells:") print $0",10000"; else print $0} END { print "0"; }' gm.txt > gm_new.txt

awk '{ if ($2=="Shells:") print $0",10000"; else print $0} END { print "0"; }' csf.txt > csf_new.txt
