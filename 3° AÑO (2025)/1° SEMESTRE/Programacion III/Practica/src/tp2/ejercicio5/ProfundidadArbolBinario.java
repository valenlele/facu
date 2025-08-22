package tp2.ejercicio5;

import tp2.ejercicio1.*;
import java.util.Scanner;
import paqueteFuncionesArboles.*;

import tp1.ejercicio8.Queue;

public class ProfundidadArbolBinario {

  public static void main(String[] args) {
	Scanner in = new Scanner(System.in);  
	FuncionesArboles f = new FuncionesArboles();
	
	int p;
    BinaryTree<Integer> ab = new BinaryTree<>();
    
    f.cargarArbolInteger(ab, in);
    
    System.out.println("");
    
    p = in.nextInt();
    
    System.out.println("La suma de todos los nodos del arbol que se encuentran en la profundiad " + p +" es: " + sumaElementosProfundidad(ab,p));
    
    in.close();
  }
  
  public static int sumaElementosProfundidad(BinaryTree<Integer> ab, int p) {
	int nivel = 0;
	int sumaNodos = 0;
	
    Queue<BinaryTree<Integer>> cola = new Queue<BinaryTree<Integer>>();
	cola.enqueue(ab);
	cola.enqueue(null);
	while (!cola.isEmpty()) {
	  ab = cola.dequeue();
	  if (ab != null) {
	    if (p==nivel) {
	      sumaNodos += ab.getData();
	    }
		if (ab.hasLeftChild()) {
		  cola.enqueue(ab.getLeftChild());
		}
		if (ab.hasRightChild()) {
		  cola.enqueue(ab.getRightChild());
		}
      } else if (!cola.isEmpty()) {
	    System.out.println();
		cola.enqueue(null);
		nivel++;
	  }
	}
	return sumaNodos;
  }
	
}
