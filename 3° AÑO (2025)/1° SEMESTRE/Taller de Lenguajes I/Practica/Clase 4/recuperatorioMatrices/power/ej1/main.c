#include <stdio.h>
#include <stdlib.h>
#define FIL 3
#define COL 5

void VerMatriz(int *, int f, int c);

int main() {
  int M[FIL][COL]={{1,2,3,4,5},
                    {6,7,8,9,10},
                    {11,12,13,14,15}};

  int *Dinamica = (int *) malloc(FIL*COL*sizeof(int));

  memcpy(Dinamica, M, sizeof(M));
  verMatriz(Dinamica, FIL,COL);
  free(Dinamica);
  return(0);
}

void verMatriz(int* m, int fil, int col) {
  int f, c;
  for (f = 0; f < fil; f++) {
    for (c = 0; c < col; c++) {
      printf("M[%d][%d] = %d \t", f + 1, c + 1, *m++);
    }
    printf("\n");
  }
}
