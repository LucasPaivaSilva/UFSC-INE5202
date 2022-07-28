function residuo_max = residuoTridiagonal(n, t, r, d, b, x) 
    #linha 1
    for i=1     res(i) = abs(              r(i)*x(i) + d(i)*x(i+1) - b(i)); end
    # linha 2
    for i=2:n-1 res(i) = abs(t(i)*x(i-1) + r(i)*x(i) + d(i)*x(i+1) - b(i));end 
    # linha n
    for i=n     res(i) = abs(t(i)*x(i-1) + r(i)*x(i)               - b(i));end 
    
    residuo_max = max(res);
end