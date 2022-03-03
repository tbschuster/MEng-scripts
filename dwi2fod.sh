#!/bin/bash
#To use, example: ../dwi2fod inside AP-neg folder

set -e

dwi2mask dwi_shells.mif mask.mif -force

dwi2fod msmt_csd dwi_shells.mif -mask mask.mif wm.txt wm_orig.mif gm.txt gm_orig.mif csf.txt csf_orig.mif -force

~/Documents/mrtrix3-tbschuster/bin/dwi2fod msmt_csd dwi_shells.mif -mask mask.mif wm_new.txt wm_new.mif gm_new.txt gm_new.mif csf_new.txt csf_new.mif -force


~/Documents/mrtrix3-tbschuster/bin/dwi2fod msmt_csd dsi8-reg-split.mif -mask mask.mif wm_new.txt wm_dsi8.mif gm_new.txt gm_dsi8.mif csf_new.txt csf_dsi8.mif -force
