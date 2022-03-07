#!/bin/bash
#Usage example: ./convert_data.sh AP-neg

set -e
mkdir -p $1



for f in Original/*; do

in=$f/*-$1
out=$(basename $f).mif

bvec=$f/*-$1.bvec

a=()
while IFS= read -r line || [ -n "$line" ]; do
    a+=("$line")
done < $bvec

echo -e ${a[1]}"\n"${a[2]}"\n"${a[0]} > $f/bvec_corrected.bvec

mrconvert $in.nii -fslgrad $f/bvec_corrected.bvec $in.bval $1/$out -force

done



mrcat $1/b*-reg-split.mif -axis 3 $1/dwi_shells.mif -force
rm $1/b*-reg-split.mif
