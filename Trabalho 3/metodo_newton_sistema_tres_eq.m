function x = metodo_newton_sistema_duas_eq(f1, f2, f3, xi, X, Y) # x = a do programa principal assim como xi = ai

delta_x = [1e-6;1e-6]; iter = 0;
while(abs(delta_x)>1e-15 && iter < 100) # Enquanto o módulo do delta x for grande
    iter = iter + 1;
    #derivada_do_f = (f(xi(k)+delta_x)-f(xi(k)))/delta_x; # Derivada numérica baseada na definição
    
    A(1,1) = (f1(xi(1)+delta_x(1),xi(2)+delta_x(2))-f1(xi(1),xi(2)))/delta_x(1);
    A(1,2) = (f2(xi(1)+delta_x(1),xi(2)+delta_x(2))-f2(xi(1),xi(2)))/delta_x(1);
    A(1,3) = (f3(xi(1)+delta_x(1),xi(2)+delta_x(2))-f3(xi(1),xi(2)))/delta_x(1);
    A(2,1) = (f1(xi(1)+delta_x(1),xi(2)+delta_x(2))-f1(xi(1),xi(2)))/delta_x(2);
    A(2,2) = (f2(xi(1)+delta_x(1),xi(2)+delta_x(2))-f2(xi(1),xi(2)))/delta_x(2);
    A(2,3) = (f3(xi(1)+delta_x(1),xi(2)+delta_x(2))-f3(xi(1),xi(2)))/delta_x(2);
    A(3,1) = (f1(xi(1)+delta_x(1),xi(2)+delta_x(2))-f1(xi(1),xi(2)))/delta_x(1);
    A(3,2) = (f2(xi(1)+delta_x(1),xi(2)+delta_x(2))-f2(xi(1),xi(2)))/delta_x(1);
    A(3,3) = (f3(xi(1)+delta_x(1),xi(2)+delta_x(2))-f3(xi(1),xi(2)))/delta_x(1);
    B = -[f1(xi, X, Y);f2(xi, X, Y);f3(xi, X, Y)];
    A;
    B;
    delta_x = A\B;

    x = xi + delta_x;
    xi = x;
end #while
iter;
delta_x;
end 