#!/bin/bash -l
#SBATCH -N 260
#SBATCH -C haswell
#SBATCH -t 01:00:00
#SBATCH -q premium
#SBATCH -A m2956
#SBATCH -J in_transit_gantt_slice_has
#SBATCH -d singleton
#SBATCH -o "in_transit_gantt_slice_has-%j.out"

set -x

echo "============================================="
echo "PlanarSlicePartitioner                       "
echo "============================================="
O=1 T=1 L=4096 M=8192 N=128 PROFILER_ENABLE=3 ./in_transit_slice_has.sh
echo "============================================="

echo "#############################################"

echo "============================================="
echo "BlockPartitioner                             "
echo "============================================="
O=0 T=1 L=4096 M=8192 N=128 PROFILER_ENABLE=3 ./in_transit_slice_has.sh
echo "============================================="

