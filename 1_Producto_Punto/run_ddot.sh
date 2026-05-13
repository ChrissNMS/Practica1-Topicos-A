#!/bin/bash

# Los mismos exponentes que usamos en Octave
exponents=(21 23 24 25 26)
outputFile="ddot_cblas.dat"

# Limpiar el archivo si ya existe
> $outputFile 

echo "Iniciando pruebas con CBLAS en WSL..."

for e in "${exponents[@]}"; do
    # Calcular 2^e
    n=$((2**e))
    
    echo "Ejecutando para n = 2^$e ($n)..."
    
    # Ejecutar el programa y capturar el tiempo que imprime
    time=$(./ddot_test $n)
    
    # Guardar en formato: [Tamaño n] [Tiempo]
    echo "$n $time" >> $outputFile
done

echo "¡Pruebas terminadas! Datos guardados en $outputFile"