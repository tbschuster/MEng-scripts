#!/bin/bash
#To use, example: ../stats_noise.sh inside AP-neg folder

set -e
#For different noise levels, output the difference between original and simulation (WM)

for noise in $(seq 0 5 100); do 
../add_noise.sh dwi_sim_subsample.mif $noise dwi_sim_subsample_noise.mif -force
~/Documents/mrtrix3-tbschuster/bin/dwi2fod msmt_csd dwi_sim_subsample_noise.mif wm_response.txt wm_sim.mif gm_response.txt gm_sim.mif csf_response.txt csf_sim.mif -mask mask.mif -force
mrcalc wm_orig.mif wm_sim.mif -sub - | mrmath - rms -axis 3 - | mrstats - -mask ROI.mif -output mean 


done > noise_stats.txt