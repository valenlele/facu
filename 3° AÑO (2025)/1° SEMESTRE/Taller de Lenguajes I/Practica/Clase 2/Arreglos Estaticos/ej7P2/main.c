#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define anios 10
#define meses 12
#define dias 30
#define maxPrecipitacion 100

void cargarInfoPrecipitaciones(float infoPrecipitaciones[][meses][dias]);

void imprimirInfoPrecipitaciones(float infoPrecipitaciones[][meses][dias]);

void mesMenosLluviaXanio(float infoPrecipitaciones[][meses][dias]);

int anioMenorPrecipitacionPromedio(float infoPrecipitaciones[][meses][dias]);

int main() {
  srand(time(NULL));

  float infoPrecipitaciones[anios][meses][dias];

  cargarInfoPrecipitaciones(infoPrecipitaciones);

  imprimirInfoPrecipitaciones(infoPrecipitaciones);

  printf("El mes que menos en cada año es: \n");
  mesMenosLluviaXanio(infoPrecipitaciones);

  printf("\n");

  printf("El anio con la menor precipitacion promedio fue: %d",anioMenorPrecipitacionPromedio(infoPrecipitaciones));

  printf("\n");

  return 0;
}

void cargarInfoPrecipitaciones(float infoPrecipitaciones[][meses][dias]) {
  int i,j,k;

  for (i=0; i<anios; i++) {
    for (j=0; j<meses; j++) {
      for (k=0; k<dias; k++) {
        infoPrecipitaciones[i][j][k] = (float)rand()/RAND_MAX*(maxPrecipitacion);
      }
    }
  }
}

void imprimirInfoPrecipitaciones(float infoPrecipitaciones[][meses][dias]) {
  int i,j,k;

  for (i=0; i<anios; i++) {
    for (j=0; j<meses; j++) {
      for (k=0; k<dias; k++) {
        printf("Cantidad de mm de lluvia el dia %d del mes %d del anio %d: %.2f \n", k+1, j+1, i+1, infoPrecipitaciones[i][j][k]);
      }
      printf("\n");
    }
    printf("\n");
    printf("\n");
  }
}

void mesMenosLluviaXanio(float infoPrecipitaciones[][meses][dias]) {
  int i,j,k;

  float minLluviaXmes, cantLluviaXmes;
  int minMes;

  for (i=0; i<anios; i++) {
    minLluviaXmes = 99999;
    for (j=0; j<meses; j++) {
      cantLluviaXmes = 0;
      for (k=0; k<dias; k++) {
        cantLluviaXmes += infoPrecipitaciones[i][j][k];
      }
      if (cantLluviaXmes<minLluviaXmes) {
        minLluviaXmes = cantLluviaXmes;
        minMes = j;
      }
    }
    printf("Anio %d: mes %d \n", i+1, minMes+1);
  }
}

int anioMenorPrecipitacionPromedio(float infoPrecipitaciones[][meses][dias]) {
  int i,j,k;

  float cantLluviaXanio, cantLluviaPromXanio, minCantLluviaPromXanio = 99999.99;
  int minAnio = -1;

  for (i=0; i<anios; i++) {
    cantLluviaXanio = 0;
    for (j=0; j<meses; j++) {
      for (k=0; k<dias; k++) {
        cantLluviaXanio += infoPrecipitaciones[i][j][k];
      }
    }
    cantLluviaPromXanio = (float)(cantLluviaXanio / (meses*dias));
    if (cantLluviaPromXanio < minCantLluviaPromXanio) {
      minCantLluviaPromXanio = cantLluviaPromXanio;
      minAnio = i;
    }
  }

  return minAnio+1;
}

