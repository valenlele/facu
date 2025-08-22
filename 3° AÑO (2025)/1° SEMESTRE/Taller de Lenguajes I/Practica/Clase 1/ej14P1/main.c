#include <stdio.h>

int invertirPosDigitos(int i) {
  int nuevoNum;
  while (i!=0) {
    nuevoNum=(nuevoNum*10)+(i%10);
    i/=10;
  }
  return nuevoNum;
}

int main() {
  int i;

  printf("Ingrese un numero para invertir la posicion de sus digitos: \n");
  scanf("%d",&i);

  printf("%d",invertirPosDigitos(i));
}
