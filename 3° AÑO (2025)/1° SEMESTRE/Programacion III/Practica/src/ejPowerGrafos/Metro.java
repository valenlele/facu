package ejPowerGrafos;

import java.util.LinkedList;
import tp5.ejercicio1.*;
import java.util.List;
import tp1.ejercicio8.*;

public class Metro {
  public LinkedList<Estacion> menosTrasbordos(Graph<String> maps, String origen) {
    LinkedList<Estacion> lista = new LinkedList<>();
    Queue<Estacion> q = new Queue<>();
    boolean[] visitados = new boolean[maps.getSize()];
    int cantTrasbordosAct = 0;
    Vertex<String> v = maps.search(origen);
    
    Estacion ee = new Estacion(v.getData(), cantTrasbordosAct);
    q.enqueue(ee);
    visitados[v.getPosition()] = true;
    
    while (!q.isEmpty()) {
      Vertex<Estacion> w = q.dequeue();	
    }
    
  }
}

//declaro cola
	//delcaro vec visitados
	//declaro cantTrasbordos actuales en 0
	  
	//marco origen como visitado
	//tomo cantTrasbordosActuales
	//lo agrego a la cola (agrego el nombre y la cant de trasbordos actuales)
	  
	//mientras la cola no esta vacia  
	  //desencolo
	  //tomo adyacentes
	  //recorro adyacentes
	    //si el adyacente no esta visitado
	  
	      //termino de recorrer adyacentes, si tiene solo un adyacente es un extremo; y no es el origen
	      //si la cantidad de trasbordos actuales es menor a la cantidad de trasbordos almacenada junto a la estacion en la cola
	        //guardo en la lista
	        //lo marco como no visitado
	  
	      //si la lista de adyacentes es de mas de 2, es un trasbordo
	      //incremento var canttrasbordos
	      //agrego adyacentes a la cola con la cantidad de trasbordos actuales
	      //marco como visitados los adyacentes