#include <stdio.h>
#include <stdlib.h>
#include "istack.h"

int main() {
  int n;
  Stack* s = s_create();

  printf("Se ingresan numeros enteros para insertarlos en una pila: \n");
  scanf("%d", &n);
  while (n != 0) {
    s_push(s, n);
    scanf("%d", &n);
  }

  printf("La cantidad de elementos de la pila es: %d \n", s->cantElem);

  while (!s_empty(*s)) {
    n = s_pop(s);
    printf("Numero desapilado: %d \n", n);
  }

  return 0;
}
