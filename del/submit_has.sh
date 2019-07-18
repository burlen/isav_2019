#!/bin/bash

if [[ $# != 1 ]]
then
  echo "ERROR: must pass batch number, 1 - 4 "
  echo "batch 1 iso M=4096 N=4096, M=4096 N=2048"
  echo "batch 2 iso M=4096 N=1024, M=4096 N=512"
  echo "batch 3 slice M=4096 N=4096, M=4096 N=2048"
  echo "batch 4 slice M=4096 N=1024, M=4096 N=512"
fi

if [[ $1 == 1 ]]
then
echo "submiting batch $1 iso M=4096 N=4096, M=4096 N=2048 ..."
O=1 T=1 L=1024 M=4096 N=4096 sbatch -N 256 -C haswell -t 00:30:00 -q premium -A m3090 -J in_transit_iso -d singleton ./in_transit_iso.sh
O=0 T=1 L=1024 M=4096 N=4096 sbatch -N 256 -C haswell -t 00:30:00 -q premium -A m3090 -J in_transit_iso -d singleton ./in_transit_iso.sh

O=1 T=1 L=1024 M=4096 N=2048 sbatch -N 192 -C haswell -t 00:30:00 -q premium -A m3090 -J in_transit_iso -d singleton ./in_transit_iso.sh
O=0 T=1 L=1024 M=4096 N=2048 sbatch -N 192 -C haswell -t 00:30:00 -q premium -A m3090 -J in_transit_iso -d singleton ./in_transit_iso.sh
fi

if [[ $1 == 2 ]]
then
echo "submiting batch $1 iso M=4096 N=1024, M=4096 N=512 ..."
O=1 T=1 L=1024 M=4096 N=1024 sbatch -N 160 -C haswell -t 00:30:00 -q premium -A m3090 -J in_transit_iso -d singleton ./in_transit_iso.sh
O=0 T=1 L=1024 M=4096 N=1024 sbatch -N 160 -C haswell -t 00:30:00 -q premium -A m3090 -J in_transit_iso -d singleton ./in_transit_iso.sh

O=1 T=1 L=1024 M=4096 N=512 sbatch -N 144 -C haswell -t 00:30:00 -q premium -A m3090 -J in_transit_iso -d singleton ./in_transit_iso.sh
O=0 T=1 L=1024 M=4096 N=512 sbatch -N 144 -C haswell -t 00:30:00 -q premium -A m3090 -J in_transit_iso -d singleton ./in_transit_iso.sh
fi

if [[ $1 == 3 ]]
then
echo "submiting batch $1 slice M=4096 N=4096, M=4096 N=2048 ..."
O=1 T=1 L=1024 M=4096 N=4096 sbatch -N 256 -C haswell -t 00:30:00 -q premium -A m3090 -J in_transit_slice -d singleton ./in_transit_slice.sh
O=0 T=1 L=1024 M=4096 N=4096 sbatch -N 256 -C haswell -t 00:30:00 -q premium -A m3090 -J in_transit_slice -d singleton ./in_transit_slice.sh

O=1 T=1 L=1024 M=4096 N=2048 sbatch -N 192 -C haswell -t 00:30:00 -q premium -A m3090 -J in_transit_slice -d singleton ./in_transit_slice.sh
O=0 T=1 L=1024 M=4096 N=2048 sbatch -N 192 -C haswell -t 00:30:00 -q premium -A m3090 -J in_transit_slice -d singleton ./in_transit_slice.sh
fi

if [[ $1 == 4 ]]
then
echo "submiting batch $1 slice M=4096 N=1024, M=4096 N=512 ..."
O=1 T=1 L=1024 M=4096 N=1024 sbatch -N 160 -C haswell -t 00:30:00 -q premium -A m3090 -J in_transit_slice -d singleton ./in_transit_slice.sh
O=0 T=1 L=1024 M=4096 N=1024 sbatch -N 160 -C haswell -t 00:30:00 -q premium -A m3090 -J in_transit_slice -d singleton ./in_transit_slice.sh

O=1 T=1 L=1024 M=4096 N=512 sbatch -N 144 -C haswell -t 00:30:00 -q premium -A m3090 -J in_transit_slice -d singleton ./in_transit_slice.sh
O=0 T=1 L=1024 M=4096 N=512 sbatch -N 144 -C haswell -t 00:30:00 -q premium -A m3090 -J in_transit_slice -d singleton ./in_transit_slice.sh
fi
