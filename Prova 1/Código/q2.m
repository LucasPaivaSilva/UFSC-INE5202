# Determinar raiz de f(x)=x.ln(x)-1=0
format long
# format short
f = @(x) x.^2-log(x+1.5)-0.5
A = -1.49; B = 10; # Domínio de busca das raízes

x = metodoDeNewton(A,B,f)
residuo_f = abs(f(x))