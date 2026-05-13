#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <cblas.h>

// Versión Row Major Optimizada (IKJ)
void mm_optimized(int n, double *A, double *B, double *C) {
    for (int i = 0; i < n; i++) {
        for (int k = 0; k < n; k++) {
            double temp = A[i * n + k];
            for (int j = 0; j < n; j++) {
                C[i * n + j] += temp * B[k * n + j];
            }
        }
    }
}

// Versión ineficiente (para comparar en el gráfico)
void mm_column_major(int n, double *A, double *B, double *C) {
    for (int j = 0; j < n; j++) {
        for (int i = 0; i < n; i++) {
            double s = 0.0;
            for (int k = 0; k < n; k++) {
                s += A[i * n + k] * B[k * n + j];
            }
            C[i * n + j] = s;
        }
    }
}

int main(int argc, char *argv[]) {
    if (argc != 2) return 1;
    int n = atoi(argv[1]);

    double *A = calloc(n * n, sizeof(double));
    double *B = calloc(n * n, sizeof(double));
    double *C = calloc(n * n, sizeof(double));

    struct timespec start, end;
    double t_cblas, t_opt, t_col;

    // 1. Medir CBLAS
    clock_gettime(CLOCK_MONOTONIC, &start);
    cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, n, n, n, 1.0, A, n, B, n, 0.0, C, n);
    clock_gettime(CLOCK_MONOTONIC, &end);
    t_cblas = (end.tv_sec - start.tv_sec) + (end.tv_nsec - start.tv_nsec) / 1e9;

    // 2. Medir IKJ (Optimizado)
    clock_gettime(CLOCK_MONOTONIC, &start);
    mm_optimized(n, A, B, C);
    clock_gettime(CLOCK_MONOTONIC, &end);
    t_opt = (end.tv_sec - start.tv_sec) + (end.tv_nsec - start.tv_nsec) / 1e9;

    // 3. Medir Column Major (Ineficiente)
    clock_gettime(CLOCK_MONOTONIC, &start);
    mm_column_major(n, A, B, C);
    clock_gettime(CLOCK_MONOTONIC, &end);
    t_col = (end.tv_sec - start.tv_sec) + (end.tv_nsec - start.tv_nsec) / 1e9;

    printf("%d %f %f %f\n", n, t_cblas, t_opt, t_col);

    free(A); free(B); free(C);
    return 0;
}