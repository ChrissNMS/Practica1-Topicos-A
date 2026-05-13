#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <cblas.h>

void mv_row_major(int n, double *A, double *x, double *y) {
    for (int i = 0; i < n; i++) {
        y[i] = 0.0;
        for (int j = 0; j < n; j++) {
            y[i] += A[i * n + j] * x[j];
        }
    }
}

void mv_column_major(int n, double *A, double *x, double *y) {
    for (int i = 0; i < n; i++) y[i] = 0.0;
    
    for (int j = 0; j < n; j++) {
        for (int i = 0; i < n; i++) {
            y[i] += A[i * n + j] * x[j];
        }
    }
}

int main(int argc, char *argv[]) {
    if (argc != 2) return 1;
    int n = atoi(argv[1]);

    double *A = (double *)malloc(n * n * sizeof(double));
    double *x = (double *)malloc(n * sizeof(double));
    double *y = (double *)malloc(n * sizeof(double));

    for (int i = 0; i < n * n; i++) A[i] = 1.0;
    for (int i = 0; i < n; i++) x[i] = 1.1;

    struct timespec start, end;
    double t_cblas, t_row, t_col;

    // Medir CBLAS
    clock_gettime(CLOCK_MONOTONIC, &start);
    cblas_dgemv(CblasRowMajor, CblasNoTrans, n, n, 1.0, A, n, x, 1, 0.0, y, 1);
    clock_gettime(CLOCK_MONOTONIC, &end);
    t_cblas = (end.tv_sec - start.tv_sec) + (end.tv_nsec - start.tv_nsec) / 1e9;

    // Medir Row Major
    clock_gettime(CLOCK_MONOTONIC, &start);
    mv_row_major(n, A, x, y);
    clock_gettime(CLOCK_MONOTONIC, &end);
    t_row = (end.tv_sec - start.tv_sec) + (end.tv_nsec - start.tv_nsec) / 1e9;

    // Medir Column Major
    clock_gettime(CLOCK_MONOTONIC, &start);
    mv_column_major(n, A, x, y);
    clock_gettime(CLOCK_MONOTONIC, &end);
    t_col = (end.tv_sec - start.tv_sec) + (end.tv_nsec - start.tv_nsec) / 1e9;

    printf("%f %f %f\n", t_cblas, t_row, t_col);
    fprintf(stderr, "Check sum: %f\n", y[0]); 

    free(A); free(x); free(y);
    return 0;
}