#include <stdio.h>

int main() {
  int x[5]={1,2,3,4,5};
  int *p = x; //puntero que apunta al vector x

    printf("La direccion memoria de p es %p \n", &p); //imprime la direccion de memoria de p (donde esta almacenado p)
    printf("La direccion la que apunta p es %p \n", p); //imprime lo mismo que antes? NO. imprime la direccion de memoria donde esta almacenado el vector al que apunta
    printf("El valor al que apunta p es %d \n", *p); //imprime el primer valor del vector? (1). SI

    p++; //aumenta en uno donde apunta p. p sigue almacenado en el mismo lugar

    printf("\n");

    printf("La direccion memoria de p ahora es %p \n", &p); //imprime una nueva direccion de memoria NO. p sigue almacenado en el mismo lugar
    printf("La direccion la que apunta p ahora es %p \n", p); //imprime lo mismo que antes? NO. porque p ahora apunta al lugar siguiente de memoria
    printf("El valor al que apunta p ahora es %d \n", *p); //imprime el primer valor del vector? (1) NO. imprime el segundo valor del vector (2) porque se p se movio en uno de donde apuntaba

    return 0;
}
