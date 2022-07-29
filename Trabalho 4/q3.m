#Equação diferencial ordinária trabalho 4 q3
#y'''+y''+y'+(x+1)*y=x*sen(x) #com x entre [0;pi/2] e erro menor que 10e-4
#y(x=0)=0
#y'(x=0)=1              #y''' = x*sen(x) - (+y''+y'+(x+1)*y) = x*sen(x) - (+y3 +y2 +(x+1)*y1)
#y''(x=0)=0
#Vamos substituir as derivadas de y por novas variáveis
#y1 = y   #y1' = y'     #y1' = y2                           #y1(x=0) = y(x=0) = 0
#y2 = y'  #y2' = y''    #y2' = y3                           #y2(x=0) = y'(x=0) = 1
#y3 = y'' #y3' = y'''   #y3' = x*sen(x) - y3 - y2 -(x+1)*y1 #y3(x=0) = y''(x=0) = 0

a = 0;
b = pi*0.5;
fy1 = @(x,y1,y2,y3) y2;                           #função derivada/função inclinação de y1
fy2 = @(x,y1,y2,y3) y3;                           #função derivada/função inclinação de y2
fy3 = @(x,y1,y2,y3) x*sin(x) - y3 - y2 -(x+1)*y1; #função derivada/função inclinação de y3
x(1) = 0;  #condição inicial
y1(1) = 0; #condição inicial
y2(1) = 1; #condição inicial
y3(1) = 0; #condição inicial
ye = @(x) sin(x); #solução exata

printf("\n\nMétodo de Runge-Kutta - 4a ORDEM:\n")
n = 2^3 #Número de sub-intervalos do intervalo [a:b]
[x y1 y2 y3] = f_metodo_runge_kutta_4a_3eq(n, a, b, fy1, fy2, fy3, x(1), y1(1), y2(1), y3(1)); #Quatro retornos
erro_rk4 = abs(y1 - ye(x));
erro_max_rk4 = max(erro_rk4)
[x_es y1_es y2_es y3_es] = f_metodo_runge_kutta_4a_3eq(2*n, a, b, fy1, fy2, fy3, x(1), y1(1), y2(1), y3(1)); #Quatro retornos
erro_estimado_rk4 = max(abs(y1(1:1:n+1) - y1_es(1:2:2*n+1)))
printf("Obs.:  Para atender erro<1e-4 com o Metodo de Runge-Kutta de 4º Ordem é necessário apenas n=8\n")

plot(x,ye(x),"-b; 'Solucao Exata';", x,y1,"-k; 'Metodo de Runge-Kutta 4a ORDEM';")
grid on;