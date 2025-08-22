package tp5.ejercicio2;

import java.util.List;
import tp5.ejercicio1.Graph;
import java.util.ArrayList;
import tp5.ejercicio1.Vertex;
import tp5.ejercicio1.Edge;
import tp1.ejercicio8.Queue;

public class Recorridos<T> {

  public List<Vertex<T>> dfs(Graph<T> grafo) {
    boolean[] marca = new boolean[grafo.getSize()];  //vector que indica los vertices visitados
    List<Vertex<T>> listaVertices = new ArrayList<>();
    for (int i = 0; i < grafo.getSize(); i++) {
      if (!marca[i]) {
        System.out.println("Largo con: " + grafo.getVertex(i).getData());
        this.dfs(i, grafo, marca, listaVertices);
      }
    }
    return listaVertices;
  }
  
  private void dfs(int i, Graph<T> grafo, boolean[] marca, List<Vertex<T>> listaVertices) {
    marca[i] = true;
    Vertex<T> v = grafo.getVertex(i);
    listaVertices.add(v);
    System.out.println(v);
    List<Edge<T>> adyacentes = grafo.getEdges(v);
    for (Edge<T> e : adyacentes) {
      int j = e.getTarget().getPosition();
      if (!marca[j]) {
        dfs(j, grafo, marca, listaVertices);	  
      }
    }
  }
  
  public List<Vertex<T>> bfs(Graph<T> grafo) {
    boolean[] marca = new boolean[grafo.getSize()];
    List<Vertex<T>> listaVertices = new ArrayList<>();
    for (int i = 0; i < marca.length; i++) {
      if (!marca[i]) {
        this.bfs(i, grafo, marca, listaVertices);
      }
    }
    return listaVertices;
  }
  
  private void bfs(int i, Graph<T> grafo, boolean[] marca, List<Vertex<T>> listaVertices) {
    Queue<Vertex<T>> q = new Queue<Vertex<T>>(); 
    q.enqueue(grafo.getVertex(i));
    marca[i] = true;
    while (!q.isEmpty()) {
      Vertex<T> w = q.dequeue();
      List<Edge<T>> adyacentes = grafo.getEdges(w);
      for (Edge<T> e : adyacentes) {
        int j = e.getTarget().getPosition();
        if (!marca[j]) {
          marca[j] = true;
          q.enqueue(e.getTarget());
        }
      }
    }
  }
	
}
