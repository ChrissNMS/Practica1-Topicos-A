# mv_test: mv function vs Octave operator
n_size = [];
t_mv = [];
t_op = [];
n = [2^10 2^12 2^13 2^14];
n_length = length(n);

for i = 1:n_length
  printf("Calculando iteracion %d: n = 2^%d...\n", i, log2(n(i)));
  fflush(stdout);

  A = ones(n(i), n(i));
  x = ones(n(i), 1);
  sum_mv = 0;
  sum_op = 0;

  for j = 1:7
    # Si quieres medir tu funcion mv manual, descomenta las siguientes 3 lineas:
    # tic;
    # y_out = mv(n(i), n(i), A, x);
    # sum_mv = sum_mv + toc;

    tic;
    y_out = A * x;
    sum_op = sum_op + toc;
  endfor

  n_size = [n_size; n(i)];
  t_mv = [t_mv; (sum_mv / 7)];
  t_op = [t_op; (sum_op / 7)];
  clear A x y_out;
endfor

data = [n_size t_mv t_op];
# Guardamos en la subcarpeta con formato ASCII
save("-ascii", "mv.dat", "data");
printf("¡Proceso terminado y guardado en 2_Matriz_Vector/mv.dat!\n");
