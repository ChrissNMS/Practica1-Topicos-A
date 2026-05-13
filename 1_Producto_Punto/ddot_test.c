#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <cblas.h> 

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Uso: %s <tamaño n>\n", argv[0]);
        return 1;
    }

    int n = atoi(argv[1]);

    double *x = (double *)malloc(n * sizeof(double));
    double *y = (double *)malloc(n * sizeof(double));

    for (int i = 0; i < n; i++) {
        x[i] = 1.0;
        y[i] = 1.0;
    }

    struct timeval start, end;
    double time_cblas;

    gettimeofday(&start, NULL);
    double result = cblas_ddot(n, x, 1, y, 1);
    gettimeofday(&end, NULL);

    time_cblas = (end.tv_sec - start.tv_sec) + (end.tv_usec - start.tv_usec) / 1000000.0;

    printf("%f\n", time_cblas);

    free(x);
    free(y);
    return 0;
}