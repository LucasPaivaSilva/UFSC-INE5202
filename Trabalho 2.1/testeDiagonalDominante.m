function convergenciaGaratida = testeDiagonalDominante(A, debug)
    if debug
        printf("Teste de diagonal dominante\n");
    end
    for i = 1:size(A,1)
        soma = 0;
        for j = 1:size(A,2)
            if i != j
                soma += abs(A(i,j));
            end
        end
        if abs(A(i,i)) < soma
            printf("Linha %02d - Falso - %d >= %d\n", i, A(i,i), soma);
            convergenciaGaratida = false;
            return;
        end
        if debug
            printf("Linha %02d - Verdadeiro - %d >= %d\n", i, A(i,i), soma);
        end
    end
    convergenciaGaratida = true;
end