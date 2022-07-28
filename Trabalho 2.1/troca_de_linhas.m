function [A B A_orig]=troca_de_linhas(n,A,B,A_orig,k)
#em cada coluna k precisamos descobrir qual e o seu valor max em modulo e onde ele esta
[n_max,i_max]=max(abs(A(k:n,k)));
i_max=i_max+k-1; #correcao da posicao original na matriz A
#vamos trocar a linha i=k pela linha i=i_max
aux=A(k,:);
A(k,:)=A(i_max,:); #a linha i=k esta recebendo a linha que contem o maior valor (: serve pra todos os valores)
A(i_max,:)=aux;
aux=B(k,:);
B(k,:)=B(i_max,:); #a linha i=k esta recebendo a linha que contem o maior valor (: serve pra todos os valores)
B(i_max,:)=aux;
aux=A_orig(k,:);
A_orig(k,:)=A_orig(i_max,:); #a linha i=k esta recebendo a linha que contem o maior valor (: serve pra todos os valores)
A_orig(i_max,:)=aux;
end