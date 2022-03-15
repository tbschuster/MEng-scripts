#!/bin/bash
#Usage example: ../conv_noise.sh  inside AP-neg folder

set -e

shconv wm_orig.mif wm.txt gm_orig.mif gm.txt csf_orig.mif csf.txt sh.mif -force

sh2amp sh.mif dwi_shells.mif dwi_predicted_orig.mif -force


mrcalc dwi_predicted_orig.mif randn 50 -mult -add dwi_noisy_orig.mif -force

for b in $(seq 0 200 10000); do

dirgen 12 -cartesian tmp.txt; -quiet -force
awk ‘{ if ($1 != "#") print $0, "$b"; }’ < tmp.txt

done > grad.txt

rm sh.mif