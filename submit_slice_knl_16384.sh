#!/bin/bash -l
#SBATCH -N 484
#SBATCH -C knl
#SBATCH -t 05:00:00
#SBATCH -q premium
#SBATCH -A m3090
#SBATCH -J in_transit_slice_knl
#SBATCH -d singleton
#SBATCH -o "int_slice_knl_16384-%j.out"

set -x

echo "============================================="
echo "PlanarSlicePartitioner                       "
echo "============================================="
O=1 T=1 L=4096 M=16384 N=16384 ./in_transit_slice_knl.sh
echo "============================================="
O=1 T=1 L=4096 M=16384 N=8192  ./in_transit_slice_knl.sh
echo "============================================="
O=1 T=1 L=4096 M=16384 N=4096  ./in_transit_slice_knl.sh
echo "============================================="
O=1 T=1 L=4096 M=16384 N=2048  ./in_transit_slice_knl.sh
echo "============================================="
O=1 T=1 L=4096 M=16384 N=1024  ./in_transit_slice_knl.sh
echo "============================================="
O=1 T=1 L=4096 M=16384 N=512   ./in_transit_slice_knl.sh
echo "============================================="
O=1 T=1 L=4096 M=16384 N=256   ./in_transit_slice_knl.sh
echo "============================================="
O=1 T=1 L=4096 M=16384 N=128   ./in_transit_slice_knl.sh
echo "============================================="

echo "#############################################"

echo "============================================="
echo "BlockPartitioner                             "
echo "============================================="
O=0 T=1 L=4096 M=16384 N=16384 ./in_transit_slice_knl.sh
echo "============================================="
O=0 T=1 L=4096 M=16384 N=8192  ./in_transit_slice_knl.sh
echo "============================================="
O=0 T=1 L=4096 M=16384 N=4096  ./in_transit_slice_knl.sh
echo "============================================="
O=0 T=1 L=4096 M=16384 N=2048  ./in_transit_slice_knl.sh
echo "============================================="
O=0 T=1 L=4096 M=16384 N=1024  ./in_transit_slice_knl.sh
echo "============================================="
O=0 T=1 L=4096 M=16384 N=512   ./in_transit_slice_knl.sh
echo "============================================="
O=0 T=1 L=4096 M=16384 N=256   ./in_transit_slice_knl.sh
echo "============================================="
#O=0 T=1 L=4096 M=16384 N=128   ./in_transit_slice_knl.sh
#echo "============================================="
echo "Job completed!"
