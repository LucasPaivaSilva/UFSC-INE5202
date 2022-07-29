function C = calculaC(n, a, b, fy1, fy2, fy3, x, y1, y2, D) #PROVA 4
    #Vamos aplica o método de newton para determinar (C)
    #desvioCC = y3(n+1) - D -> 0
    Ci=-0.5; #chute inicial
    deltaC=1e-6; iter=0;
    while abs(deltaC)>1e-10 && iter<100
        iter=iter+1;
        #deltaC=-desvioCC(Ci)/derivada_desvio_CC(Ci)
        [x y1 y2 y3]=f_metodo_runge_kutta_4a_3eq(n,a,b,fy1,fy2,fy3,x,y1,y2,Ci);
        desvioCC=y3(n+1)-D;
        [x y1 y2 y3]=f_metodo_runge_kutta_4a_3eq(n,a,b,fy1,fy2,fy3,x,y1,y2,(Ci+deltaC));
        desvioCC2=y3(n+1)-D;
        derivada_desvio_CC=(desvioCC2-desvioCC)/deltaC;
        deltaC=-desvioCC/derivada_desvio_CC;
        C=Ci+deltaC;
        Ci=C;
    end #while
end