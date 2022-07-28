function x = tridiagonal(n, t, r, d, b)
    #triangularização da matriz tridiagonal -> tornar a matriz numa matriz triangular superior
    for i=2:n
       aux = t(i)/r(i-1);
       #t(i) = 0 nao precisa zerar, mas se quiser pode
       r(i) = r(i) - aux*d(i-1);
       b(i) = b(i) - aux*b(i-1);
    end 
    
    #retrosubstituição para determinar os x's de n até 1 (considerando os t's já zerados)
    x(n) = b(n)/r(n);
    for i=n-1:-1:1
        x(i) = (b(i)-d(i)*x(i+1))/r(i);
    end 
end