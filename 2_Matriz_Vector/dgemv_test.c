#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <cblas.h>

int main(int argc, char *argv[]) {
    if (argc != 2) return 1;
    int n = atoi(argv[1]);

    double *A = (double *)malloc(n * n * sizeof(double));
    double *x = (double *)malloc(n * sizeof(double));
    double *y = (double *)malloc(n * sizeof(double));

    for (int i = 0; i < n * n; i++) A[i] = 1.0;
    for (int i = 0; i < n; i++) { x[i] = 1.0; y[i] = 0.0; }

    struct timeval start, end;
    gettimeofday(&start, NULL);
    // Operación: y = alpha*A*x + beta*y
    cblas_dgemv(CblasRowMajor, CblasNoTrans, n, n, 1.0, A, n, x, 1, 0.0, y, 1);
    gettimeofday(&end, NULL);

    printf("%f\n", (end.tv_sec - start.tv_sec) + (end.tv_usec - start.tv_usec) / 1000000.0);

    free(A); free(x); free(y);
    return 0;
}