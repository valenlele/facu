#include <stdio.h>
#include <stdlib.h>

int main()
{
    float km,millas;

    printf("Imprima una distancia en km para convertirla en millas: \n");
    scanf("%f",&km);

    millas = km / 1.609;

    printf("El equivalente de %f km es %f millas\n",km,millas);

    return 0;
}
