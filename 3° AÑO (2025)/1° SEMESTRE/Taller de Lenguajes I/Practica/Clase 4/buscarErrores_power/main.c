#include <stdio.h>
#include <stdlib.h>
int main(void)
{
    double *pd; //se define un puntero a un double
    int i;

    pd[0] = 1.2; //se insertan elementos al arreglo dinamico sin reservar memoria
    pd[1] = 5.6;

    for (i=0; i<3; i++){ //se recorre hasta 3 pero hay solo dos valores en el arreglo
       printf("%d  %g\n", i, *pd); //seria *(pd+i) en vez de *pd
       pd++; //se pierde la direccion de memoria original al hacer pd++
    }

    free(pd); //no se liberaria la memoria del arreglo dinamico ya que se aumento pd
    return(0);
}
