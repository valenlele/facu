#include <stdio.h>
#include "horario.h"

void leerHorario(horario* h) {
  printf("Se ingresa un horario \n");

  printf("Hora: ");
  scanf("%d", &(h->hora));
  while ((h->hora < 0) || (h->hora >= 24)) {
    printf("Hora: ");
    scanf("%d", &(h->hora));
  }

  printf("Minutos: ");
  scanf("%d", &(h->minutos));
  while ((h->minutos < 0) || (h->hora >= 60)) {
    printf("Minutos: ");
    scanf("%d", &(h->minutos));
  }

  printf("Segundos: ");
  scanf("%d", &(h->segundos));
  while ((h->segundos < 0) || (h->segundos >= 60)) {
    printf("Segundos: ");
    scanf("%d", &(h->segundos));
  }
}

void visualizarHorario(horario h) {
  printf("Horario ingresado: ");

  printf("%d:%d:%d \n", h.hora, h.minutos, h.segundos);
}

void visualizarHorario_AM_PM(horario h) {
  printf("Horario ingresado AM/PM: ");

  if (h.hora == 0) printf("12:%d:%d AM", h.minutos, h.segundos);

  else if ((h.hora > 0) && (h.hora <= 11)) printf("%d:%d:%d AM", h.hora, h.minutos, h.segundos);

  else printf("%d:%d:%d PM", h.hora - 12, h.minutos, h.segundos);
}
