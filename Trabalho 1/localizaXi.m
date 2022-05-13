function xi = localizaXi(A,B,f)
    
    # Gráfico da função no domínio
    Num = 10000 + 1; # Número de intervalos onde vamos buscar o valor inicial
    h = (B-A)/Num;
    x = A:h:B;
    y = f(x);
    Ajs = h * 10;
    #plot(x,y,"linewidth",3)
    #ylim([-10 +10]);
    #grid on;
    iraiz = 0;
    for i=1:Num
        if (y(i) * y(i+1) < 0) && (abs(y(i)) + abs(y(i+1)) < Ajs)
        #10*h
        #y(i)
        #y(i+1)
            iraiz = iraiz + 1;
            xi(iraiz) = (x(i) + x(i+1))*0.5;
        end #if
    end #for
end #function