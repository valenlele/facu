#include <stdio.h>
#include <stdlib.h>
#define dimF 10

void calcularCantLetras(const char *, int *);

void informarCantLetras(const int *);

int main() {
  char cadena[dimF];
  int letras[26] = {0}; //inicializamos todo el arreglo en 0

  printf("Se ingresa una palabra: ");
  scanf("%s", cadena);

  calcularCantLetras(cadena,letras);

  informarCantLetras(letras);

  return 0;
}

void calcularCantLetras(const char *cadena, int *letras) {
  int i = 0;

  while (cadena[i] != '\0') {
    letras[cadena[i] - 'a']++; //supongamos que cadena[i] es 'c', en ASCII, 99('c') - 97('a') = 2, que representa la poiscion 2 de letras, osea 'c'
    i++;
  }
}

void informarCantLetras(const int *letras) {
  int i;
  for (i = 0; i<26; i++) {
    if (letras[i] > 0) {
      printf("La letra %c aparece %d veces \n", i + 'a', letras[i]);
    }
  }
}
