#!/bin/bash
#Run within AP-neg folder
#Usage example: ../run_analysis

set -e

#./grad_table.sh grad.txt

# Generate responses using MATLAB, instructions in response_documentation.m

for folder in AP-neg; do
#./convert_data.sh $folder
(
cd $folder
#../get_response.sh
#../dwi2fod.sh
#../simulate.sh ../grad.txt dwi_sim.mif

../sample_selection.sh dwi_sim.mif 100 dwi_sim_subsample.mif
../add_noise.sh dwi_sim_subsample.mif 50 dwi_sim_subsample_noise.mif

)
done