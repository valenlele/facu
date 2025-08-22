#include <stdio.h>
#include <stdlib.h>

int main() {
  FILE* arch;
  FILE* archB;

  arch = fopen("prueba.txt", "w+");
  archB = fopen("pruebaB.txt", "wb+");

  if ((!arch) || (!archB)) {
    printf("Error al abrir archivo(s)");
    return -1;
  }

  int numeros[6] = {123456, 654321, 121212, 454545, 666666, 345671};

  fprintf(arch, "%d\n%d\n%d\n%d\n%d\n%d\n", numeros[0], numeros[1], numeros[2], numeros[3], numeros[4], numeros[5]);

  fwrite(numeros, sizeof(int), 6, archB);

  int tercerElem;

  fseek(arch, 0, SEEK_SET);
  int i;
  for (i = 0; i < 3; i++) {
    fscanf(arch, "%d", &tercerElem);
  }
  printf("Tercer elemento archivo de texto: %d \n", tercerElem);

  fseek(archB, 2*sizeof(int), SEEK_SET);
  fread(&tercerElem, sizeof(int), 1, archB);
  printf("Tercer elemento archivo binario: %d \n", tercerElem);

  fclose(arch);
  fclose(archB);

  return 0;
}
