#include <stdio.h>
#include <stdlib.h>

int main() {
  FILE* vinosCsv = fopen("vinos.csv", "r");

  if (vinosCsv = NULL) {
    printf("Error al abrir el archivo");
    return 1;
  }

  char acFija[20];
  char acVolatil[20];
  char acCitrico[20];
  char azRes[20];
  char pH[20];
  char sulfatos[20];
  char alcohol[20];
  char calidad[20];
  char tipo[20];

  float acFija;
  float acVolatil;
  float acCitrico;
  float azRes;
  float pH;
  float sulfatos;
  float alcohol;
  int calidad;

  float totAcFija;
  float totAcVolatil;
  float totAcCitrico;
  float totAzRes;
  float totPH;
  float totSulfatos;
  float totAlcohol;
  int totCalidad;

  float minAcFija;
  float minAcVolatil;
  float minAcCitrico;
  float minAzRes;
  float minPH;
  float minSulfatos;
  float minAlcohol;
  int minCalidad;

  float maxAcFija;
  float maxAcVolatil;
  float maxAcCitrico;
  float maxAzRes;
  float maxPH;
  float maxSulfatos;
  float maxAlcohol;
  int maxCalidad;

  fscanf(vinosCsv, "%s", "%s", "%s", "%s", "%s", "%s", "%s", "%s", "%s", acFija, acVolatil, acCitrico, azRes, pH, sulfatos, alcohol, calidad, tipo); //salteo primera linea\

  while (fscanf(vinosCsv, "%f", "%f", "%f", "%f", "%f", "%f", "%f", "%d", &acFija, &acVolatil, &acCitrico, &azRes, &pH, &sulfatos, &alcohol, &calidad) {

  }

  return 0;
}

//abrir archivo csv para escritura (r)
  //si no se pudo abrir terminar programa

  //sino
    //recorrer el archivo
    //guardar el total de los atributos
    //guardar el maximo y minimo de los atributos
    //guardar total vinos

  //cerrar archivo csv

  //abrir archivo txt para escritura (r+, w, a+)
    //si no se pudo abrir terminar programa

  //sino
    //escribir en archivo txt los valores minimo, maximo y promedio de cada atributo
