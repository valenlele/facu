#include <stdio.h>
#include <stdlib.h>

/* int x=2, y=3;
int * m= (int*) malloc(x*y*sizeof(int)); */

//a) se puede modelar una matriz

//b) no, no se puede

int main() {
  int x=2, y=3;
  int* m= (int*) malloc(x*y*sizeof(int));

  int i, j, num;

  for (i = 0; i < x; i++) {
    for (j = 0; j < y; j++) {
      printf("Ingrese el elemento en la pos [%d][%d]: ", i+1, j+1);
      scanf("%d", &num);
      m[i*y + j] = num;
    }
  }

  for (i = 0; i < x; i++) {
    for (j = 0; j < y; j++) {
      printf("Elemento en la pos [%d][%d]: %d \n", i+1, j+1, m[i*y + j]);
    }
  }

  free(m);

  return 0;
}
