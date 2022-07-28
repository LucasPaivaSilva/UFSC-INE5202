function y_plot = func_interpoladora_GN(x_plot, n, x, y)
    #montar a tabela
    #delta(1)_y(i) = (y(i+1)-y(i))/(x(i+1)-x(i))
    for i=1:n
        delta(i,1) = (y(i+1)-y(i))/(x(i+1)-x(i));
    end #for
    #delta(k)_y(i) = (delta(k-1)_y(i+1)-delta(k-1)_y(i))/(x(i+k)-x(i)) #para todo k [2:n] para todo i de 1:n+1-k
    for k=2:n
        for i=1:n+1-k
            delta(i,k)=(delta(i+1,k-1)-delta(i,k-1))/(x(i+k)-x(i));
        end
    end
    c(1)=y(1);
    for i=2:n+1
    c(i)=delta(1,i-1);
    end
    for i=1:length(x_plot)
        soma=0;
        for k=1:n
            produtorio=1;
            for j=1:k
                produtorio=produtorio*(x_plot(i)-x(j));        
            end
            soma=soma+c(k+1)*produtorio;
        end
        y_plot(i)=c(1)+soma;
    end
end
