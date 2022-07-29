#Equação diferencial ordinária trabalho 4 q4 #PROVA 4
#y'''+y''+y'+(x+1)*y=x*sen(x) #com x entre [0;pi/2] e erro menor que 10e-4
#y(x=0)=0
#y'(x=0)=1              #y''' = x*sen(x) - (+y''+y'+(x+1)*y) = x*sen(x) - (+y3 +y2 +(x+1)*y1)
#y''(x=pi*0.5)=-1
#Vamos substituir as derivadas de y por novas variáveis
#y1 = y   #y1' = y'     #y1' = y2                           #y1(x=0) = y(x=0) = 0
#y2 = y'  #y2' = y''    #y2' = y3                           #y2(x=0) = y'(x=0) = 1
#y3 = y'' #y3' = y'''   #y3' = x*sen(x) - y3 - y2 -(x+1)*y1 #y3(x=0) = y''(x=0) = C (desconhecido)

a = 0;
b = pi*0.5;
fy1 = @(x,y1,y2,y3) y2;                           #função derivada/função inclinação de y1
fy2 = @(x,y1,y2,y3) y3;                           #função derivada/função inclinação de y2
fy3 = @(x,y1,y2,y3) x*sin(x) - y3 - y2 -(x+1)*y1; #função derivada/função inclinação de y3
x(1) = 0;  #condição inicial
y1(1) = 0; #condição inicial
y2(1) = 1; #condição inicial
#Precisamos eterminar o valor da condição inicial desconhecida (C), que pode ser qualquer y1, y2 ou y3
#De todo modo nós conhecemos o valor da conição de contorno (D) em x = pi*0.5, que também pode ser qualquer y conhecido (nesse caso y3)
#C = -0.5 #chute inicial
#Vamos ter que determinar (C) de tal modo que desvioCC = y3(n+1) - D seja nulo
D = -1 #valor da condição e contorno conhecido
n = 2^3 #Número de sub-intervalos do intervalo [a:b]
C = calculaC(n, a, b, fy1, fy2, fy3, x, y1, y2, D)


y3(1) = C; #condição inicial
ye = @(x) sin(x); #solução exata

printf("\n\nMétodo de Runge-Kutta - 4a ORDEM:\n")
[x y1 y2 y3] = f_metodo_runge_kutta_4a_3eq(n, a, b, fy1, fy2, fy3, x(1), y1(1), y2(1), y3(1)); #Quatro retornos
#Precisamos avaliar se a condição de contorno (D) foi atingida a partir do valor inicial chutado (C)
#desvioCC = y3(n+1) - D #n precisa mais

erro_rk4_y1 = abs(y1 - ye(x));
erro_max_rk4_y1 = max(erro_rk4_y1)
[x_es y1_es y2_es y3_es] = f_metodo_runge_kutta_4a_3eq(2*n, a, b, fy1, fy2, fy3, x(1), y1(1), y2(1), y3(1)); #Quatro retornos
erro_estimado_rk4_y1 = max(abs(y1(1:1:n+1) - y1_es(1:2:2*n+1)))
printf("\nObs.:  Para atender erro<1e-4 com o Metodo de Runge-Kutta de 4º Ordem é necessário apenas n=8\n")

plot(x,y1,"-b; 'y1 = y ';", x,y2,"-y; 'y2 = y' ';", x,y3,"-m; 'y3 = y'' ';", x(n+1),y3(n+1),"om; 'y3 calculado';", x(n+1),D,"sm; 'y3 exato, condição de contorno dada';" )
#plot(x,ye(x),"-b; 'Solucao Exata';", x,y1,"-k; 'Metodo de Runge-Kutta 4a ORDEM';")
grid on;