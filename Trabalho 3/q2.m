# Exemplo 7.2 do livro
m = 8; # número de pontos
X = [ 0.2  0.5  1    2     4     6     10    15   ]
Y = [ 0.5  0.3  0.1  -0.4  -0.9  -1.4  -2.0  -2.8 ]

' Primeiro ajuste: Polinomial de grau n'
n = 5 # grau do polinomio ajustador
a = ajuste_polinomial(X, Y, n); # coeficientes
'n=5 é o que melhor representa os pontos. No caso de n=6 temos um erro menor, porem com muita variação no gráfico'

xp = min(X) : 0.01 : max(X); # x plot
y_polinomio = fPn(n, a, xp);

desvio_local_modulo_Pn = abs(fPn(n, a, X) - Y)
desvio_total_modulo_Pn = sum(desvio_local_modulo_Pn)
desvio_max = max(desvio_local_modulo_Pn)

' Segundo ajuste: g(x)=C(1)+C(2)*x.^C(3): '

g = @(a, x) a(1)+a(2)*x.^a(3);
f1 = @(a, x, y) sum((g(a, x) - y));
f2 = @(a, x, y) sum((g(a, x) - y) .^ 2);
f3 = @(a, x, y) sum((g(a, x) - y));
ai = [1; 1; 1];     # a inicial
# a = metodo_newton_sistema_tres_eq(f1, f2, f3, ai, X, Y);
# OBS: Comentei a linha acima pois não consegui fazer funcionar.
y_g = g(a, xp);

desvio_local_modulo_g = abs(g(a, X) - Y);
desvio_total_modulo_g = sum(desvio_local_modulo_g);

plot(X, Y, '*r', 'markersize', 10, xp, y_polinomio, '-g', xp, y_g, '-b')
grid on
