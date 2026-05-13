#!/bin/bash
# Exponentes: 256, 512, 1024
exponents=(8 9 10)
outputFile="mm_fase2.dat"
> $outputFile

echo "Ejecutando Fase 2: Matriz-Matriz..."

for e in "${exponents[@]}"; do
    n=$((2**e))
    echo "Calculando n = $n..."
    # Ejecutamos el programa y guardamos los tiempos
    times=$(./mm_fase2 $n)
    # Escribimos el tamaño n seguido de los tiempos en el archivo
    echo "$n $times" >> $outputFile
done

echo "¡Listo! Datos guardados en mm_fase2.dat"