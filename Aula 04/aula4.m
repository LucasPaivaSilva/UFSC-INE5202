format short
# Vamos determinar a raiz de f(x) = x*ln(x)-1 = 0
f = @(x) x.*log(x)-1
# 1 Passo -> Localizar as raizes 
xi = 1.5
# Gráfico da função no domínio
x = 0.1:0.1:5
y = f(x)
plot(x,y)
# 2 Passo -> Refinar o valor inicial até a precisão desejada
x = metodoDeNewton(xi, f)
while(1>0)
end