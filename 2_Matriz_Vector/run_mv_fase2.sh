#!/bin/bash
# Exponentes: 1024, 2048, 4096, 8192, 16384
exponents=(10 11 12 13 14)
outputFile="mv_fase2.dat"
> $outputFile

echo "Ejecutando Fase 2: Matriz-Vector..."

for e in "${exponents[@]}"; do
    n=$((2**e))
    echo "Calculando n = $n..."
    times=$(./mv_fase2 $n)
    # Escribimos el tamaño n seguido de los tiempos en el archivo
    echo "$n $times" >> $outputFile
done

echo "¡Listo! Datos guardados en mv_fase2.dat"