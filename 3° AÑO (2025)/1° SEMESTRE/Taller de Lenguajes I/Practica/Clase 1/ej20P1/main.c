#include <stdio.h>

int leerN();

int damePar(int n);

int main() {
  damePar(leerN());
}

int leerN() {
  int n;
  printf("Ingrese la cantidad de nros pares que quiera imprimir: ");
  scanf("%d",&n);
  return n;
}

int damePar(int n) {
  for (int i=0; i<n; i++) {
    printf("%d \n",2*i);
  }
}
