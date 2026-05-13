# Configuración base con 'enhanced' para superíndices
set term png enhanced size 800,600
set grid
set logscale x 2
set key left top
set xlabel "size (n)"
set ylabel "time (seconds)"

# Etiquetas fijas para el eje X (Rango más pequeño)
set xtics ("2^{7}" 2**7, "2^{8}" 2**8, "2^{9}" 2**9, "2^{10}" 2**10, "2^{11}" 2**11)

# --- Generar Figura 3 ---
set output "images/Figura3_MatrizMatriz.png"
set title "Octave operator vs cblas_dgemm function"
plot "3_Matriz_Matriz/mm.dat" using 1:3 title "Octave" with linespoints, \
     "3_Matriz_Matriz/mm_cblas.dat" using 1:2 title "Cblas" with linespoints

# --- Generar Figura 6 ---
set output "images/Figura6_MM_Row_Column.png"
set title "CBLAS vs C Row Major vs C Column Major (Matriz-Matriz)"
set logscale y 10 
plot "3_Matriz_Matriz/mm_fase2.dat" using 1:2 title "Cblas" with linespoints lw 2, \
     "3_Matriz_Matriz/mm_fase2.dat" using 1:3 title "C Row Major" with linespoints lw 2, \
     "3_Matriz_Matriz/mm_fase2.dat" using 1:4 title "C Column Major" with linespoints lw 2