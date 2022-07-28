function [nOp, x] = metodoGaussSeidel(n, A, B, xi, tolerancia, fatorRelax)
    x = xi;
    dX = 1;
    xa = x;
    iter = 0;
    aux = (1-fatorRelax);
    nOp = 1;
    # Como estamos sempre usando o valor novo nao
    # é necessário atualizar o valor de xi
    while dX > tolerancia 
        for i=1:n
            x(i) = aux*xa(i) + fatorRelax*(B(i) - A(i,[1:i-1,i+1:n])*x([1:i-1,i+1:n]))/A(i,i);  
            nOp += 6;
        end
        iter += 1;
        x;
        dX = max(abs(x-xa));
        nOp += n;
        xa = x;
    end
    printf("Iteracoes: %d\n", iter);
end