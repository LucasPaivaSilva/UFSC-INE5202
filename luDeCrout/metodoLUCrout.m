function x = metodoLUCrout(A, B)
    # Vamos armazenar a matriz L e U na propria memória da matriz A
    k = 1;
    n = size(A, 1);

    for i=1:n
        A(i,1) = A(i, 1);
    end
    
    # Vamos aplicar a troca de linhas para evitar L(1,1) = 0 e obter o maior valor possível
    A = trocaDeLinhas(A, B, k, n); # Essa rotina devolver a matriz A com a melhor diagonal principal
    for j=2:n
        A(1,j) = A(1, j)/A(1,1); 
    end
    
    for k=2:n-1

        for i=k:n
            A(i,k) = A(i,k) - sum(A(i,1:k-1)*A(1:k-1,k));
        end

        # Vamos aplicar a troca de linhas para evitar L(k,k) = 0 e obter o maior valor possível
        A = trocaDeLinhas(A, B, k, n); # Essa rotina devolver a matriz A com a melhor diagonal principal
        for j=k+1:n
            A(k,j) = (A(k,j) - sum(A(k,1:k-1)*A(1:k-1,j)))/A(k,k);
        end

    end
    
    for i=1:n for j=1:i L(i, j) = A(i, j); end end
    for i=1:n-1 for j=i+1:n U(i, j) = A(i, j); end end

end
