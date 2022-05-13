format long
xx=-60.06;      #double
x=single(xx);   #float/single
printf("\n xx = %.25f\n",xx)
printf("\n x  = %.25f\n",x)
err = ((double(x)-xx)/xx)*100;
printf("\n Erro(%) = %.25f\n",err)