function a = ajuste_polinomial(X, Y, n)

m = length(X);

for i = 1 : n + 1
    for j = 1 : n + 1
        A(i, j) = sum(X.^(i + j - 2));
    end
    
    B(i, 1) = sum(X.^(i - 1) .* Y);
end

a = A \ B;

end