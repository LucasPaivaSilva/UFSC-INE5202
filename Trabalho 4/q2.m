format long
#Vamos calcular numericamente a integral de ln(x) entre 0 e 1, com 4 digitos significativos exatos (erro estimado menor que 1e-4)

#Vamos definir a função integranda f(x)
f = @(x) log(x);
a = 0;
b = 1;
Integral_exata = -1;

printf("\n Método de Gauss-legendre\n")
# Precisamos definir o número de pontos m onde aplicaremos o método de gauss-legendre
m = 2 #número de pontos

#Vamos definir o resultado da integral
Gm = f_gauss_legendre(m, a, b, f)
erro_exato_Gm = abs(Gm - Integral_exata) #valor aproximado obtido menos o valor exato
#erro_estimado_Gm = abs(Gm - f_gauss_legendre(m, a, b, f))

