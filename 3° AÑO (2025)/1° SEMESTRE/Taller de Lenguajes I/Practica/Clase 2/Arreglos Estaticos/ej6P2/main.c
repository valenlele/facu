#include <stdio.h>
#define CANT_NUM 10

void sumarCantDigitos(int num, int vecCantDigitos[CANT_NUM]);

void imprimirCantDigitos(int vecCantDigitos[CANT_NUM]);

int main() {
  int num;
  int vecCantDigitos[CANT_NUM]={0};

  printf("Ingrese un numero entero: ");
  scanf("%d", &num);

  sumarCantDigitos(num,vecCantDigitos);

  imprimirCantDigitos(vecCantDigitos);

  return 0;
}

void sumarCantDigitos(int num, int vecCantDigitos[CANT_NUM]) {
  int dig;

  while (num!=0) {
    dig = num % 10;
    vecCantDigitos[dig]+=1;
    num /= 10;
  }
}

void imprimirCantDigitos(int vecCantDigitos[CANT_NUM]) {
  int i;

  for (i=0; i<CANT_NUM; i++) {
    printf("Cantidad de veces que aparece el dig %d: %d \n", i, vecCantDigitos[i]);
  }
}

