clear
clc

n = 3;
a = 0;
b = pi/2;

h = (b-a)/n;

x(:, 1) = a:h:b;

y(:,1) = cos(x);

x_plot = a:0.01:b;
y_plot = func_interpoladora_GN(x_plot, n, x, y);
ye=cos(x_plot);
erro=max(abs(y_plot-ye));
printf("erro max = %f\n",erro);
printf("Grau utilizado = 3")
plot(x,y,'*k','markersize',10,x_plot,y_plot,'-r',x_plot,ye,'-b');
grid on;










