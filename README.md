# Práctica 1: Optimización de Código y Análisis de Rendimiento
**Asignatura:** Tópicos A  
**Estudiante:** Christofer Alberto Gutiérrez Pacheco  
**Institución:** Universidad de Magallanes (UMAG)  
**Fecha de Entrega:** 13 de Mayo de 2026  

## 1. Descripción General
Este proyecto analiza y compara el rendimiento del **Producto Punto** implementado en **Octave** y **C**. El objetivo principal es observar la eficiencia de las bibliotecas de alto rendimiento (**CBLAS/OpenBLAS**) frente a implementaciones manuales y técnicas de optimización como el **Loop Unrolling**.

## 2. Estructura del Proyecto
```text
├── 1_Producto_Punto/
│   ├── dot.m               # Función manual (ciclo for) en Octave
│   ├── dot_test.m          # Benchmark Octave (Operador * vs manual)
│   ├── dot.dat             # Tiempos generados por Octave
│   ├── ddot_test.c         # Código C con llamadas a cblas_ddot
│   ├── ddot_cblas.dat      # Tiempos de CBLAS en C
│   ├── dot_fase2.c         # Implementación: Tradicional vs Unrolling vs CBLAS
│   ├── dot_fase2.dat       # Tiempos de comparación de optimización
│   ├── run_ddot.sh         # Script Bash para pruebas de Cblas
│   └── run_fase2.sh        # Script Bash para pruebas de optimización
├── 2_Matriz_Vector/
│   ├── mv_test.m           # Benchmark Octave para Matriz-Vector (Operador *)
│   ├── mv.dat              # Tiempos de ejecución obtenidos en Octave
│   ├── mv_test.c           # Código C: CBLAS vs Row Major vs Column Major
│   ├── mv_fase2.dat        # Tiempos comparativos de acceso a memoria
│   └── run_mv.sh           # Script Bash para automatizar pruebas de MV
├── 3_Matriz_Matriz/
│   ├── mm_test.m           # Benchmark Octave para Matriz-Matriz
│   ├── mm.dat              # Tiempos de ejecución obtenidos en Octave
│   ├── mm_test.c           # Código C: CBLAS vs Row Major vs Column Major
│   ├── mm_fase2.dat        # Tiempos de comparación para multiplicación de matrices
│   └── run_mm.sh           # Script Bash para automatizar pruebas de MM
├── images/                 # Gráficas generadas (Figuras 1 a 6)
├── plot_producto_punto.gp  # Script de Gnuplot para todas las operaciones
└── Makefile                # Automatización de compilación y limpieza

## 3. Instrucciones de Ejecución

Generación de Gráficas:

Para procesar los datos .dat y generar las imágenes finales:

Bash

    make clean
    make run

Contacto: julio.aguila@umag.cl (Profesor de la asignatura)
