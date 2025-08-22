#include <stdio.h>
#include <stdlib.h>

typedef enum {Bluetooth = 128, Wifi = 64, GPS = 32, Datos = 16, Frontal = 8, Trasera = 4, Linterna = 2, Vibrar = 1} modulos;

void activarModulo(int *m1);

void desactivarModulo(int *m1);

void invertirModulo(int *m1);

void estado(int m1);

void estadoModulos(int m1);

int main() {

  const int todosEncendidos = 255;

  const int todosApagados = 0;

  unsigned short int m1;
  printf("Ingrese un numero entre 0 y 255: ");
  scanf("%d", &m1);

  estadoModulos(m1);

  estado(m1);

  desactivarModulo(&m1);

  estado(m1);

  activarModulo(&m1);

  estado(m1);

  invertirModulo(&m1);

  estado(m1);

  estadoModulos(m1);

  return 0;
}

void activarModulo(int *m1) {
  int n;
  printf("Elija un modulo a activar: (7 Bluetooth, 6 Wifi, 5 GPS, 4 Datos, 3 Frontal, 2 Trasera, 1 Linterna, 0 Vibrar) \n");
  scanf("%d", &n);

  *m1 |= 1 << n;
}

void desactivarModulo(int *m1) {
  int n;
  printf("Elija un modulo a desactivar: (7 Bluetooth, 6 Wifi, 5 GPS, 4 Datos, 3 Frontal, 2 Trasera, 1 Linterna, 0 Vibrar) \n");
  scanf("%d", &n);

  *m1 &= ~(1 << n);
}

void invertirModulo(int *m1) {
  int n;
  printf("Elija un modulo para invertir su estado actual: (7 Bluetooth, 6 Wifi, 5 GPS, 4 Datos, 3 Frontal, 2 Trasera, 1 Linterna, 0 Vibrar) \n");
  scanf("%d", &n);

  *m1 ^= (1 << n);
}

void estado(int m1) {
  int n;
  printf("Elija un modulo para saber su estado: (7 Bluetooth, 6 Wifi, 5 GPS, 4 Datos, 3 Frontal, 2 Trasera, 1 Linterna, 0 Vibrar) \n");
  scanf("%d", &n);

  if (m1 & (1 << n)) {
    printf("El modulo %d esta activado \n", n);
  }
  else printf("El modulo %d esta desactivado \n", n);
}

void estadoModulos(int m1) {
  int i;
  for (i = 0; i<8; i++) {
    if (m1 & (1 << i)) {
      printf("El modulo %d esta activado \n", i);
    }
    else {
      printf("El modulo %d esta desactivado \n", i);
    }
  }
}
