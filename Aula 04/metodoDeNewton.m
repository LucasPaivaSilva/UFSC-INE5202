function x = metodoDeNewton(xi, f)
derrivadaDeF = @(x) log(x)+1;
deltaX = 1;
iter = 0;
while(abs(deltaX) > 1e-15 && iter < 100)
    iter = iter+1
    deltaX = -f(xi)/derrivadaDeF(xi);
    x = xi + deltaX;
    xi = x;
end

end 