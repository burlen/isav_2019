#!/bin/bash

if [[ $# != 1 ]]
then
  echo "ERROR: must pass batch number, 1 - 8 "
fi

if [[ $1 == 1 ]]
then
O=1 T=1 L=2048 M=4096 N=4096 sbatch -N 123 -C knl -t 00:30:00 -q debug -A m3090 -J in_transit_iso_knl -d singleton ./in_transit_iso_knl.sh
O=0 T=1 L=2048 M=4096 N=4096 sbatch -N 123 -C knl -t 00:30:00 -q debug -A m3090 -J in_transit_iso_knl -d singleton ./in_transit_iso_knl.sh
fi

if [[ $1 == 2 ]]
then
O=1 T=1 L=2048 M=4096 N=2048 sbatch -N 93 -C knl -t 00:30:00 -q debug -A m3090 -J in_transit_iso_knl -d singleton ./in_transit_iso_knl.sh
O=0 T=1 L=2048 M=4096 N=2048 sbatch -N 93 -C knl -t 00:30:00 -q debug -A m3090 -J in_transit_iso_knl -d singleton ./in_transit_iso_knl.sh
fi

if [[ $1 == 3 ]]
then
O=1 T=1 L=2048 M=4096 N=1024 sbatch -N 78 -C knl -t 00:30:00 -q debug -A m3090 -J in_transit_iso_knl -d singleton ./in_transit_iso_knl.sh
O=0 T=1 L=2048 M=4096 N=1024 sbatch -N 78 -C knl -t 00:30:00 -q debug -A m3090 -J in_transit_iso_knl -d singleton ./in_transit_iso_knl.sh
fi

if [[ $1 == 4 ]]
then
O=1 T=1 L=2048 M=4096 N=512 sbatch -N 70 -C knl -t 00:30:00 -q debug -A m3090 -J in_transit_iso_knl -d singleton ./in_transit_iso_knl.sh
O=0 T=1 L=2048 M=4096 N=512 sbatch -N 70 -C knl -t 00:30:00 -q debug -A m3090 -J in_transit_iso_knl -d singleton ./in_transit_iso_knl.sh
fi

if [[ $1 == 5 ]]
then
O=1 T=1 L=2048 M=4096 N=4096 sbatch -N 123 -C knl -t 00:30:00 -q debug -A m3090 -J in_transit_slice_knl -d singleton ./in_transit_slice_knl.sh
O=0 T=1 L=2048 M=4096 N=4096 sbatch -N 123 -C knl -t 00:30:00 -q debug -A m3090 -J in_transit_slice_knl -d singleton ./in_transit_slice_knl.sh
fi

if [[ $1 == 6 ]]
then
O=1 T=1 L=2048 M=4096 N=2048 sbatch -N 93 -C knl -t 00:30:00 -q debug -A m3090 -J in_transit_slice_knl -d singleton ./in_transit_slice_knl.sh
O=0 T=1 L=2048 M=4096 N=2048 sbatch -N 93 -C knl -t 00:30:00 -q debug -A m3090 -J in_transit_slice_knl -d singleton ./in_transit_slice_knl.sh
fi

if [[ $1 == 7 ]]
then
O=1 T=1 L=2048 M=4096 N=1024 sbatch -N 78 -C knl -t 00:30:00 -q debug -A m3090 -J in_transit_slice_knl -d singleton ./in_transit_slice_knl.sh
O=0 T=1 L=2048 M=4096 N=1024 sbatch -N 78 -C knl -t 00:30:00 -q debug -A m3090 -J in_transit_slice_knl -d singleton ./in_transit_slice_knl.sh
fi

if [[ $1 == 8 ]]
then
O=1 T=1 L=2048 M=4096 N=512 sbatch -N 70 -C knl -t 00:30:00 -q debug -A m3090 -J in_transit_slice_knl -d singleton ./in_transit_slice_knl.sh
O=0 T=1 L=2048 M=4096 N=512 sbatch -N 70 -C knl -t 00:30:00 -q debug -A m3090 -J in_transit_slice_knl -d singleton ./in_transit_slice_knl.sh
fi
