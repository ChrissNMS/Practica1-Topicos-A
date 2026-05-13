#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <cblas.h>

int main(int argc, char *argv[]) {
    if (argc != 2) return 1;
    int n = atoi(argv[1]);

    // Matrices cuadradas n x n
    double *A = (double *)malloc(n * n * sizeof(double));
    double *B = (double *)malloc(n * n * sizeof(double));
    double *C = (double *)malloc(n * n * sizeof(double));

    for (int i = 0; i < n * n; i++) {
        A[i] = 1.0;
        B[i] = 1.0;
        C[i] = 0.0;
    }

    struct timeval start, end;
    gettimeofday(&start, NULL);
    // Operación: C = alpha*A*B + beta*C
    cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, n, n, n, 1.0, A, n, B, n, 0.0, C, n);
    gettimeofday(&end, NULL);

    printf("%f\n", (end.tv_sec - start.tv_sec) + (end.tv_usec - start.tv_usec) / 1000000.0);

    free(A); free(B); free(C);
    return 0;
}