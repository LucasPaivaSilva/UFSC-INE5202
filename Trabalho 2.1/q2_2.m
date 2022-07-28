format long
# i=1                   #     3x(i)    + 2x(i+5)                   =  2 
# for i=2:n1-1          #     x(i-1)   + 3x(i)   + 2x(i+5)         = -2 
# for i=n1:n2-1         #     2x(i-4)  + 4x(i)   + x(i+1)          =  3 
# i=n2                  #     x(i-1)   + 6x(i)   - x(i+4)          = -2 
# for i=n2+1:n3-1       #     x(i-3)   + x(i-1)  + 7*x(i)+2x(i+1)  =  5 
# i=n3                  #     2x(i-10) + 5x(i)                     = -5 
n1 = 10; n2 = 20; n3 = 30;
A = [];
B = [];
xi = [];
for i = 1;       A(i, i)    = 3; A(i, i+5) = 2;                                B(i, 1) =  2; end
for i=2:n1-1;    A(i, i-1)  = 1; A(i, i)   = 3; A(i, i+5) =  2;                B(i, 1) = -2; end
for i=n1:n2-1;   A(i, i-4)  = 2; A(i, i)   = 4; A(i, i+1) =  1;                B(i, 1) =  3; end
for i=n2;        A(i, i-1)  = 1; A(i, i)   = 6; A(i, i+4) = -1;                B(i, 1) = -2; end
for i=n2+1:n3-1; A(i, i-3)  = 1; A(i, i-1) = 1; A(i, i)   =  7; A(i, i+1) = 2; B(i, 1) =  5; end
for i=n3;        A(i, i-10) = 2; A(i, i)   = 5;                                B(i, 1) = -5; end
xi = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];

tolerancia = 1e-6; # 6 dígitos exatos depois da vírgula
fatorRelax = 1;

if (testeDiagonalDominante(A, true))
    printf("Temos diagonal dominante e portanto convergencia garantida\nPortanto, podemos prosseguir com a resolução do sistema\n")
    printf('Solução do sistema: \n');
    n=size(A,1);
    [nOp, x] = metodoGaussSeidel(n, A, B, xi, tolerancia, fatorRelax);
    #x = gauss_seidel(A, B, xi, tolerancia, 1000);
    residuo = abs((A*x) - B);
    for i=1:size(x, 1)
        if (x(i)<0)
            printf('x(%02d) = %.6f \n', i, x(i));
        end
        if (x(i)>=0)
            printf('x(%02d) =  %.6f \n', i, x(i));
        end 
    endfor
    printf('residuo máximo: %.24f\n', max(residuo));
    printf('número de operações: %d\n', nOp);
else
    printf("Não temos diagonal dominante e portanto não podemos prosseguir com a resolução do sistema\n")
endif

printf("\n\n")