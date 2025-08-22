package ejPowerGrafos;

import java.util.LinkedList;
import tp5.ejercicio1.*;
import java.util.List;

public class Vuelos {
  public LinkedList<LinkedList<String>> caminoCostoTot10(Graph<String> g) {
    LinkedList<LinkedList<String>> caminos = new LinkedList<>();
    boolean[] visitados = new boolean[g.getSize()];
    LinkedList<String> caminoAux = new LinkedList<>();
    
    for (int i = 0; i < g.getSize(); i++) {
      AdjListVertex<String> origen = (AdjListVertex<String>) g.getVertex(i);
      caminoAux.add(origen.getData());
      visitados[i] = true;
      caminosR(origen, caminos, visitados, caminoAux, 0);	 
      caminoAux.removeLast();
      visitados[i] = false;
    }
    
    return caminos;
  }
  
  private void caminosR(AdjListVertex<String> act, LinkedList<LinkedList<String>> caminos, boolean[] visitados, LinkedList<String> caminoAux, int costoAct) {
    
    if (costoAct == 10) {
      caminos.add(new LinkedList<>(caminoAux));
      return;
    }
    
    else if (costoAct < 10) {
    	
      List<Edge<String>> ady = act.getEdges();
      for (Edge<String> e : ady) {
    	AdjListVertex<String> destino = (AdjListVertex<String>) e.getTarget();
    	int pesoAdy = e.getWeight();
    	int pos = e.getTarget().getPosition();
    	
    	if ((!visitados[pos]) && (costoAct + pesoAdy <= 10)) {
    	  visitados[pos] = true;
    	  caminoAux.add(destino.getData());
    	  
          caminosR(destino, caminos, visitados, caminoAux, costoAct + pesoAdy);	  
          
          caminoAux.removeLast();
          visitados[pos] = false;
        }
      }
    }
    
  }
 
}
