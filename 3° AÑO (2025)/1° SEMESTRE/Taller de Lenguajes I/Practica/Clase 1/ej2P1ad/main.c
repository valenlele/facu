#include <stdio.h>

int convertirBinario(int *num);

int main() {
  int num;
  printf("Ingrese un numero: ");
  scanf("%d",&num);

  printf("El numero en binario es: %d",convertirBinario(&num));

  return 0;
}

int convertirBinario(int *num) {
  int binario=0;
  while (*num!=0) {
    binario = ((binario*10) + (*num%2));
    *num/=2;
  }
  return binario;
}
