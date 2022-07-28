format long

# Exemplo 4.2 do livro

#Primeira equacao: e^x1+x2 = 1
#Segunda equacao: x1^2+x2^2=4

f1 = @(x) sin(x(1))*cos(x(2))    +x(3)-1.5;
f2 = @(x)     x(1)^   2+x(2)^2   +x(3)^2-3.0;
f3 = @(x)     x(1)     +x(2)     +x(3)-3.1;


#Valor inicial da solucao (chutado):
xi = [1;-1];

x = newtonNEq(f1,f2, f3,xi)

residuo_f = max(abs([f1(x),f2(x), f3(x)]))
