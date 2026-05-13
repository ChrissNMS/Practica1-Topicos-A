#!/bin/bash

# --- FIGURA 3: Matriz-Matriz ---
exp_mm=(8 9 10 11)
outputFile="mm_cblas.dat"

echo "Ejecutando CBLAS Matriz-Matriz..."
> $outputFile

for e in "${exp_mm[@]}"; do
    n=$((2**e))
    time=$(./dgemm_test $n)
    echo "$n $time" >> $outputFile
    echo "n=2^$e listo"
done

echo "¡Listo! Archivo mm_cblas.dat generado."