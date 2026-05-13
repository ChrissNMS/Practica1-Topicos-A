#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <cblas.h>

// 1. Versión Tradicional (ciclo de 1 en 1)
double dot_tradicional(int n, double *x, double *y) {
    double s = 0.0;
    for (int i = 0; i < n; i++) {
        s += x[i] * y[i];
    }
    return s;
}

// 2. Versión con Loop Unrolling (de 8 en 8)
double dot_unrolled(int n, double *x, double *y) {
    double s = 0.0;
    int i;
    // Procesamos bloques de 8 elementos
    for (i = 0; i <= n - 8; i += 8) {
        s += x[i] * y[i] +
             x[i+1] * y[i+1] +
             x[i+2] * y[i+2] +
             x[i+3] * y[i+3] +
             x[i+4] * y[i+4] +
             x[i+5] * y[i+5] +
             x[i+6] * y[i+6] +
             x[i+7] * y[i+7];
    }
    // Limpieza: procesar los elementos que sobren si n no es múltiplo de 8
    for (; i < n; i++) {
        s += x[i] * y[i];
    }
    return s;
}

int main(int argc, char *argv[]) {
    if (argc != 2) return 1;
    int n = atoi(argv[1]);
    
    double *x = (double *)malloc(n * sizeof(double));
    double *y = (double *)malloc(n * sizeof(double));
    
    // Inicialización
    for (int i = 0; i < n; i++) { 
        x[i] = 1.0; 
        y[i] = 2.0; 
    }

    struct timeval start, end;
    double t_cblas, t_trad, t_unroll;
    double res1, res2, res3;

    // Medir CBLAS
    gettimeofday(&start, NULL);
    res1 = cblas_ddot(n, x, 1, y, 1);
    gettimeofday(&end, NULL);
    t_cblas = (end.tv_sec - start.tv_sec) + (end.tv_usec - start.tv_usec) / 1000000.0;

    // Medir Tradicional
    gettimeofday(&start, NULL);
    res2 = dot_tradicional(n, x, y);
    gettimeofday(&end, NULL);
    t_trad = (end.tv_sec - start.tv_sec) + (end.tv_usec - start.tv_usec) / 1000000.0;

    // Medir Unrolled
    gettimeofday(&start, NULL);
    res3 = dot_unrolled(n, x, y);
    gettimeofday(&end, NULL);
    t_unroll = (end.tv_sec - start.tv_sec) + (end.tv_usec - start.tv_usec) / 1000000.0;

    // Imprimir los 3 tiempos para el .dat
    printf("%f %f %f\n", t_cblas, t_trad, t_unroll);

    // Imprimir el check en stderr (consola) para que no entre al archivo .dat
    // y para obligar al compilador a NO borrar los ciclos for
    fprintf(stderr, "Check: %g\n", res1 + res2 + res3);

    free(x); 
    free(y);
    return 0;
}