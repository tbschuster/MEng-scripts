#!/bin/bash

suffix=AP-pos

for f in Original/*; do

in=$f/*-$suffix
out=$(basename $f).mif

mrconvert $in.nii -fslgrad $in.bvec $in.bval $out -force

done

mrcat b*-reg-split.mif -axis 3 dwi_shells-$suffix.mif -force
rm b*-reg-split.mif