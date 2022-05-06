# Determinar raiz de f(x)=x.ln(x)-1=0
format long
# format short
f = @(x) (x-1).*tan(x)/(2.*x.*x-x-2)
A = -4; B = 4; # Domínio de busca das raízes

x = metodoDeNewton(A,B,f)
residuo_f = abs(f(x))