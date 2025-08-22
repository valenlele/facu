#include <stdio.h>
#include <stdlib.h>

typedef _sinonimos_t struct{
  char palabra[TAM_PALABRA+1];
  char cant_sinonimos;
  char [MAX_SINONIMOS][ TAM_PALABRA+1] sinonimos;
} sinonimos_t;

int main() {
  FILE* archT = fopen("sinonimos.txt", "w");
  FILE* archB = fopen("sinonimos.dat", "rb");

  if ((!archT) || (!archB)) {
    printf("Error al abrir archivo(s): ");
    return -1;
  }

  sinonimos_t s;

  fread(&s, sizeof(sinonimos_t), 1, archB);
  fprintf(arch, "%s |", s.palabra);
  int i;
  for (i = 0; i < s.cant_sinonimos; i++) {
    fprintf(archT, "%s |", s.sinonimos[i]);
  }

  fclose(archT);
  fclose(archB);

  return 0;
}
