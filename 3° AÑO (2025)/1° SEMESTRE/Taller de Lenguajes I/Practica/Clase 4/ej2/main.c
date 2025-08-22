#include <stdio.h>
#include <stdlib.h>

void f (int * p);

int main(){
  int * ptr = NULL;
  f(ptr);

  if (ptr == NULL)
    printf("ptr es NULL\n");
  else
    printf("ptr no es NULL\n");

  //imprime que ptr es NULL? SI, ya que nada mas se esta reservando espacio en memoria pero no se esta insertando ningun dato. NO. imprime NULL porque se esta pasando al puntero por valor

  return 0;
}

void f (int * p) {
  p = (int *) malloc(10*sizeof(int));
}
