function [x y1 y2 y3] = f_metodo_runge_kutta_4a_3eq(n, a, b, fy1, fy2, fy3, x, y1, y2, y3)
    h = (b-a)/n;
    for i=1:n
        x(i+1) = x(i) + h;
        
        #K é derivada/func inclinação
        K1y1 = fy1(x(i)         ,y1(i)              ,y2(i)              ,y3(i)             );
        K1y2 = fy2(x(i)         ,y1(i)              ,y2(i)              ,y3(i)             );
        K1y3 = fy3(x(i)         ,y1(i)              ,y2(i)              ,y3(i)             );
        
        K2y1 = fy1(x(i) + 0.5*h ,y1(i) + 0.5*h*K1y1 ,y2(i) + 0.5*h*K1y2 ,y3(i) + 0.5*h*K1y3);
        K2y2 = fy2(x(i) + 0.5*h ,y1(i) + 0.5*h*K1y1 ,y2(i) + 0.5*h*K1y2 ,y3(i) + 0.5*h*K1y3);
        K2y3 = fy3(x(i) + 0.5*h ,y1(i) + 0.5*h*K1y1 ,y2(i) + 0.5*h*K1y2 ,y3(i) + 0.5*h*K1y3);
        
        K3y1 = fy1(x(i) + 0.5*h ,y1(i) + 0.5*h*K2y1 ,y2(i) + 0.5*h*K2y2 ,y3(i) + 0.5*h*K2y3);
        K3y2 = fy2(x(i) + 0.5*h ,y1(i) + 0.5*h*K2y1 ,y2(i) + 0.5*h*K2y2 ,y3(i) + 0.5*h*K2y3);
        K3y3 = fy3(x(i) + 0.5*h ,y1(i) + 0.5*h*K2y1 ,y2(i) + 0.5*h*K2y2 ,y3(i) + 0.5*h*K2y3);
        
        K4y1 = fy1(x(i) +     h ,y1(i) +     h*K3y1 ,y2(i) +     h*K3y2 ,y3(i) +     h*K3y3);
        K4y2 = fy2(x(i) +     h ,y1(i) +     h*K3y1 ,y2(i) +     h*K3y2 ,y3(i) +     h*K3y3);
        K4y3 = fy3(x(i) +     h ,y1(i) +     h*K3y1 ,y2(i) +     h*K3y2 ,y3(i) +     h*K3y3);
        
        y1(i+1) = y1(i) + h/6*(K1y1 + 2*(K2y1+K3y1) + K4y1);
        y2(i+1) = y2(i) + h/6*(K1y2 + 2*(K2y2+K3y2) + K4y2);
        y3(i+1) = y3(i) + h/6*(K1y3 + 2*(K2y3+K3y3) + K4y3);
    end #for

end