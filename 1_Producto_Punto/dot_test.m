# dot_test: dot function vs Octave operator
n_size = [];
t_dot = [];
t_op = [];
n = [2^21 2^23 2^24 2^25 2^26];
n_length = length(n);

for i = 1:n_length
  printf("Calculando iteracion %d: n = 2^%d...\n", i, log2(n(i)));
  fflush(stdout);

  x = ones(n(i), 1);
  y = ones(n(i), 1);
  sum_dot = 0;
  sum_op = 0;

  for j = 1:7
    # Medimos tu función dot.m
    tic;
    c_manual = dot(n(i), x, y);
    sum_dot = sum_dot + toc;

    # Medimos el operador nativo de Octave
    tic;
    c_op = x' * y;
    sum_op = sum_op + toc;
  endfor

  n_size = [n_size; n(i)];
  t_dot = [t_dot; (sum_dot / 7)];
  t_op = [t_op; (sum_op / 7)];
  clear x y;
endfor

data = [n_size t_dot t_op];

# GUARDADO: Ruta correcta y formato ASCII para Gnuplot
save("-ascii", "dot.dat", "data");

printf("¡Proceso terminado y guardado en 1_Producto_Punto/dot.dat!\n");
