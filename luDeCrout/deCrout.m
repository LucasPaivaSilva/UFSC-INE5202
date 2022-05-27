A = [ 1,  2,  3,  4;
      1,  2, -3, -4;           
     -1,  0,  2,  3;
      1, -4, -1,  1;]

B = [1; 0; 1; 2]

# O octave possui uma biblioteca de solução de sistemas de equaçoes, exemplo
x_octave = A\B
# Verificando os resíduos
residuo = abs(A*x_octave - B)

# Hora de construir o nosso método!
# Vamos implementar um metodo de decomposição de LU de Crout
x = metodoLUCrout(A, B)