#include <stdio.h>

int factorial(int num) {
  int res=1;
  while (num>=2) {
    res*=num;
    num--;
  }
  return res;
}

int factorialRecursivo(int num) {
  if (num<=1) return 1;
  return num*factorialRecursivo(num-1);
}

int main() {
  int num;
  printf("Ingrese un numero para calcualar su factorial: ");
  scanf("%d",&num);
  printf("%d \n",factorial(num));
  printf("%d \n",factorialRecursivo(num));
}
