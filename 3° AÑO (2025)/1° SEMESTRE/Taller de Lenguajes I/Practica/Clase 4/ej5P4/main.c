#include <stdio.h>
#include <stdlib.h>

void informarMinMayus(arregloCaracteres);

int main() {

  char* arregloCaracteres = NULL;

  arregloCaracteres = (char*) malloc(100 * sizeof(char));

  printf("Se ingresan 10 oraciones de 10 caracteres cada una: \n");
  int i;
  for (i = 0; i < 10; i++) {
    printf("Oracion %d: \n", i+1);
    gets(arregloCaracteres);
    informarMinMayus(arregloCaracteres);
  }

  free(arregloCaracteres);

  return 0;
}

void informarMinMayus(char* arregloCaracteres) {
  int cantMin = 0;
  int cantMay = 0;

  int i = 0;
  while (arregloCaracteres[i] != '\0') {
    if ((arregloCaracteres[i] >= 'a') && (arregloCaracteres[i] <= 'z')) cantMin++;
    else if ((arregloCaracteres[i] >= 'A') && (arregloCaracteres[i] <= 'Z')) cantMay++;
    i++;
  }
  printf("Cantidad letras minusculas: %d. Cantidad letras mayusculas: %d \n", cantMin, cantMay);
}
