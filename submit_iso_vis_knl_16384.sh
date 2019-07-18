#!/bin/bash -l
#SBATCH -N 274
#SBATCH -C knl
#SBATCH -t 00:30:00
#SBATCH -q debug
#SBATCH -A m3090
#SBATCH -J in_transit_iso_vis_knl
#SBATCH -d singleton
#SBATCH -o "int_iso_vis_knl_16384-%j.out"

set -x

echo "============================================="
echo "IsoSurfacePartitioner                        "
echo "============================================="
O=1 T=1 L=4096 M=16384 N=2048 ./in_transit_iso_vis_knl.sh
echo "============================================="

echo "Job completed!"
