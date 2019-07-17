#!/bin/bash -l
#SBATCH -N 243
#SBATCH -C knl
#SBATCH -t 04:00:00
#SBATCH -q premium
#SBATCH -A m3090
#SBATCH -J in_transit_iso_knl
#SBATCH -d singleton
#SBATCH -o "in_transit_iso_knl-%j.out"

set -x

echo "============================================="
echo "IsoSurfacePartitioner                        "
echo "============================================="
O=1 T=1 L=2048 M=8192 N=8192 ./in_transit_iso_knl.sh
echo "============================================="
O=1 T=1 L=2048 M=8192 N=4096 ./in_transit_iso_knl.sh
echo "============================================="
O=1 T=1 L=2048 M=8192 N=2048 ./in_transit_iso_knl.sh
echo "============================================="
O=1 T=1 L=2048 M=8192 N=1024 ./in_transit_iso_knl.sh
echo "============================================="
O=1 T=1 L=2048 M=8192 N=512  ./in_transit_iso_knl.sh
echo "============================================="
O=1 T=1 L=2048 M=8192 N=256  ./in_transit_iso_knl.sh
echo "============================================="

echo "#############################################"

echo "============================================="
echo "BlockPartitioner                             "
echo "============================================="
O=0 T=1 L=2048 M=8192 N=8192 ./in_transit_iso_knl.sh
echo "============================================="
O=0 T=1 L=2048 M=8192 N=4096 ./in_transit_iso_knl.sh
echo "============================================="
O=0 T=1 L=2048 M=8192 N=2048 ./in_transit_iso_knl.sh
echo "============================================="
O=0 T=1 L=2048 M=8192 N=1024 ./in_transit_iso_knl.sh
echo "============================================="
O=0 T=1 L=2048 M=8192 N=512  ./in_transit_iso_knl.sh
echo "============================================="
O=0 T=1 L=2048 M=8192 N=256  ./in_transit_iso_knl.sh
echo "============================================="


