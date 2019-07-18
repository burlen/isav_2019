#!/bin/bash -l
#SBATCH -N 514
#SBATCH -C haswell
#SBATCH -t 04:00:00
#SBATCH -q premium
#SBATCH -A m3090
#SBATCH -J in_transit_slice_has
#SBATCH -d singleton
#SBATCH -o "in_transit_slice_has-%j.out"

set -x

echo "============================================="
echo "PlanarSlicePartitioner                       "
echo "============================================="
O=1 T=1 L=4096 M=8192 N=8192 ./in_transit_slice_has.sh
echo "============================================="
O=1 T=1 L=4096 M=8192 N=4096 ./in_transit_slice_has.sh
echo "============================================="
O=1 T=1 L=4096 M=8192 N=2048 ./in_transit_slice_has.sh
echo "============================================="
O=1 T=1 L=4096 M=8192 N=1024 ./in_transit_slice_has.sh
echo "============================================="
O=1 T=1 L=4096 M=8192 N=512  ./in_transit_slice_has.sh
echo "============================================="
O=1 T=1 L=4096 M=8192 N=256  ./in_transit_slice_has.sh
echo "============================================="
O=1 T=1 L=4096 M=8192 N=128  ./in_transit_slice_has.sh
echo "============================================="

echo "#############################################"

echo "============================================="
echo "BlockPartitioner                             "
echo "============================================="
O=0 T=1 L=4096 M=8192 N=8192 ./in_transit_slice_has.sh
echo "============================================="
O=0 T=1 L=4096 M=8192 N=4096 ./in_transit_slice_has.sh
echo "============================================="
O=0 T=1 L=4096 M=8192 N=2048 ./in_transit_slice_has.sh
echo "============================================="
O=0 T=1 L=4096 M=8192 N=1024 ./in_transit_slice_has.sh
echo "============================================="
O=0 T=1 L=4096 M=8192 N=512  ./in_transit_slice_has.sh
echo "============================================="
O=0 T=1 L=4096 M=8192 N=256  ./in_transit_slice_has.sh
echo "============================================="
O=0 T=1 L=4096 M=8192 N=128  ./in_transit_slice_has.sh
echo "============================================="
