# Determinar raiz de f(x)=x.ln(x)-1=0
format long
# format short
#f = @(x) x.*log(x)-1
# A = 0.1; B = 5; # Domínio de busca das raízes
f = @(x) x.*tan(x)-1
A = -5; B = 5; # Domínio de busca das raízes

x = metodoDeNewton(A,B,f)
residuo_f = abs(f(x))