set term png enhanced size 800,600
set grid
set key left top
set xlabel "Matrix size (n)"
set ylabel "Time (seconds)"

set logscale x 2
set format x "2^{%L}"
set xtics (256, 512, 1024)
unset logscale y

# --- Figura 3 ---
set output "images/Figura3_MatrizMatriz.png"
set yrange [0:0.25]
plot "3_Matriz_Matriz/mm.dat" using 1:3 title "Octave" with linespoints lw 2, \
     "3_Matriz_Matriz/mm_cblas.dat" using 1:2 title "Cblas" with linespoints lw 2

# --- Figura 6: COMPARATIVA REAL ---
set output "images/Figura6_MM_Row_Column.png"
set yrange [0:8]
# Saltamos la columna basura (usamos 1, 3, 4 y 5)
plot "3_Matriz_Matriz/mm_fase2.dat" using 1:3 title "Cblas" with linespoints lw 2 lc rgb "dark-green", \
     "3_Matriz_Matriz/mm_fase2.dat" using 1:4 title "C Row Major (IKJ)" with linespoints lw 2 lc rgb "red", \
     "3_Matriz_Matriz/mm_fase2.dat" using 1:5 title "C Column Major (Ineficiente)" with linespoints lw 2 lc rgb "blue"