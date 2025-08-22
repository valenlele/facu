package ejPowerGrafos;

import java.util.LinkedList;
import tp5.ejercicio1.*;
import java.util.List;

public class AgenciaTurismo {
  public LinkedList<String> caminoDistanciaMaxima(Graph<String> ciudades, String origen, String destino, int distanciaMaxima) {
    boolean[] visitados = new boolean[ciudades.getSize()];
    LinkedList<String> camino = new LinkedList<>();
    Vertex<String> v = ciudades.search(origen);
    
    boolean encontre = caminoDistanciaMaximaR(ciudades, v, destino, camino, visitados); //necesito hacerlo con un boolean para saber cuando encontre el camino
    
    if (!encontre) return null;
    
    return camino;
  }
  
  private boolean caminoDistanciaMaximaR(Graph<String> ciudades, Vertex<String> act, String destino, LinkedList<String> camino, boolean[] visitados) {
	camino.add(act.getData());
	visitados[act.getPosition()] = true;
	  
	if (act.getData().equals(destino)) return true;
    
    List<Edge<String>> ady = ciudades.getEdges(act);
    for (Edge<String> a : ady) {
      if ((a.getWeight() <= 80) && (!visitados[a.getTarget().getPosition()])) {
        boolean encontre = caminoDistanciaMaximaR(ciudades, a.getTarget(), destino, camino, visitados);  	 
        if (encontre) return true;
      }
    }
    
    camino.removeLast();
    visitados[act.getPosition()] = false;
    return false;
  }
}
