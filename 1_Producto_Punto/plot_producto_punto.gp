set term png enhanced size 800,600
set grid
set key left top
set xlabel "Size (n)"
set ylabel "Time (seconds)"

set logscale x 2
set format x "2^{%L}"
# Eliminamos los xtics fijos para que Gnuplot los acomode automáticamente
set xtics autofreq

unset logscale y
set yrange [0:0.08]

# --- Figura 1 ---
set output "images/Figura1_ProductoPunto.png"
set title "Octave vs Cblas (Producto Punto)"
# Ignoramos valores cero (NaN) por si el programa colapsó por falta de RAM
plot "1_Producto_Punto/dot.dat" using 1:($3==0 ? NaN : $3) title "Octave" with linespoints lw 2, \
     "1_Producto_Punto/ddot_cblas.dat" using 1:($2==0 ? NaN : $2) title "Cblas" with linespoints lw 2

# --- Figura 4: REPARADA ---
set output "images/Figura4_Dot_Optimized.png"
set title "Cblas vs C vs Loop Unrolling"
# Ignoramos valores cero (NaN) para evitar la caída vertical
plot "1_Producto_Punto/dot_fase2.dat" using 1:($2==0 ? NaN : $2) title "Cblas" with linespoints lw 2 lc rgb "purple", \
     "1_Producto_Punto/dot_fase2.dat" using 1:($3==0 ? NaN : $3) title "C Tradicional" with linespoints lw 2 lc rgb "dark-green", \
     "1_Producto_Punto/dot_fase2.dat" using 1:($4==0 ? NaN : $4) title "C Loop Unrolling" with linespoints lw 2 lc rgb "blue"