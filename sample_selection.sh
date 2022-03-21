#!/bin/bash
#Run within AP-neg folder
#Usage example: ../sample_selection.sh input num output

set -e


a=( $(mrinfo $1 -size) ); a=${a[3]}

idx=$(seq 0 1 $a | gshuf | head -n $2 | xargs | tr ' ' ',')

mrconvert $1 -coord 3 $idx $3
