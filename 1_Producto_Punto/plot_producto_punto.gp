set term png enhanced size 800,600
set grid
set logscale x 2
set key left top
set xlabel "size (n)"
set ylabel "time (seconds)"

# --- Configuración Figura 1 ---
set output "images/Figura1_ProductoPunto.png"
set title "Comparativa: Octave vs Cblas (Rango Octave)"

# Formato para que abajo diga 2^15, 2^16, etc.
set format x "2^{%L}"

# Definimos los puntos exactos que queremos ver en el eje X
set xtics (2**21, 2**22, 2**23, 2**24, 2**25, 2**26)

# Graficamos con líneas y puntos
plot "1_Producto_Punto/dot.dat" using 1:3 title "Octave" with linespoints, \
     "1_Producto_Punto/ddot_cblas.dat" using 1:2 title "Cblas" with linespoints