#include <stdio.h>
#include <stdlib.h>
#define N 50

//CODIGO 1:

 int main() {
  int arreglo1[N];
  return 0;
}

//CODIGO 2:

#include <stdlib.h>
int main() {
  int n;
  scanf("%d",&n);
  /* el usuario ingresa 50 */
  int arreglo3[n];
  return 0;
}

//CODIGO 3:

#include <stdio.h>
#include <stdlib.h>
#define N 50

int main() {
  int * arreglo2 = (int *) malloc (N*sizeof(int));
  return 0;
}

//a) CODIGO 1: arreglo estatico. CODIGO 2: de long variable. CODIGO 3: dinamico

//b) CODIGO 1: en compilacion. CODIGO 2: en ejecucion. CODIGO 3: en compilacion

//c) CODIGO 1: 50. CODIGO 2: lo que lea el usuario. CODIGO 3: 50

//d) CODIGO 1: no. CODIGO 2: no. CODIGO 3: si

//e) CODIGO 1: no. CODIGO 2: si. CODIGO 3: si

//f) CODIGO 1: si. CODIGO 2: si. CODIGO 3: no

//g) NI IDEA
