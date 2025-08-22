#include <stdio.h>
#include <stdlib.h>
#define dimF 50
#include <time.h>
#include <string.h>

const char *palos[] = {"Oro", "Espada", "Copa", "Basto"};

typedef struct carta {
  int valor;
  char palo[10];
} t_carta;

void inicializarMazo(t_carta mazo[dimF]);

void barajar(t_carta mazo[dimF]);

t_carta sacarCarta(t_carta mazo[dimF], int *indice);

void imprimirCarta(t_carta carta);

int main() {

  t_carta mazo[dimF];

  inicializarMazo(mazo);

  barajar(mazo);

  int indice = 0;

  printf("Sacamos 5 cartas: \n");
  int i;
  for (i = 0; i < 5; i++) {
    t_carta c = sacarCarta(mazo,&indice);
    imprimirCarta(c);
  }

  return 0;
}

void inicializarMazo(t_carta mazo[dimF]) {
  int i;
  int j;
  int k = 0;

  for (i = 0; i < 4; i++) {
    for (j = 1; j<=12; j++) {
      mazo[k].valor = j;
      strcpy(mazo[k].palo, palos[i]);
      k++;
    }
  }

  for (i = 48; i < 50; i++) {
    mazo[i].valor = 0;
    strcpy(mazo[i].palo, "Comodin");
  }
}

void barajar(t_carta mazo[dimF]) {
  srand(time(NULL));

  int i;
  for (i = dimF - 1; i > 0; i--) {
    int j = rand() % (i + 1);
    t_carta temp = mazo[i];
    mazo[i] = mazo[j];
    mazo[j] = temp;
  }
}

t_carta sacarCarta(t_carta mazo[dimF], int *i) {
  if (*i < dimF) {
    return mazo[(*i)++];
  }
  else {
    t_carta vacia = {0,"Sin cartas"};
    return vacia;
  }
}

void imprimirCarta(t_carta carta) {
  printf("%d de %s \n", carta.valor, carta.palo);
}
