#!/bin/bash -l
#SBATCH -N 1026
#SBATCH -C haswell
#SBATCH -t 05:00:00
#SBATCH -q premium
#SBATCH -A m3090
#SBATCH -J in_transit_slice_has
#SBATCH -d singleton
#SBATCH -o "int_slice_has_16384-%j.out"

set -x

echo "============================================="
echo "PlanarSlicePartitioner                       "
echo "============================================="
O=1 T=1 L=8192 M=16384 N=16384 ./in_transit_slice_has.sh
echo "============================================="
O=1 T=1 L=8192 M=16384 N=8192 ./in_transit_slice_has.sh
echo "============================================="
O=1 T=1 L=8192 M=16384 N=4096 ./in_transit_slice_has.sh
echo "============================================="
O=1 T=1 L=8192 M=16384 N=2048 ./in_transit_slice_has.sh
echo "============================================="
O=1 T=1 L=8192 M=16384 N=1024 ./in_transit_slice_has.sh
echo "============================================="
O=1 T=1 L=8192 M=16384 N=512  ./in_transit_slice_has.sh
echo "============================================="
O=1 T=1 L=8192 M=16384 N=256  ./in_transit_slice_has.sh
echo "============================================="
O=1 T=1 L=8192 M=16384 N=128  ./in_transit_slice_has.sh
echo "============================================="

echo "#############################################"

echo "============================================="
echo "BlockPartitioner                             "
echo "============================================="
O=0 T=1 L=8192 M=16384 N=16384 ./in_transit_slice_has.sh
echo "============================================="
O=0 T=1 L=8192 M=16384 N=8192 ./in_transit_slice_has.sh
echo "============================================="
O=0 T=1 L=8192 M=16384 N=4096 ./in_transit_slice_has.sh
echo "============================================="
O=0 T=1 L=8192 M=16384 N=2048 ./in_transit_slice_has.sh
echo "============================================="
O=0 T=1 L=8192 M=16384 N=1024 ./in_transit_slice_has.sh
echo "============================================="
O=0 T=1 L=8192 M=16384 N=512  ./in_transit_slice_has.sh
echo "============================================="
O=0 T=1 L=8192 M=16384 N=256  ./in_transit_slice_has.sh
echo "============================================="
#O=0 T=1 L=8192 M=16384 N=128  ./in_transit_slice_has.sh
#echo "============================================="
echo "Job completed!"
