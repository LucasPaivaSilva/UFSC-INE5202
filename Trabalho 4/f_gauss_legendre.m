function Gm = f_gauss_legendre(m, a, b, f)
    C = [2, 0, 0;
         1, 1, 0;
         20, 20, 20;];
    t = [1,         0,          0;
         -1/sqrt(3), 1/sqrt(3), 0;
         20,        20,        20;];
#Incluir a tabela com valroes de C e t para m=10 pontos.

    x = @(t) 0.5*(b - a)*t + 0.5*(b + a);
#    x(t(m,1:m))
#    f(x(t(m,1:m)))
    Gm = 0.5*(b - a)*sum(C(m,1:m).*f(x(t(m,1:m))));
end