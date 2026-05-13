CC = gcc
CFLAGS = -Wall -O3
LIBS = -lopenblas 

IMG_DIR = images

# Agrupamos los 6 ejecutables
all: 1_Producto_Punto/ddot_test 1_Producto_Punto/dot_fase2 \
	2_Matriz_Vector/dgemv_test 2_Matriz_Vector/mv_fase2 \
	3_Matriz_Matriz/dgemm_test 3_Matriz_Matriz/mm_fase2

# --- Compilación ---
1_Producto_Punto/ddot_test: 1_Producto_Punto/ddot_test.c
	$(CC) $(CFLAGS) -o 1_Producto_Punto/ddot_test 1_Producto_Punto/ddot_test.c $(LIBS)

1_Producto_Punto/dot_fase2: 1_Producto_Punto/dot_fase2.c
	$(CC) $(CFLAGS) -o 1_Producto_Punto/dot_fase2 1_Producto_Punto/dot_fase2.c $(LIBS)

2_Matriz_Vector/dgemv_test: 2_Matriz_Vector/dgemv_test.c
	$(CC) $(CFLAGS) -o 2_Matriz_Vector/dgemv_test 2_Matriz_Vector/dgemv_test.c $(LIBS)

2_Matriz_Vector/mv_fase2: 2_Matriz_Vector/mv_fase2.c
	$(CC) $(CFLAGS) -o 2_Matriz_Vector/mv_fase2 2_Matriz_Vector/mv_fase2.c $(LIBS)

3_Matriz_Matriz/dgemm_test: 3_Matriz_Matriz/dgemm_test.c
	$(CC) $(CFLAGS) -o 3_Matriz_Matriz/dgemm_test 3_Matriz_Matriz/dgemm_test.c $(LIBS)

3_Matriz_Matriz/mm_fase2: 3_Matriz_Matriz/mm_fase2.c
	$(CC) $(CFLAGS) -o 3_Matriz_Matriz/mm_fase2 3_Matriz_Matriz/mm_fase2.c $(LIBS)

# --- Ejecución y Gráficas ---
run: all
	@echo "Generando datos de C..."
	cd 1_Producto_Punto && bash run_ddot.sh && bash run_fase2.sh
	cd 2_Matriz_Vector && bash run_mv.sh && bash run_mv_fase2.sh
	cd 3_Matriz_Matriz && bash run_mm.sh && bash run_mm_fase2.sh
	@echo "Generando gráficas con gnuplot..."
	gnuplot 1_Producto_Punto/plot_producto_punto.gp
	gnuplot 2_Matriz_Vector/plot_mv.gp
	gnuplot 3_Matriz_Matriz/plot_mm.gp
	@echo "¡Proceso terminado! Imágenes en la carpeta $(IMG_DIR)/"

# --- Limpieza Quirúrgica ---
clean:
	@echo "Limpiando binarios, imágenes y datos de C (Protegiendo datos de Octave)..."
	rm -f 1_Producto_Punto/ddot_test 1_Producto_Punto/dot_fase2
	rm -f 2_Matriz_Vector/dgemv_test 2_Matriz_Vector/mv_fase2
	rm -f 3_Matriz_Matriz/dgemm_test 3_Matriz_Matriz/mm_fase2
	# Borramos solo los archivos generados por los scripts de C/Bash
	rm -f 1_Producto_Punto/ddot_cblas.dat 1_Producto_Punto/dot_fase2.dat
	rm -f 2_Matriz_Vector/mv_cblas.dat 2_Matriz_Vector/mv_fase2.dat
	rm -f 3_Matriz_Matriz/mm_cblas.dat 3_Matriz_Matriz/mm_fase2.dat
	# Borramos las imágenes generadas
	rm -f $(IMG_DIR)/*.png