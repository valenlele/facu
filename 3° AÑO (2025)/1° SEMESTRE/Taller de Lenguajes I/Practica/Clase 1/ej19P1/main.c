#include <stdio.h>
#include <stdlib.h>

void operaciones(int *punt);

int main() {
  int punt=0;
  srand(time(NULL));

  operaciones(&punt);

  switch (punt){
    case 4: printf("NOTA: A");
            break;
    case 3: printf("NOTA: B");
            break;
    case 2: printf("NOTA: C");
            break;
    case 1: printf("NOTA: D");
            break;
    case 0: printf("NOTA: E");
            break;
  }
}

void operaciones(int *punt) {
  int op1,op2,res;

  printf("Se muestran a continuacion 4 operaciones de sumas de enteros: \n");
  for (int i=1; i<=4; i++) {
    op1 = rand() % 101;
    op2 = rand() &101;
    printf("Cuanto es %d + %d? \n",op1,op2);
    scanf("%d",&res);
    if (res==(op1+op2)) (*punt)++;
  }
}
