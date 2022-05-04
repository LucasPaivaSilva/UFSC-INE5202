function xi = localizaXi(A,B,f)
    
    # Gráfico da função no domínio
    Num = 1000; # Número de intervalos onde vamos buscar o valor inicial
    h = (B-A)/Num;
    x = A:h:B;
    y = f(x);
    plot(x,y,"linewidth",5)
    ylim([-10 +10]);
    grid on
    iraiz = 0;
    for i=1:Num
        if (y(i) * y(i+1) < 0) && (abs(y(i)) + abs(y(i+1)) < 10*h)
        #10*h
        #y(i)
        #y(i+1)
            iraiz = iraiz + 1;
            xi(iraiz) = (x(i) + x(i+1))*0.5;
        end #if
    end #for
end #function