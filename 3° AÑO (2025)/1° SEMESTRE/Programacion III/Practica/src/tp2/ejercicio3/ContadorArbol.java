package tp2.ejercicio3;

import tp2.ejercicio1.*;
import java.util.*;
import paqueteFuncionesArboles.*;

public class ContadorArbol {	
	
  public static void main(String args[]) {
    Scanner in = new Scanner (System.in);
   FuncionesArboles f = new FuncionesArboles();
	  
    BinaryTree<Integer> ab = new BinaryTree<>();
    ArrayList<Integer> listaPares = new ArrayList<>(); //??
    
    f.cargarArbolInteger(ab, in);
    
    //System.out.println("Los numeros pares del arbol son: " + numerosParesInOrden(ab,listaPares).toString());
    
    System.out.println("Los numeros pares del arbol son: " + numerosParesPostOrden(ab,listaPares).toString());
    
    in.close();  
  }
 
  public static ArrayList<Integer> numerosParesInOrden(BinaryTree<Integer> ab, ArrayList<Integer> listaPares) {
    if (ab.hasLeftChild()) {
      numerosParesInOrden(ab.getLeftChild(),listaPares);
    }
    
    if (ab.getData() % 2 == 0) {
      listaPares.add(ab.getData());
    }
    
    if (ab.hasRightChild()) {
      numerosParesInOrden(ab.getRightChild(),listaPares);
    }
    return listaPares;
  }
  
  public static ArrayList<Integer> numerosParesPostOrden(BinaryTree<Integer> ab, ArrayList<Integer> listaPares) {
    if (ab.hasLeftChild()) {
	  numerosParesPostOrden(ab.getLeftChild(),listaPares);
	}	
    if (ab.hasRightChild()) {
      numerosParesPostOrden(ab.getRightChild(),listaPares);
    }
    if (ab.getData() % 2 == 0) {
      listaPares.add(ab.getData());
    }
    return listaPares;
  }
	
}
