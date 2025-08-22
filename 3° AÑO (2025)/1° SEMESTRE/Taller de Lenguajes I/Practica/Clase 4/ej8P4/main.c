#include <stdio.h>
#include <stdlib.h>

typedef struct nodo {
  int dato;
  struct nodo* sig;

} nodo;

void inicializarLista(nodo** lista);

void insertarAdelante(nodo** lista, int);

void imprimirLista(nodo* lista);

void eliminarMultlipos(nodo** lista, int);

void liberarMemoria(nodo** lista);

int main() {

  int num;
  nodo* lista;
  inicializarLista(&lista);

  printf("Se ingresan numeros hasta ingresar el 0 \n");
  do {
    printf("Ingrese un numero: ");
    scanf("%d", &num);
    if (num != 0) insertarAdelante(&lista, num);
  } while (num != 0);

  printf("Lista generada: \n");
  imprimirLista(lista);

  printf("Ingrese un numero para eliminar de la lista todos los numeros que sean multlipos del mismo: ");
  scanf("%d", &num);
  eliminarMultlipos(&lista, num);

  printf("Lista resultante: \n");
  imprimirLista(lista);

  liberarMemoria(&lista);

  return 0;
}

void inicializarLista(nodo** lista) {
  *lista = NULL;
}

void insertarAdelante(nodo** lista, int n) {
  nodo* nue = (nodo*) malloc(sizeof(nodo));

  nue->dato = n;
  nue->sig = *lista;
  *lista = nue;
}

void imprimirLista(nodo* lista) {
  nodo* aux = lista;

  while (aux != NULL) {
    printf("%d \n", aux->dato);
    aux = aux->sig;
  }
}

void eliminarMultlipos(nodo** lista, int num) {
  nodo* ant = NULL;
  nodo* act = *lista;

  while (act != NULL) {
    while ((act != NULL) && ((act->dato % num) != 0)) {
      ant = act;
      act = act->sig;
    }

    if (act != NULL) { //si encontre el elemento
      if (ant == NULL) { //si el elemento a borrar es el primero de la lista
        *lista = act->sig;
      }
      else { //si esta en el medio o al final
        ant->sig = act->sig;
      }

      free(act);
      act = ant;
    }
  }

}

void liberarMemoria(nodo** lista) {
  nodo* act = *lista;
  nodo* sig;

  while (act != NULL) {
    sig = act->sig;
    free(act);
    act = sig;
  }

  *lista = NULL;
}
