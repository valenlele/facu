#include <stdio.h>
#include <stdlib.h>

#define size 25

void imprimir(int * v){
  int i;
  for (i=0; i<size; i++){
    printf("v[%d]= %d \n", i, v[i]);
  }
}

int main(){
  int v[size];
  imprimir(v);

  return 0;
}

//a) se pasa como parametro size

//b) en la etapa de precompilacion, el preprocesador realiza: reemplazo de constantes simbolicas definidas con define, o reemplazo de macros
//(en nuestro caso, reemplaza size por 25); y se hace la inclusion de los headers (en nuestro caso stdio.h y stlib.h)

