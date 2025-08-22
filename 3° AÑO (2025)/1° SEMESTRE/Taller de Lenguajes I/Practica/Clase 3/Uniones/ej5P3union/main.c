#include <stdio.h>
#include <stdlib.h>

typedef struct {
  unsigned  int dia : 8;
  unsigned int mes : 8;
  unsigned int anio : 16;
} t_fecha;

typedef union {
  t_fecha f;
  unsigned int fecha_int;
} fecha;

unsigned int codificarFecha(t_fecha f);

int main() {

  fecha fecha1, fecha2;

  fecha1.f.dia = 12;
  fecha1.f.mes = 4;
  fecha1.f.anio = 2024;

  fecha2.f.dia = 20;
  fecha2.f.mes = 5;
  fecha2.f.anio = 2025;

  fecha1.fecha_int = codificarFecha(fecha1.f);
  fecha2.fecha_int = codificarFecha(fecha2.f);

  printf("Fecha 1: %u/%u/%u --> %u \n",fecha1.f.dia,fecha1.f.mes,fecha1.f.anio,fecha1.fecha_int);
  printf("Fecha 2: %u/%u/%u --> %u \n",fecha2.f.dia,fecha2.f.mes,fecha2.f.anio,fecha2.fecha_int);

  if (fecha2.fecha_int > fecha1.fecha_int) printf("Fecha 2 mayor a fecha 1");


  return 0;
}

unsigned int codificarFecha(t_fecha f) {
  return f.anio * 10000 + f.mes * 100 + f.dia;
}
