#include <stdio.h>

int main()
{
  for (int i = 0; i <= 11; i++)
    printf("%d\n",i);

  printf("\n");

  for (int i = 0; i <= 11; ++i)
    printf("%d\n",i);

  printf("\n");

  for (int i = 2; i <= 11; i+=2)
    printf("%d\n",i);

  printf("\n");

  for (int i = 1; i <= 11; i*=2)
    printf("%d\n",i);

  printf("\n");

  for (int i = 11; i >= 1; i-=2)
    printf("%d\n",i);

  printf("\n");

  for (int i = 11; i > 1; i+=1)
    printf("%d\n",i);
}
