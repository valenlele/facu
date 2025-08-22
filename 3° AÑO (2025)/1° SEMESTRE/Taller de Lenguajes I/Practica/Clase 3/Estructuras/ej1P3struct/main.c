#include <stdio.h>
#include <stdlib.h>
#define dimF 5

typedef struct {
    float base;
    float altura;
  }Rectangulo;

void inicializarRectangulo(Rectangulo *rect);

float calcularArea(Rectangulo *rect);

int rectanguloMenorArea(Rectangulo arregloRect[dimF]);

int main() {
  Rectangulo rect;
  Rectangulo arregloRect[10];

  inicializarRectangulo(&rect);

  printf("El area del rectangulo es: %.2f \n",calcularArea(&rect));

  printf("Se inicializan %d rectangulos: \n",dimF);
  int i;
  for (i=0; i<dimF; i++) {
    printf("Rectangulo %d \n",i+1);
    inicializarRectangulo(&arregloRect[i]);
  }

  printf("El numero del rectangulo con el menor area es: %d", rectanguloMenorArea(arregloRect));

  return 0;
}

void inicializarRectangulo(Rectangulo *rect) {
  printf("Ingrese la base del rectangulo: ");
  scanf("%f",&(rect->base));
  printf("Ingrese la altura del rectangulo: ");
  scanf("%f",&(rect->altura));
}

float calcularArea(Rectangulo *rect) {
  return (rect->base)*(rect->altura);
}

int rectanguloMenorArea(Rectangulo arregloRect[dimF]) {
  int i;
  float area, minArea = 999999;
  int minRect = 0;

  for (i=0; i<dimF; i++) {
    area = calcularArea(&arregloRect[i]);
    if (area < minArea) {
      minArea = area;
      minRect = i;
    }
  }
  return minRect+1;
}
