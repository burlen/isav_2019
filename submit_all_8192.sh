#!/bin/bash

export ENABLE_TIMER=0

#sbatch submit_iso_has_8192.sh
sbatch submit_slice_has_8192.sh
#sbatch submit_iso_knl_8192.sh
sbatch submit_slice_knl_8192.sh
