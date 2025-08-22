#include <stdio.h>
#include <stdlib.h>
#include <time.h>

//rand() % (max_number + 1 - minimum_number) + minimum_number

float randomito_float(float f_min, float f_max); //pueden no estar los nombres de las variables

void randomito_float2(float *c, float f_min, float f_max); //pueden no estar los nombres de las variables

int main() {

    srand(time(NULL));

    float f_max = 3.3;
    float f_min = 0.4;

    float a = (float)rand()/RAND_MAX; //da 0 o 1 si no casteo con float ya que rand() y randMax son dos enteros.   escala de 0 a 1
    float b = a*(f_max-f_min); //escalar de 0 a (max-min)
    float c = b * f_min; //

    printf("numero random float: %f\n",c);

    c = randomito_float(f_min,f_max);
    printf("Otro numero random: %f\n",c); //si no quiero guardarlo puedo hacer printf("Otro numero random: %f\n",randomito_float(f_min,f_max)); y sacar la instruccion de arriba

    randomito_float2(&c,f_min,f_max);
    printf("otro: %f",c);

    return 0;
}

float randomito_float(float f_min, float f_max) {

  float c;
  float a = (float)rand()/RAND_MAX;
  float b = a*(f_max-f_min);
  c = b + f_min;

  return c;
}

void randomito_float2(float *c, float f_min, float f_max) {

  float a = (float)rand()/RAND_MAX;
  float b = a*(f_max-f_min);
  (*c) = b + f_min;

}
