#!/bin/bash

O=1 T=1 L=1024 M=4096 N=4096 sbatch -N 256 -C haswell -t 00:30:00 -q debug -A m3090 -J in_transit_iso -d singleton ./in_transit_iso.sh
O=0 T=1 L=1024 M=4096 N=4096 sbatch -N 256 -C haswell -t 00:30:00 -q debug -A m3090 -J in_transit_iso -d singleton ./in_transit_iso.sh

O=1 T=1 L=1024 M=4096 N=2048 sbatch -N 192 -C haswell -t 00:30:00 -q debug -A m3090 -J in_transit_iso -d singleton ./in_transit_iso.sh
O=0 T=1 L=1024 M=4096 N=2048 sbatch -N 192 -C haswell -t 00:30:00 -q debug -A m3090 -J in_transit_iso -d singleton ./in_transit_iso.sh

O=1 T=1 L=1024 M=4096 N=1024 sbatch -N 160 -C haswell -t 00:30:00 -q debug -A m3090 -J in_transit_iso -d singleton ./in_transit_iso.sh
O=0 T=1 L=1024 M=4096 N=1024 sbatch -N 160 -C haswell -t 00:30:00 -q debug -A m3090 -J in_transit_iso -d singleton ./in_transit_iso.sh

O=1 T=1 L=1024 M=4096 N=512 sbatch -N 144 -C haswell -t 00:30:00 -q debug -A m3090 -J in_transit_iso -d singleton ./in_transit_iso.sh
O=0 T=1 L=1024 M=4096 N=512 sbatch -N 144 -C haswell -t 00:30:00 -q debug -A m3090 -J in_transit_iso -d singleton ./in_transit_iso.sh


O=1 T=1 L=1024 M=4096 N=4096 sbatch -N 256 -C haswell -t 00:30:00 -q debug -A m3090 -J in_transit_slice -d singleton ./in_transit_slice.sh
O=0 T=1 L=1024 M=4096 N=4096 sbatch -N 256 -C haswell -t 00:30:00 -q debug -A m3090 -J in_transit_slice -d singleton ./in_transit_slice.sh

O=1 T=1 L=1024 M=4096 N=2048 sbatch -N 192 -C haswell -t 00:30:00 -q debug -A m3090 -J in_transit_slice -d singleton ./in_transit_slice.sh
O=0 T=1 L=1024 M=4096 N=2048 sbatch -N 192 -C haswell -t 00:30:00 -q debug -A m3090 -J in_transit_slice -d singleton ./in_transit_slice.sh

O=1 T=1 L=1024 M=4096 N=1024 sbatch -N 160 -C haswell -t 00:30:00 -q debug -A m3090 -J in_transit_slice -d singleton ./in_transit_slice.sh
O=0 T=1 L=1024 M=4096 N=1024 sbatch -N 160 -C haswell -t 00:30:00 -q debug -A m3090 -J in_transit_slice -d singleton ./in_transit_slice.sh

O=1 T=1 L=1024 M=4096 N=512 sbatch -N 144 -C haswell -t 00:30:00 -q debug -A m3090 -J in_transit_slice -d singleton ./in_transit_slice.sh
O=0 T=1 L=1024 M=4096 N=512 sbatch -N 144 -C haswell -t 00:30:00 -q debug -A m3090 -J in_transit_slice -d singleton ./in_transit_slice.sh

