function A = trocaDeLinhas(A, B, k, n)
    # Em cada coluna K precisamos descobrir qual o valor máximo em modulo e onde ele está 
    [maxVal, maxPos] = max(abs(A(k:n, k)));
    # Correção da posição do valor máximo (Para que a posição bata com a original)
    maxPos = maxPos + k - 1;
    # Vamos trocar a linha i=k pela linha i=maxPos
    # aux = A(k,:);
    # A(k,:) = A(maxPos,:);
    # A(maxPos,:) = aux;
    '------------------'
    A([k maxPos], :)
    A([maxPos k], :)
    '------------------'
    A([k maxPos], :) = A([maxPos k], :);
    B([k maxPos]) = B([maxPos k]);

end