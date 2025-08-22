package tp5.ejercicio3;

import tp5.ejercicio1.Edge;
import tp5.ejercicio1.Graph;
import java.util.List;
import tp5.ejercicio1.Vertex;
import java.util.ArrayList;
import tp1.ejercicio8.*;
import java.util.LinkedList;

public class Mapa {
  Graph<String> mapaCiudades;
  
  //retorna camino (lista de ciudades) para ir de ciudad1 a ciudad2. DFS? 
  public List<String> devolverCamino(String ciudad1, String ciudad2) {
	boolean[] marca = new boolean[mapaCiudades.getSize()];
    List<String> camino = new ArrayList<>();
    
    Vertex<String> origen = mapaCiudades.search(ciudad1);
    if (origen == null) return camino; //no existe ciudad1
    
      boolean encontrado = devolverCamino(origen, camino, marca, ciudad2);
      
      if (!encontrado) {
        camino.clear();	  
      }
      
      return camino;
    }
  
  private boolean devolverCamino(Vertex<String> actual, List<String> camino, boolean[] marca, String destino) {
    camino.add(actual.getData());
    marca[actual.getPosition()] = true;
    
    if (actual.getData().equals(destino)) return true;
    
    //por cada adyacente llamo a devolverCamino
    for (Edge<String> e : mapaCiudades.getEdges(actual)) {
      if (!marca[e.getTarget().getPosition()]) {
        boolean encontrado = devolverCamino(e.getTarget(), camino, marca, destino);	
        if (encontrado) return true;
      }
    }
    
    //si llegue al final y no hay mas adyacentes saco el ultimo elemento de camino
    camino.removeLast();
    return false;
  }
  
 
  //retorna camino (lista de ciudades) para ir de ciudad1 a ciudad2 sin pasar por la lista de ciudades. DFS?
  public List<String> devolverCaminoExceptuando(String ciudad1, String ciudad2, List<String> ciudades) {
	  boolean[] marca = new boolean[mapaCiudades.getSize()];
	    List<String> camino = new ArrayList<>();
	    
	    Vertex<String> origen = mapaCiudades.search(ciudad1);
	    if (origen == null) return camino; //no existe ciudad1
	    
	      boolean encontrado = devolverCaminoExceptuando(origen, camino, marca, ciudad2, ciudades);
	      
	      if (!encontrado) {
	        camino.clear();	  
	      }
	      
	      return camino; 
  }
  
  private boolean devolverCaminoExceptuando(Vertex<String> actual, List<String> camino, boolean[] marca, String destino, List<String> ciudades) {
	    camino.add(actual.getData());
	    marca[actual.getPosition()] = true;   
	    
	    if (actual.getData().equals(destino)) return true;
	    
	    //por cada adyacente llamo a devolverCamino
	    for (Edge<String> e : mapaCiudades.getEdges(actual)) {
	      if (!marca[e.getTarget().getPosition()] && !ciudades.contains(e.getTarget().getData())) {
	        boolean encontrado = devolverCamino(e.getTarget(), camino, marca, destino);	
	        if (encontrado) return true;
	      }
	    }
	    
	    //si llegue al final y no hay mas adyacentes saco el ultimo elemento de camino
	    camino.removeLast();
	    return false;    
  }
  
  
  //camino mas corto para ir de ciudad1 a ciudad2 por numero de vertices. esta mal creo porque tendria que ser por pero de aristas
  public List<String> caminoMasCorto(String ciudad1, String ciudad2) {
    List<String> camino = new ArrayList<>();
    
    Vertex<String> origen = mapaCiudades.search(ciudad1);
    if (origen == null) return camino;
    
    if (origen.getData().equals(ciudad2)) return camino;
	
    int distancias[] = new int [mapaCiudades.getSize()];
	String ant[] = new String [mapaCiudades.getSize()];

    for (int i = 0; i < mapaCiudades.getSize(); i++) {
      distancias[i] = Integer.MAX_VALUE;
      ant[i] = null;
    }
    distancias[origen.getPosition()] = 0;
    
	Queue<Vertex<String>> q = new Queue<>();
	q.enqueue(origen);
	
    while (!q.isEmpty()) {
      Vertex<String> v = q.dequeue();
      List<Edge<String>> adyacentes = mapaCiudades.getEdges(v);
      
      for (Edge<String> e : adyacentes) {
    	int pos = e.getTarget().getPosition();
        if (distancias[pos] == Integer.MAX_VALUE) {
        	distancias[pos] = distancias[v.getPosition()] + 1;
        	ant[pos] = v.getData();
        	q.enqueue(e.getTarget());
        }
      }
    }
    
    String act = ciudad2;
    while (act != null) {
      camino.add(0, act);
      int pos = mapaCiudades.search(act).getPosition();
      act = ant[pos];
    }
    
    return camino;
  }
  
  
  //camino mas corto para llegar de ciudad1 a ciudad2 por peso de aristas. gasto de combustible de auto = a peso de arista
  public List<String> caminoSinCargarCombustible(String ciudad1, String ciudad2, int tanqueAuto) {
    boolean[] marca = new boolean[mapaCiudades.getSize()];
	List<String> camino = new ArrayList<>();
	    
	Vertex<String> origen = mapaCiudades.search(ciudad1);
	if (origen == null) return camino;
	    
	boolean encontrado = caminoSinCargarCombustible(origen, camino, marca, ciudad2, tanqueAuto, 0);
	      
	if (!encontrado) {
      camino.clear();	  
	}
	      
	return camino;   
  }
  
