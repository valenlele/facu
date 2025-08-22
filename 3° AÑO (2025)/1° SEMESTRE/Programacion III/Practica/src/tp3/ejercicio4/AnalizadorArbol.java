package tp3.ejercicio4;

import java.util.List;

import tp1.ejercicio8.Queue;
import tp3.ejercicio1.*;

public class AnalizadorArbol {

  public int devolverMaximoPromedio (GeneralTree<AreaEmpresa> arbol)	{
    int maxPromedio = -1;
    int promedio = 0;
    int totDelay;
    int totNodosNivel;
    
	GeneralTree<AreaEmpresa> abAux;    
	Queue<GeneralTree<AreaEmpresa>> cola = new Queue<>();
	Queue<GeneralTree<AreaEmpresa>> altSig = new Queue<>();
	  
	cola.enqueue(arbol);
	  
	while (!cola.isEmpty()) {
	  totDelay = 0;
	  totNodosNivel = 0;
	  while (!cola.isEmpty()) {
	    abAux = cola.dequeue();
	    totDelay += abAux.getData().getDelayTransmision();
	    totNodosNivel++;
		List<GeneralTree<AreaEmpresa>> children = abAux.getChildren();
		for (GeneralTree<AreaEmpresa> child: children) {
		  altSig.enqueue(child);
		}
      }
	  promedio = totDelay / totNodosNivel;
	  if (promedio > maxPromedio) {
	    maxPromedio = promedio;	  
	  }
	  cola = altSig;
	  altSig = new Queue<>();
	}
	return maxPromedio;    	  
  }
	
}
