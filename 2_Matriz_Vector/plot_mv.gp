# Configuración base con 'enhanced' para superíndices
set term png enhanced size 800,600
set grid
set logscale x 2
set key left top
set xlabel "size (n)"
set ylabel "time (seconds)"

# Etiquetas fijas para el eje X
set xtics ("2^{11}" 2**11, "2^{12}" 2**12, "2^{13}" 2**13, "2^{14}" 2**14, "2^{15}" 2**15)

# --- Generar Figura 2 ---
set output "images/Figura2_MatrizVector.png"
set title "Octave operator vs cblas_dgemv function"
plot "2_Matriz_Vector/mv.dat" using 1:3 title "Octave" with linespoints, \
     "2_Matriz_Vector/mv_cblas.dat" using 1:2 title "Cblas" with linespoints

# --- Generar Figura 5 ---
set output "images/Figura5_MV_Row_Column.png"
set title "CBLAS vs C Row Major vs C Column Major (Matriz-Vector)"
plot "2_Matriz_Vector/mv_fase2.dat" using 1:2 title "Cblas" with linespoints, \
     "2_Matriz_Vector/mv_fase2.dat" using 1:3 title "C Row Major" with linespoints, \
     "2_Matriz_Vector/mv_fase2.dat" using 1:4 title "C Column Major" with linespoints