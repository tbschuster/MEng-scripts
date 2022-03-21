#!/bin/bash
#Usage example: ../add_noise.sh input noise output

set -e

mrcalc "$1" randn $2 -mult -add "$3" -force

