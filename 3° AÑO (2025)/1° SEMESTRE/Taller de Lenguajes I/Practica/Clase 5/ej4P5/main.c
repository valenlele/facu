#include <stdio.h>
#include <stdlib.h>

int main() {
  FILE* f = fopen("apuestas.txt", "r");

  if (f == NULL) {
    printf("Error al abrir el archivo \n");
    return 1;
  }

  int codApuesta;
  float montoApostado, totApostado = 0;

  fscanf(f, "%d|%f;", &codApuesta, &montoApostado);
  while (!feof(f)) {
    totApostado += montoApostado;
    fscanf(f, "%d|%f;", &codApuesta, &montoApostado);
  }

  fclose(f);

  printf("El monto total apostado es: %.1f", totApostado);

  return 0;
}
