#!/bin/bash -l

if [[ -z "${O}" ]]
then
  echo "ERROR: O (prtitioner optimization) was not provided"
  exit -1
fi

if [[ -z "${T}" ]]
then
  echo "ERROR: T (time step) was not provided"
  exit -1
fi

if [[ -z "${L}" ]]
then
  echo "ERROR: L (number of cells) was not provided"
  exit -1
fi

if [[ -z "${M}" ]]
then
  echo "ERROR: M (sim job size) was not provided"
  exit -1
fi

if [[ -z "${N}" ]]
then
  echo "ERROR: N (end point job size) was not provided"
  exit -1
fi

S=
if [[ "${O}" == "0" ]]
then
  S=./configs/iso_extract_knl.xml
elif [[ "${O}" == "1" ]]
then
  S=./configs/iso_extract_opt_knl.xml
else
  echo "ERROR; O=${O} must be 0 or 1"
  exit -1
fi

RM=`echo "${M}/68 + 1" | bc`
RN=`echo "${N}/68 + 1" | bc`

D=`date +%Y_%j_%H_%M`

echo "O=${O} T=${T} L=${L} M=${M} N=${N} RM=${RM} RN=${RN} S=${S} D=${D}"

bld=`echo -e '\e[1m'`
red=`echo -e '\e[31m'`
grn=`echo -e '\e[32m'`
blu=`echo -e '\e[36m'`
wht=`echo -e '\e[0m'`

rm -rf ./isos_knl/*
rm data_iso_knl.bp*

module use /usr/common/software/sensei/modulefiles
module load sensei/3.0.0-vtk-shared

set -x

export TIMER_ENABLE=0
export MEMPROF_INTERVAL=0.5

export TIMER_LOG_FILE=./logs_knl/${SLURM_JOB_ID}_osc_iso_knl_o${O}_t${T}_l${L}_m${M}_n${N}_${D}.time
export MEMPROF_LOG_FILE=./logs_knl/${SLURM_JOB_ID}_osc_iso_knl_o${O}_t${T}_l${L}_m${M}_n${N}_${D}.mem

cat ./configs/write_adios1_flexpath_iso_knl.xml | sed "s/.*/$blu&$wht/"

srun -N ${RM} -n ${M} -r 0 oscillator -t ${T} -s ${L},${L},${L} -e 0,1,0,1,0,1 \
  -b ${M} -f ./configs/write_adios1_flexpath_iso_knl.xml -g 1 -p 0  \
  ./inputs/conf.osc 2>&1 | sed "s/.*/$red&$wht/" &

# wait for the job to start
delay=300
set +x
while [[ True ]]
do
  if [[ -e "data_iso_knl.bp_writer_info.txt" ]]
  then
    break
  elif [[ ${delay} -le 0 ]]
  then
    echo "ERROR: max delay exceded"
    exit -1
  else
    echo -n "."
    sleep 1s
    let delay=${delay}-1
  fi
done
let delay=300-${delay}
echo "found at ${delay}s"
set -x

export TIMER_LOG_FILE=./logs_knl/${SLURM_JOB_ID}_aep_iso_knl_o${O}_t${T}_l${L}_m${M}_n${N}_${D}.time
export MEMPROF_LOG_FILE=./logs_knl/${SLURM_JOB_ID}_aep_iso_knl_o${O}_t${T}_l${L}_m${M}_n${N}_${D}.mem

cat ${S} | sed "s/.*/$blu&$wht/"

srun -N ${RN} -n ${N} -r ${RM} ADIOS1EndPoint -r FLEXPATH \
  -f ${S} data_iso_knl.bp 2>&1 | sed "s/.*/$grn&$wht/"

