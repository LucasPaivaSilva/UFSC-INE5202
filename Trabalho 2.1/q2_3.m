#2.3). O sistema abaixo também possui muitos coeficientes nulos, pois cada incógnita se relaciona apenas com sua vizinhança imediata, gerando uma matriz esparsa e tridiagonal de coeficientes. Nesse caso, onde os coeficientes não nulos estão organizados em faixas, podemos armazenar e operar apenas os coeficientes não nulos, usando um método direto otimizado como o de eliminação gaussiana aplicado apenas aos coeficientes não nulos.

#for i=1;                   #          x(i) + x(i+1) = -1.00;
#for i=2:n1                 #x(i-1) + 2x(i) + x(i+1) = 1.00;
#for i=n1+1:n2-1            #x(i-1) + 3x(i) + x(i+1) = 2.00;
#for i=n2;                  #x(i-1) + 4x(i)          = 3.00; (n1=10 e n2=30 equações)

n1=10; n2=30;

#2.3a). armazene-o na forma de 4 vetores: t, r, d, b (não imprima);
for i=1                       r(i) = 1; d(i) = 1; b(i) =-1.00; end
for i=2:n1          t(i) = 1; r(i) = 2; d(i) = 1; b(i) = 1.00; end
for i=n1+1:n2-1     t(i) = 1; r(i) = 3; d(i) = 1; b(i) = 2.00; end
for i=n2            t(i) = 1; r(i) = 4;           b(i) = 3.00; end

#2.3b). resolva-o pelo pelo Método de escalonamento de Gauss otimizado para matriz tridiagonal. Imprima a solução e o resíduo máximo.#

printf('Solução do sistema: \n');

#eliminação gausiana otimizada para matriz tridiagonal
x = tridiagonal(n2, t, r, d, b);
residuoMax = residuoTridiagonal(n2, t, r, d, b, x);

for i=1:n2
    if (x(i)<0)
        printf('x(%02d) = %f \n', i, x(i));
    end
    if (x(i)>=0)
        printf('x(%02d) =  %f \n', i, x(i));
    end
end

printf('Resíduo máximo = %.24f\n', residuoMax);