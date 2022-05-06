function x = metodoDeNewton(A,B,f)
# Primeiro passo: localização das raízes
xi = localizaXi(A,B,f)


# Segundo passo: refinar o valor inicial até a precisão desejada
for k=1:length(xi) # Refina um raiz k por vez.
    # derivada_do_f = @(x) log(x)+1; # subtituida pela derivada numerica
    delta_x = 1e-6; iter = 0;
    while(abs(delta_x)>1e-15 && iter < 100) # Enquanto o módulo do delta x for grande
        iter = iter + 1;
        derivada_do_f = (f(xi(k)+delta_x)-f(xi(k)))/delta_x; # Derivada numérica baseada na definição
        delta_x = -f(xi(k))/derivada_do_f;
        x(k) = xi(k) + delta_x;
        xi(k) = x(k);
    end #while
    iter;
    delta_x;
end #for
end 