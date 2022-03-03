#!/bin/bash
#To use, example: ./convert_data.sh AP-neg

set -e
mkdir -p $1

for f in Original/*; do

in=$f/*-$1
out=$(basename $f).mif

mrconvert $in.nii -fslgrad $in.bvec $in.bval $1/$out -force

done

mrcat $1/b*-reg-split.mif -axis 3 $1/dwi_shells.mif -force
rm $1/b*-reg-split.mif
