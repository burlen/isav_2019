#!/bin/bash

python plot.py run_3/in_transit_iso_has-23150227.csv 'Iso-surface Haswell L=4096 M=8192'
python plot.py run_3/in_transit_iso_knl-23150244.csv 'Iso-surface KNL L=2048 M=8192'

python plot.py run_3/in_transit_slice_has-23150232.csv 'Slice Haswell L=4096 M=8192'
python plot.py run_3/in_transit_slice_knl-23150248.csv 'Slice KNL L=2048 M=8192'


