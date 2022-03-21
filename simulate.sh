#!/bin/bash
#Run within AP-neg folder
#Usage example: ../simulate.sh grad.txt output

set -e

shconv wm_orig.mif wm_response.txt gm_orig.mif gm_response.txt csf_orig.mif csf_response.txt - | sh2amp - "$1" "$2" -force


