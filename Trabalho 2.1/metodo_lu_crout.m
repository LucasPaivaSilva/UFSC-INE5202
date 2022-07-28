function [num, x]=metodo_lu_crout(A,B)
#Vamos armazenar a matriz L e U na propria memoria da matriz A
num = 0;
n=size(A,1);
A_orig=A;
U=eye(n); #Matriz Identidade
k=1; #passo
for i=1:n
    A(i,1)=A(i,1);#L(i,1)
end
#Vamos aplicar a troca de linhas para evitar L(1,1)=0 e obter o maior valor possivel(para reduzir arredondamentos)
[A B A_orig]=troca_de_linhas(n,A,B,A_orig,k); #Esta rotina deve devolver a matriz A com a melhor diagonal principal A(1,1)#L(1,1)
for j=2:n
    A(1,j)=A(1,j)/A(1,1);#U(1,j)
end
for k=2:n-1
    for i=k:n
        A(i,k)=A(i,k)-sum(A(i,1:k-1)*A(1:k-1,k));#L(i,k)
    end
    #Vamos aplicar a troca de linhas para evitar L(k,k)=0 e obter o maior valor possivel(para reduzir arredondamentos)
    [A B A_orig]=troca_de_linhas(n,A,B,A_orig,k); #Esta rotina deve devolver a matriz A com a melhor diagonal principal A(k,k)#L(k,k)
    for j=k+1:n
        A(k,j)=(A(k,j)-sum(A(k,1:k-1)*A(1:k-1,j)))/A(k,k);#U(k,j)
    end
end
for k=n
    for i=k:n
        A(i,k)=A(i,k)-sum(A(i,1:k-1)*A(1:k-1,k));#L(i,k)
    end
end
A;
B;
for i=1:n for j=1:i   L(i,j)=A(i,j);end end
for i=1:n-1 for j=i+1:n U(i,j)=A(i,j);end end
L;
U;
#precisamos conferir se a matriz L e U foram calculadas corretamente fazendo o residuo, comparando com A original
L*U;
A_orig;
residuoLU=(L*U-A_orig);

# Vamos resolver o sistemas Lc = B
c(1)= B(1)/A(1,1); #Posso usar A original, que contém L

# Algoritmo genérico para c
for i=2:n
    c(i) = (B(i)- sum(A(i,1:i-1).*c(1:i-1)))/A(i,i);
end
c;

#Vamos resolver o sistemas Ux = c
x(n)= c(n);

#Algoritmo genérico para x
for i=n-1:-1:1
    x(i) = c(i)- sum(A(i,i+1:n).*x(i+1:n));
end
x = transpose(x); # Matriz transposta;
#Calculo do numero de operações
#Exemplo usado: 4n³+15n²-7n-6/6
num = (4*n^3+15*n^2-7*n-6)/6;
#Verificacao se e mal condicionado
for i=1:n alfa(i)= sqrt(sum(A_orig(i,1:n).^2)); end
formula1 = det(A_orig)/prod(alfa); #Mal condicionado se formula1<<1 (<0,01)
formula2 = cond(A_orig);           #Mal condicionado se formula2>>1 (>100)
printf("Sistema A*x=B não é mal condicionado, pode ser resolvido por métodos diretos\n")
end