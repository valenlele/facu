#include <stdio.h>
#include <stdlib.h>
#define DIMF 50

int main() {

  int i;
  int num;
  int nros[DIMF];
  int paresEnImpares=0,imparesEnPares=0;
  srand(time(NULL));

  for (i=0; i<DIMF; i++) {
    num = rand();
    nros[i] = num;
    if ((nros[i] % 2 == 0) && (i & 2 !=0)) paresEnImpares++;
    else imparesEnPares++;
  }

  for (i=0; i<DIMF; i++) {
    printf("Numero en pos %d: %d \n", i, nros[i]);
  }

  printf("Cantidad de numeros pares en posiciones impares: %d \n",paresEnImpares);
  printf("Cantidad de numeros impares en posiciones pares: %d \n",imparesEnPares);

  return 0;
}
