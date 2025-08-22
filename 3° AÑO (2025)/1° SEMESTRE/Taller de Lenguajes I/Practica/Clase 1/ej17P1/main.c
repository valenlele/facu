#include <stdio.h>

void minMaxFloat(int num, float *max, float *min);

int main() {
  int num;
  float max=-1,min=99999;

  printf("Ingrese una cantidad de numeros flotantes para leer: \n");
  scanf("%d",&num);
  minMaxFloat(num,&max,&min);

  printf("Maximo numero flotante leido: %.2f \n",max);
  printf("Minimo numero flotante leido: %.2f \n",min);
}

void minMaxFloat(int num, float *max, float *min) {
  float flo;

  printf("Se ingresan %d numeros flotantes: \n",num);
  for (int i=1; i<=num; i++) {
    scanf("%f",&flo);
    if (flo>*max) *max=flo;
    if (flo<*min) *min=flo;
  }
}
