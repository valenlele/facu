#include <stdio.h>
#include <stdlib.h>

typedef struct {
  int** datos;
  int base;
} Piramide;

Piramide crear_piramide (int);

void inicializar_piramide(Piramide, int);

void imprimir_piramide(Piramide, int);

void liberar_piramide(Piramide, int);

int main() {
  Piramide p;
  int n;

  printf("Ingrese el orden de la piramide: ");
  scanf("%d", &n);

  printf("\n");

  p = crear_piramide(n);
  printf("Se reservo memoria para una piramide de orden %d \n", n);

  printf("\n");

  printf("Ingrese datos para insertar en la piramide: \n");
  inicializar_piramide(p, n);

  printf("\n");

  printf("Piramide generada: \n");
  imprimir_piramide(p, n);

  liberar_piramide(p, n);

  return 0;
}

Piramide crear_piramide(int n) {
  Piramide aux;

  aux.base = n;

  aux.datos = (int**) calloc(n, sizeof(int*));

  int i;
  for (i = 0; i < n; i++) {
    aux.datos[i] = (int*) calloc(n - i, sizeof(int));
  }

  return aux;
}

void inicializar_piramide(Piramide p, int n) {
  int f, c;
  for (f = 0; f < n; f++) {
    for (c = 0; c < n - f; c++) {
      printf("[%d][%d] = ", f + 1, c + 1);
      scanf("%d", &p.datos[f][c]);
    }
  }
}

void imprimir_piramide(Piramide p, int n) {
  int f, c;
  for (f = 0; f < n; f++) {
    for (c = 0; c < n - f; c++) {
      printf("%d \t", p.datos[f][c]);
    }
    printf("\n");
  }
}

void liberar_piramide(Piramide p, int n) {
  int f;
  for (f = 0; f < n; f++) {
    free(p.datos[f]);
  }
  free(p.datos);
}
