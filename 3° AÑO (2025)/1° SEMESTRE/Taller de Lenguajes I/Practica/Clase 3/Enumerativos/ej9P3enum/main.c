#include <stdio.h>
#include <stdlib.h>

enum dias {DOMINGO = 1, LUNES, MARTES, MIERCOLES, JUEVES, VIERNES, SABADO};

void imprimirDiaSemana();

void imprimirDiaSemana2();

int main() {

  imprimirDiaSemana();

  imprimirDiaSemana2();

  return 0;
}

void imprimirDiaSemana() {
  int dia;
  printf("Ingrese un numero del 1 al 7 para imprimir el dia de la semana correspondiente: ");
  scanf("%d", &dia);

  if ((dia >= DOMINGO) && (dia <= SABADO)) {
    const char *nombreDia[] = {"", "Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado"};
    printf("El dia %d es: %s \n", dia, nombreDia[dia]);
  }
  else printf("Numero invalido \n");
}

void imprimirDiaSemana2() {
  int dia;
  printf("Ingrese un numero del 1 al 7 para imprimir el dia de la semana correspondiente: ");
  scanf("%d", &dia);

  switch (dia) {
    case DOMINGO:   printf("Domingo"); break;
    case LUNES:     printf("Lunes"); break;
    case MARTES:    printf("Martes"); break;
    case MIERCOLES: printf("Miercoles"); break;
    case JUEVES:    printf("Jueves"); break;
    case VIERNES:   printf("Viernes"); break;
    case SABADO:    printf("Sabado"); break;
    default:        printf("Numero invalido"); break;
  }
}
