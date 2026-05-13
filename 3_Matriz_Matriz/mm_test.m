# mm_test: mm function vs Octave operator
n_size = [];
t_mm = [];
t_op = [];
n = [2^8 2^9 2^10 2^11];
n_length = length(n);

for i = 1:n_length
  printf("Calculando iteracion %d: n = 2^%d...\n", i, log2(n(i)));
  fflush(stdout);

  A = ones(n(i), n(i));
  B = ones(n(i), n(i));
  sum_mm = 0;
  sum_op = 0;

  for j = 1:7
    # Si quieres medir tu funcion mm manual, descomenta las siguientes 3 lineas:
    # tic;
    # C = mm(n(i), n(i), n(i), A, B);
    # sum_mm = sum_mm + toc;

    tic;
    C = A * B;
    sum_op = sum_op + toc;
  endfor

  n_size = [n_size; n(i)];
  t_mm = [t_mm; (sum_mm / 7)];
  t_op = [t_op; (sum_op / 7)];
  clear A B C;
endfor

data = [n_size t_mm t_op];
# Guardamos en la subcarpeta con formato ASCII
save("-ascii", "mm.dat", "data");
printf("¡Proceso terminado y guardado en 3_Matriz_Matriz/mm.dat!\n");
