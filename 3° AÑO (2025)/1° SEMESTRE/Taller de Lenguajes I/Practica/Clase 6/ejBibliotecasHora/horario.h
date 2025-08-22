#ifndef HORARIO_H_INCLUDED
#define HORARIO_H_INCLUDED

typedef struct {
  int hora;
  int minutos;
  int segundos;
} horario;

void leerHorario(horario* h);

void visualizarHorario(horario h);

void visualizarHorario_AM_PM(horario h);

#endif // HORARIO_H_INCLUDED
