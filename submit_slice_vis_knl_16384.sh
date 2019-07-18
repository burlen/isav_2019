#!/bin/bash -l
#SBATCH -N 274
#SBATCH -C knl
#SBATCH -t 00:30:00
#SBATCH -q debug
#SBATCH -A m3090
#SBATCH -J in_transit_slice_vis_knl
#SBATCH -d singleton
#SBATCH -o "int_slice_knl_vis_16384-%j.out"

set -x

echo "============================================="
echo "PlanarSlicePartitioner                       "
echo "============================================="
O=1 T=1 L=4096 M=16384 N=16384 ./in_transit_slice_vis_knl.sh
echo "============================================="

echo "Job completed!"
