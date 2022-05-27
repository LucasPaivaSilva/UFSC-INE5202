format long

# vamos determinar todas as raízes de um polinômio de grau n: reais, complexas, simples, múltiplas, etc...
# Pn(x) = a(1)x^n + a(2)x^(n-1) + ... + a(n)x^1 + a(n+1) = 0
# teremos n raízes

' Primeiro polinômio '
' P3(x)=2*x^3+1.6*x^2-10.78*x+7.26=0'
a = [2, 1.6, -10.78, 7.26];

# x_octave = roots(a) Metodo do octave para calcular as raizes, não é tão preciso. 
[x, M] = roots_aula(a)
residuos = valorPolinomio(a, x)
