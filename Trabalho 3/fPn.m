function y_polinomio = fPn(n, a, xp)

# Pn(xp) = a(1) + a(2)*xp + a(3)*xp^2 + ... + a(n + 1)*xp^n

for k = 1 : length(xp)
    aux = 1;
    y_polinomio(k) = a(1);
    
    for i = 2 : n + 1
        aux = aux * xp(k);
        y_polinomio(k) = y_polinomio(k) + a(i) * aux;
    end
end
end