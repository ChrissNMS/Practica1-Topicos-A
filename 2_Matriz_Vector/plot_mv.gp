set term png enhanced size 800,600
set grid
set key left top
set xlabel "Size (n)"
set ylabel "Time (seconds)"

set logscale x 2
set format x "2^{%L}"
set xtics (2048, 4096, 8192, 16384)
unset logscale y

# --- Figura 2 ---
set output "images/Figura2_MatrizVector.png"
set yrange [0:0.1]
plot "2_Matriz_Vector/mv.dat" using 1:3 title "Octave" with linespoints lw 2, \
     "2_Matriz_Vector/mv_cblas.dat" using 1:2 title "Cblas" with linespoints lw 2

# --- Figura 5 ---
set output "images/Figura5_MV_Row_Column.png"
set yrange [0:6]
plot "2_Matriz_Vector/mv_fase2.dat" using 1:2 title "Cblas" with linespoints lw 2, \
     "2_Matriz_Vector/mv_fase2.dat" using 1:3 title "C Row Major" with linespoints lw 2, \
     "2_Matriz_Vector/mv_fase2.dat" using 1:4 title "C Column Major" with linespoints lw 2