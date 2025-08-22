#include <stdio.h>
#define CANTPAISES 3

int main() {
  int cod,cant,minCant1=9999,minCod1,minCant2=9999,minCod2,cant40=0;

  printf("Se ingresa informacion relativa a la cantidad de especies de aves de 14 países de América: \n");
  for (int i=1; i<=CANTPAISES; i++) {
    printf("Codigo del pais: ");
    scanf("%d",&cod);
    printf("Cantidad de especies: ");
    scanf(" %d",&cant);
    if (cant<minCant1) {
      minCod2=minCod1;
      minCant2=minCant1;
      minCant1=cant;
      minCod1=cod;
    }
    else if (cant<minCant2) {
      minCod2=cod;
      minCant2=cant;
    }
    if (cant>40) cant40++;
    printf("\n");
  }
  printf("Los dos paises con la menor cantidad de especies son: %d y %d \n",minCod1,minCod2);
  printf("El porcentaje de paises con mas de 40 especies es: %f %",((cant40*100)/CANTPAISES));
}
