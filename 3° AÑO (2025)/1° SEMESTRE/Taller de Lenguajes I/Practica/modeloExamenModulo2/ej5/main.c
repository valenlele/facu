#include <stdio.h>
#include <stdlib.h>

typedef struct {
  int codProv;
  int codLoc;
  char nomLoc[30];
  int nHab;
} destino;

int main() {
  FILE* arch = fopen("Habitantes.txt", "r");
  FILE* archB = fopen("Habitantes.dat", "wb+");

  if ((!arch) || (!archB)) {
    printf("Error al abrir archivo(s)");
    return -1;
  }

  destino d;

  while (fscanf(arch, "%d %d %s %d", &d.codProv, &d.codLoc, &d.nomLoc, &d.nHab) == 4) {
    fwrite(&d, sizeof(destino), 1, archB);
  }

  fclose(arch);

  fseek(archB, 0, SEEK_SET);

  int maxHab = -1, maxCodLoc;
  char maxLoc[30];

  while (fread(&d, sizeof(destino), 1, archB) == 1) {
    if (d.nHab > maxHab) {
      maxHab = d.nHab;
      maxCodLoc = d.codLoc;
      strcpy(maxLoc, d.nomLoc);
    }
  }

  printf("Codigo y nombre de localidad con mayor cantidad de habitantes: %d %s", maxCodLoc, maxLoc);

  fclose(archB);

  return 0;
}
