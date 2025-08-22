#include <stdio.h>

int main()
{
  int num1,num2;
  char op;

  printf("Ingrese dos numeros enteros y un operador matematico: \n");
  scanf("%d",&num1);
  scanf(" %c",&op);
  scanf(" %d",&num2);

  switch (op) {
    case '+': printf("Resultado: %d",num1+num2);
    break;
    case '-': printf("Resultado: %d",num1-num2);
    break;
    case '*': printf("Resultado: %d",num1*num2);
    break;
    case '/': printf("Resultado: %d",num1/num2);
    break;
    default: printf("Error");
  }
}
