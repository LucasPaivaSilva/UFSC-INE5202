#Vamos aproximar a funcao f(x)=ln(x) em x e [1;2] com 3 digitos decimais exatos,
# ou seja, erro maximo menor que 1e-3
#A serie de taylor gerada a partir de xi=1 e:
#f(x)=0+1/1*(x-1)^1-1/2*(x-1)^2+1/3*(x-1)^3-1/4*(x-1)^4+...+(-1)^(n+1)*1/n*(x-1)^n
#f(x) = somatorio ((-1)^(i+1)*1/i*(x-1)^i), com i = 1:n
#Exemplo: para x = 1.5
x = 0:0.01:pi/2;
ye = cos(x);
ya = fln(x);
erro = max(abs(ya-ye))
plot(x,ye,'-r',x,ya,'-b')
grid on