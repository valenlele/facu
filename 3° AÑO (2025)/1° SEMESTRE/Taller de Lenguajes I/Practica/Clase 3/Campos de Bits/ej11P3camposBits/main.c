#include <stdio.h>
#include <stdlib.h>

typedef struct {
  unsigned int hora : 5;
  unsigned int min : 6;
  unsigned int seg : 5;
} t_horario;

void leerHorario(t_horario *);

void imprimirHorario(t_horario);

int main() {

  t_horario horario;

  leerHorario(&horario);

  imprimirHorario(horario);

  return 0;
}

void leerHorario(t_horario *horario) {
  unsigned int h,m,s;

  printf("Se ingresa un horario: \n");
  printf("Hora: ");
  scanf("%u", &h);
  printf("Minutos: ");
  scanf("%u", &m);
  printf("Segundos: ");
  scanf("%u", &s);

  horario->hora = h;
  horario->min = m;
  horario->seg = s;
}

void imprimirHorario(t_horario horario) {
  printf("Horario leido: %u:%u:%u", horario.hora, horario.min, horario.seg);
}
