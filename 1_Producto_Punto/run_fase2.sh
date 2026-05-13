#!/bin/bash
exponents=(21 23 24 25 26)
outputFile="dot_fase2.dat"
> $outputFile
echo "Ejecutando Fase 2: Tradicional vs Unrolling..."
for e in "${exponents[@]}"; do
    n=$((2**e))
    times=$(./dot_fase2 $n)
    echo "$n $times" >> $outputFile
    echo "n=2^$e listo"
done