  private boolean caminoSinCargarCombustible(Vertex<String> actual, List<String> camino, boolean[] marca, String destino, int combustibleRestante, int combustibleAdy) {
	camino.add(actual.getData());
	marca[actual.getPosition()] = true;   
	
	if (combustibleRestante >= 0) {
	  if (actual.getData().equals(destino)) return true;
	    
	  for (Edge<String> e : mapaCiudades.getEdges(actual)) {
		if (!marca[e.getTarget().getPosition()]) {
	      combustibleAdy = e.getWeight();
	      boolean encontrado = caminoSinCargarCombustible(e.getTarget(), camino, marca, destino, combustibleRestante - combustibleAdy, combustibleAdy);	
	      if (encontrado) return true;
		}
	  }
	}
	
	marca[actual.getPosition()] = false;
	camino.removeLast();
	return false;  	  
  }
  
  
  public List<String> caminoConMenorCargaDeCombustible(String ciudad1, String ciudad2, int tanqueAuto) { 
    Vertex<String> origen = mapaCiudades.search(ciudad1);
    if (origen == null) return null;
    
    List<String> camino = new LinkedList<>();
    boolean[] visitados = new boolean[mapaCiudades.getSize()];
    List<String> mejorCamino = new LinkedList<>();
    
    caminoConMenorCargaDeCombustible((LinkedList<String>) camino, origen, ciudad2, visitados, tanqueAuto, (LinkedList<String>) mejorCamino, 0, Integer.MAX_VALUE, tanqueAuto);
    
    return camino;
  }
  
  
  private int caminoConMenorCargaDeCombustible(LinkedList<String> camino, Vertex<String> actual, String destino, boolean[] visitados, int combustibleActual, LinkedList<String> mejorCamino, int cantCargas, int minCargas, int tanqueAuto) {
    
	mejorCamino.add(actual.getData());
	visitados[actual.getPosition()] = true;
	  
	//si llegue al destino y las cargas son menores al camino actual, actualizo el camino
	if (actual.getData().equals(destino)) {
	  camino.clear();
	  actualizarCamino(camino, mejorCamino);  
	  return cantCargas;
	}
	
	else if (cantCargas < minCargas) { //vale la pena seguir por aca? las cargas que tengo hasta ahora son menores que las que tengo por el mejor camino?
	  for (Edge<String> e : mapaCiudades.getEdges(actual)) {
	    int combustibleAdyacente = e.getWeight();
        if ((!visitados[e.getTarget().getPosition()]) && (combustibleAdyacente < tanqueAuto)){
    	
    	  //si no tengo combustible suficiente para el camino, cargo combustible
    	  if (combustibleActual - combustibleAdyacente < 0) {
            minCargas = caminoConMenorCargaDeCombustible(camino, e.getTarget(), destino, visitados, tanqueAuto - combustibleAdyacente, mejorCamino, cantCargas + 1, minCargas, tanqueAuto);  
    	  }
    	
    	  //sino, no cargo
    	  else {
    	    minCargas = caminoConMenorCargaDeCombustible(camino, e.getTarget(), destino, visitados, combustibleAdyacente - combustibleAdyacente, mejorCamino, cantCargas, minCargas, tanqueAuto);
    	  }
    	  
    	  mejorCamino.removeLast();
    	  visitados[actual.getPosition()] = false;
    	
        }
      }
	}
	
	return minCargas;
	
  }
  
  private void actualizarCamino(LinkedList<String> camino, LinkedList<String> mejorCamino) {
    for (String ciudad : mejorCamino) {
      camino.add(ciudad);
    }
  }
  
}
