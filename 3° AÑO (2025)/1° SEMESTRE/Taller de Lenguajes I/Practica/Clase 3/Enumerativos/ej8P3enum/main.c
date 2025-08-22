#include <stdio.h>
#include <stdlib.h>

typedef enum { IZQUIERDA, CENTRO_H, DERECHA } AlineacionHorizontal; //IZQUIERDA=0, CENTRO_H=1, DERECHA=2

typedef enum { ARRIBA=1, CENTRO_V, ABAJO } AlineacionVertical; //ARRIBA=1, CENTRO_V=2, ABAJO=3

typedef enum { DOS=2, CERO=0, UNO, MENOS_UNO=-1, OTRO } Numeros; //DOS-2, CERO=0, UNO=1, MENOS_UNO=-1, OTRO=0

typedef enum { LET_A = "A", LET_B, LET_Z = "Z" } Letras; //no compila --> son cadenas de caracteres

typedef enum { LETRA_A = 'A', LETRA_B, LETRA_Z = 'Z' } Letras2; //LETRA_A='A', LETRA_B='B', LETRA_Z='Z' --> son constantes de tipo int basadas en su valor ASCII

int main() {
  return 0;
}
