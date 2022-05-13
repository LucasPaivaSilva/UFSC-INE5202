format long

# vamos determinar todas as raízes de um polinômio de grau n: reais, complexas, simples, múltiplas, etc...
# Pn(x) = a(1)x^n + a(2)x^(n-1) + ... + a(n)x^1 + a(n+1) = 0
# teremos n raízes

' Primeiro polinômio '
' P5(x)=x^5 - 3.19*x^4 + 1.936*x^3 + 3.4606*x^2 - 4.97794*x + 1.771561'
a = [1, -3.19, 1.936, 3.4606, -4.97794, 1.771561];

# x_octave = roots(a) Metodo do octave para calcular as raizes, não é tão preciso. 
[x, M] = roots_aula(a)
residuos = valorPolinomio(a, x)

' Segundo polinômio '
' P3(x)=x^3 + (4 - 1.1 i) x^2 + (4 - 4.4 i) x - 4.4 i '
a = [1, complex(4,-1.1), complex(4,-4.4), complex(0,-4.4)];

# x_octave = roots(a) Metodo do octave para calcular as raizes, não é tão preciso. 
[x, M] = roots_aula(a)
residuos = valorPolinomio(a, x)

' Terceiro polinômio '
'P8(x)=x^8 - 10.2 x^7 + 44.79 x^6 - 110.718 x^5 + 168.726 x^4 - 162.522 x^3 + 96.74 x^2 - 32.568 x + 4.752'
a = [1, -10.2, 44.79, -110.718, 168.726, -162.522, 96.74, -32.568, 4.752];

# x_octave = roots(a) Metodo do octave para calcular as raizes, não é tão preciso. 
[x, M] = roots_aula(a)
residuos = valorPolinomio(a, x)