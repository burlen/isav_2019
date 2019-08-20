#!/bin/bash

# ave num active blocks from part
#nab_iso=1857.3 #ave
nab_iso=2018.5 # median
nab_slice=830

python plot.py run_3/in_transit_iso_has-23150227.csv 'Iso-surface Haswell. ${\bf 4096^3}$ cells, 8192 blocks, M=8192, N=128..8192' ${nab_iso}
python plot.py run_3/in_transit_iso_knl-23150244.csv 'Iso-surface KNL. ${\bf 2048^3}$ cells, 8192 blocks, M=8192, N=128..8192' ${nab_iso}

python plot.py run_3/in_transit_slice_has-23150232.csv 'Slice Haswell. ${\bf 4096^3}$ cells, 8192 blocks, M=8192, N=128..8192' ${nab_slice}
python plot.py run_3/in_transit_slice_knl-23150248.csv 'Slice KNL. ${\bf 2048^3}$ cells, 8192 blocks, M=8192, N=128..8192' ${nab_slice}

python plot.py run_3/in_transit_slice_has-23240948.csv 'Slice Haswell. ${\bf 4096^3}$ cells, 8192 blocks, M=8192, N=128..8192' ${nab_slice}
#python plot.py run_3/in_transit_slice_knl-.csv 'Slice KNL L=2048 M=8192'
