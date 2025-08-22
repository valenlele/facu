package tp3.ejercicio9;

import tp3.ejercicio1.*;
import java.util.List;

public class Parcial {

  //recorrer en preorden hasta encontrar caso falso
	
  //if (valorRaiz != min) return false; 
	
  public static boolean esDeSeleccion(GeneralTree<Integer> arbol) {
    if (arbol!=null) { 
      return esDeSeleccionRecursivo(arbol);	
    }
    return false;
  }
  
  private static boolean esDeSeleccionRecursivo(GeneralTree<Integer> nodo) {
    if (nodo.isLeaf()) {
      return true;  	
    }
    
    else {
	  int min = Integer.MAX_VALUE;	
      List<GeneralTree<Integer>> children = nodo.getChildren();
      
      for (GeneralTree<Integer> child : children) {
        if (child.getData() < min) min = child.getData();  
      }
      
      if (nodo.getData() != min) return false; 
      
      for (GeneralTree<Integer> child : children) {
        if (!esDeSeleccionRecursivo(child)) return false;  
      }
      
      return true;
      
    }
  }
	
}
