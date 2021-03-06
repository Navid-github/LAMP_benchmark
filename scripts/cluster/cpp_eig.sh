#!/bin/bash

source ${HOME}/.zshrc.lamp
cd ${LAMP_EXPERIMENTS}/cpp/eigen

echo "-----------------------------"
echo "$1 Threads"
echo "-----------------------------"
export MKL_NUM_THREADS=$1
export OMP_NUM_THREADS=$1
export LD_LIBRARY_PATH="${MKLROOT}/../lib/intel64:$LD_LIBRARY_PATH"  # Runtime cannot find libiomp5.

make clean
make -j 24
./bench_eigen
make clean
