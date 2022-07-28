function ya = fln(x)
n = 512; # Falta achar o n necessario para erro maximo 1e-3 e otimizar a funcao
# da linha 8, eliminando a potenciacao (^)
#f(x) = somatorio ((-1)^(i+1)*1/i*(x-1)^i), com i = 1:n
for k = 1:length(x)
    ya(k) = 0;
    for i=1:n
        ya(k) = ya(k) + (-1)^(i+1)*1/i*(x(k)-1)^i;
    end #for
end #for
end
