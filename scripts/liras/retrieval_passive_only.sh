#!/usr/bin/env bash
#SBATCH -A C3SE2020-1-7 -p vera
#SBATCH -n 256
#SBATCH -c 2
#SBATCH -J clouds
#SBATCH -t 0-10:00:00

cd ${HOME}/src/crac
source ops/setup_vera.sh
export OMP_NUM_THREADS=1

s="SCENE"
s1="SHAPE1"
s2="SHAPE2"

#s="a"
#mpiexec -n 256 -output-filename passive_only python scripts/liras/retrieval_passive_only.py ${s} 2800 ${s1} ${s2} data/forward_simulations_${s}_noise.nc data/retrieval_${s}_${s1}_${s2}_po.nc
#
s="b"
mpiexec -output-filename passive_only -n 256 python scripts/liras/retrieval_passive_only.py ${s} 2200 ${s1} ${s2} data/forward_simulations_${s}_noise.nc data/retrieval_${s}_${s1}_${s2}_po.nc
