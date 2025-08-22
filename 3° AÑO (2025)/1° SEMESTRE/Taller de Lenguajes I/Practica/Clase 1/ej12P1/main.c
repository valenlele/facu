#include <stdio.h>
#include <math.h>

int main()
{
  for (int i=1; i<=10; i++) {
    printf("La raiz cuadrada, cuadrado y cubo de %d es\n",i);
    printf("%.2f\n",sqrt(i));
    printf("%.2f\n",pow(i,2));
    printf("%.2f\n",cbrt(i));
  }
}
