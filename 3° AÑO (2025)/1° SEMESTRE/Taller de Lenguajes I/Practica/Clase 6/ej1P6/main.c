#include <stdio.h>
#include <stdlib.h>

int main (int argc, char * argv[]) {
  printf("\n argc = %d",argc); //imprime la cantidad de argumentos pasados en el main (en este caso 1)
  printf("\n argv[0] => %s",argv[0]); //imprime la ruta del archivo
  return 0;
}
