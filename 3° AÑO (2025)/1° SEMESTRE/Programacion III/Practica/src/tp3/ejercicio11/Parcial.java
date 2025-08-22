package tp3.ejercicio11;

import paqueteFuncionesArbolesGenerales.*;
import tp3.ejercicio1.GeneralTree;
import java.util.Scanner;
import tp1.ejercicio8.*;

public class Parcial {

  public static void main(String[] args) {
    FuncionesArbolesGenerales f = new FuncionesArbolesGenerales();
	Scanner in = new Scanner(System.in);	
	GeneralTree<Integer> ab = new GeneralTree<>(); 
	    
	f.cargarArbolInteger(ab,in);    	  
	
	System.out.println(resolver(ab));
	
	in.close();
  }
  
  public static boolean resolver(GeneralTree<Integer> arbol) {
	if (arbol != null) {
		
	  GeneralTree<Integer> nodoAux;
      Queue<GeneralTree<Integer>> cola = new Queue<>();    
      int cantNodosAct = 1;  //cantidad de nodos en el nivel actual
      int cantNodosSig = 0;
      
      cola.enqueue(arbol);
      cola.enqueue(null);

      while (!cola.isEmpty()) {
    	  
        nodoAux = cola.dequeue();
        if (nodoAux != null) { //si todavia no termine de procesar el nivel
        	
          for (GeneralTree<Integer> child : nodoAux.getChildren()) {
            cola.enqueue(child);	
            cantNodosSig++;
          }        
          
        }
        else if (!cola.isEmpty()) { //sino, si termine de procesar un nivel pero todavia quedan niveles para procesar
          if (cantNodosSig == cantNodosAct + 1) {
            cantNodosAct = cantNodosSig;
            cantNodosSig = 0;
            cola.enqueue(null);
          }
          else return false;
        }
      }
      return true;
    }
	
	else return false;
  }
}