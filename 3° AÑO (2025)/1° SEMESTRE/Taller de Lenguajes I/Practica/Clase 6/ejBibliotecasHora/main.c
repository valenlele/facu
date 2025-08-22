#include <stdio.h>
#include <stdlib.h>
#include "horario.h"

int main() {
  horario h;

  leerHorario(&h);

  visualizarHorario(h);

  visualizarHorario_AM_PM(h);

  return 0;
}
