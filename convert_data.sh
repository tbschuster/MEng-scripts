#!/bin/bash
#To use, example: ./convert_data.sh AP-neg

set -e
mkdir -p $1

bvec="Original/b2000-reg-split/b2000-AP-neg.bvec"

while IFS= read -r line || [ -n "$line" ]; do
    a+=("$line")
done < $bvec

echo -e ${a[1]}"\n"${a[2]}"\n"${a[0]} > bvec_corrected.bvec


for f in Original/*; do

in=$f/*-$1
out=$(basename $f).mif

mrconvert $in.nii -fslgrad $in.bvec $in.bval $1/$out -force

done

mrcat $1/b*-reg-split.mif -axis 3 $1/dwi_shells.mif -force
rm $1/b*-reg-split.mif
