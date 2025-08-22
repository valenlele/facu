#include <stdio.h>
#include <stdlib.h>

// Frecuencia de tonos musicales
typedef enum tono {BASE=440, DO=262, RE=294, MI=330, FA=349, SOL=392, LA=440, SI=494} tono_t;

// Estructura de comando
typedef struct comando {
  unsigned encendido  : 1;  //falta ;, y poner unsigend int --> no es necesario el int pero si el ;
  unsigned frecuencia : 15;  //falta ;, y poner unsigend int
} comando_t;

// Encendido y apagado del dispositivo
#define NO 0
#define SI 1

/* Prototipos */
comando_t recibir_comando();  //el tipo que devuelve es comando_t, no comando --> correcto

void generar_sonido(comando_t);

int main() {
  comando_t c;
  printf("Encendiendo el dispositivo...\r\n");
  c = recibir_comando();

  while(c.encendido == SI) {
    // Es un valor de frecuencia válido
    if(c.frecuencia == DO || c.frecuencia == RE  || c.frecuencia == MI ||
       c.frecuencia == FA || c.frecuencia == SOL || c.frecuencia == LA ||
       c.frecuencia == SI) generar_sonido(c);  // Generar tono correspondiente
    else printf("ERROR: Valor de frecuencia incorrecto.\r\n");

    c = recibir_comando();
  }

  printf("Apagando el dispositivo...\r\n");

  return 0;
}
// Leer comando desde la entrada estándar con el formato "encendido.frecuencia"
comando_t recibir_comando(){
  comando_t c;
  int encendidoTemp;
  int frecuenciaTemp;

  printf("Ingrese comando: \n");
  scanf("%d", &encendidoTemp);  // Leer comando //no se pueden leer directamente los campos de bits
  scanf("%d", &frecuenciaTemp);

  c.encendido = encendidoTemp;
  c.frecuencia = frecuenciaTemp;

  return c;  //faltaba el retorno
}

// Generar tono recibido por parámetro (sin implementar)
void generar_sonido(comando_t c){
  printf("Tono: %d Hz\r\n", c.frecuencia);  //es c.frecuencia, no c->frecuencia --> correcto
  // Generar sonido ...
  return;  //no es necesario el return
}
