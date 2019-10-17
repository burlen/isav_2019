#!/bin/bash -l
#SBATCH -N 123
#SBATCH -C knl
#SBATCH -t 01:00:00
#SBATCH -q premium
#SBATCH -A m2956
#SBATCH -J in_transit_gantt_slice_knl
#SBATCH -d singleton
#SBATCH -o "in_transit_gantt_slice_knl-%j.out"

set -x

echo "============================================="
echo "PlanarSlicePartitioner                       "
echo "============================================="
O=1 T=1 L=2048 M=8192 N=128 PROFILER_ENABLE=3 ./in_transit_slice_knl.sh
echo "============================================="

echo "#############################################"

echo "============================================="
echo "BlockPartitioner                             "
echo "============================================="
O=0 T=1 L=2048 M=8192 N=128 PROFILER_ENABLE=3 ./in_transit_slice_knl.sh
echo "============================================="

