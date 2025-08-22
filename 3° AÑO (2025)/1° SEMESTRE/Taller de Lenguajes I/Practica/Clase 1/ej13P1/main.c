#include <stdio.h>
#include <stdlib.h>

int esPrimo(int i);

int main() {
  int i;
  printf("Ingrese un numero para saber si es primo: \n");
  scanf("%d",&i);
  if (esPrimo(i)==0) printf("%d no es primo \n",i);
  else printf("%d es primo \n",i);

  int contPrimos=0;
  printf("Se ingresan numeros hasta ingresar 5 primos: \n");
  while (contPrimos!=5) {
    printf("Ingrese un numero: \n");
    scanf("%d",&i);
    if (esPrimo(i)==1) contPrimos++;
  }
}

int esPrimo(int i) {
  if (i<2) return 1;

  for (int j=2; j<i; j++) if (i%j==0) return 0;

  return 1;
}

