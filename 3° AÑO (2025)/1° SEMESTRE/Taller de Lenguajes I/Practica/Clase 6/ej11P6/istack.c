#include <stdio.h>
#include <limits.h>
#include "istack.h"

Stack* s_create () {                         //Retorna una nueva pila. Se debe invocar antes de manipular cualquiera de ellas.
  Stack* s = (Stack*) malloc(sizeof(Stack)); //reservo memoria para una estructura stack
  s->tope = NULL;
  s->cantElem = 0;
  return s;
}

int s_push(Stack* s, int n) {                //Apila n en s. Retorna el elemento apilado.
  Nodo* nodo = (Nodo*) malloc(sizeof(Nodo)); //reservar memoria para un nuevo nodo
  nodo->dato = n;                            //guardar el valor n en el campo del nodo
  nodo->ant = s->tope;                       //hacer que este nuevo nodo apunte al anterior (al tope de la pila actual)
  s->tope = nodo;                            //actualizar al nuevo nodo como el nuevo tope de la pila
  (s->cantElem)++;

  return n;
}

int s_pop (Stack* s) {             //Desapila un elemento de s.
  if (s->tope == NULL) return INT_MIN;
  Nodo* nodoBorrar = s->tope;      //asigno como nodo a borrar al nodo al tope de la pila
  s->tope = nodoBorrar->ant;       //asigno como al nuevo tope de la pila al nodo que le sigue al nodo a borrar

  int nBorrado = nodoBorrar->dato; //asingo como numero a devolver al dato del nodo a borrar
  free(nodoBorrar);                //libero el espacio del nodo a borrar
  (s->cantElem)--;
  return nBorrado;
}

int s_top (Stack s) { //Retorna el próximo elemento que será desapilado.
  if (s.tope == NULL) return INT_MIN;
  int n = s.tope->dato;
  return n;
}

int s_empty(Stack s) { //Retorna 1 si s está vacía, 0 en caso contrario.
  if (s.tope == NULL) return 1;
  return 0;
}

int s_length(Stack s) { //Retorna la cantidad de elementos apilados en s.
  return s.cantElem;
}
