#include <stdio.h>
#include <stdlib.h>
#define dimF 20

int esPalindromaIndices(const char *cadena);

int esPalindromaPunteros(const char *cadena);

int main() {

  char cadena[dimF];

  printf("Se ingresa una cadena de caracteres: ");
  scanf("%s", cadena);

  printf("%d \n", esPalindromaIndices(cadena));

  printf("%d", esPalindromaPunteros(cadena));

  return 0;
}

int esPalindromaIndices(const char *cadena) {
  int i = 0;
  int j = strlen(cadena) - 1;

  while (i < j) { //i < j en vez de i != j por si la palabra es par!!
    if (cadena[i] != cadena[j]) return 0;
    else {
      i++;
      j--;
    }
  }
  return 1;
}

int esPalindromaPunteros(const char *cadena) {
  const char *i = cadena;
  const char *j = cadena + strlen(cadena) - 1;

  while (i < j) {
    if (*i != *j) return 0;
    else {
      i++;
      j--;
    }
  }
  return 1;
}
