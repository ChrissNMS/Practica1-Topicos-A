#!/bin/bash
exponents=(10 12 13 14)
outputFile="mv_cblas.dat"
> $outputFile
for e in "${exponents[@]}"; do
    n=$((2**e))
    time=$(./dgemv_test $n)
    echo "$n $time" >> $outputFile
done