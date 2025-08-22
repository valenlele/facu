package tp5.ejercicio1;

import java.util.List;
import java.util.ArrayList;

public class AdjListGraph<T> implements Graph<T> {

  private List<AdjListVertex<T>> vertices;	
	
  public AdjListGraph() {
    this.vertices = new ArrayList<>();	  
  }
  
  @Override
  public Vertex<T> createVertex(T data) {
    int newPos = this.vertices.size();
    AdjListVertex<T> vertex = new AdjListVertex<>(data, newPos);
    this.vertices.add(vertex);
    return vertex;
  }
  
  @Override
  public void removeVertex(Vertex<T> vertex) {
    int position = vertex.getPosition();
    if (this.vertices.get(position) != vertex) {//si es de una posicion que no corresponde a ningun vertice del grafo lo descarto
      return;
    }
    this.vertices.remove(position);
    for (;position < this.vertices.size(); position++) {
      this.vertices.get(position).decrementPosition();  //cada vertice guarda la posicion, por lo que tengo que recorrer toda la lista para disminuir en 1 la posicion que guarda cada vertice		
    }
  }
  
  @Override
  public Vertex<T> search(T data) {
    for (Vertex<T> vertex : this.vertices) {
      if (vertex.getData().equals(data)) {
        return vertex;
      }
    }
    return null;
  }
  
  public boolean belongs(Vertex<T> vertex) {
    int pos = vertex.getPosition();
    return ((pos >=0) && (pos < this.vertices.size()) && (this.vertices.get(pos) == vertex));
  }
  
  @Override
  public void connect(Vertex<T> origin, Vertex<T> destination) {
    if ((this.belongs(origin)) && this.belongs(destination)) {
      ((AdjListVertex<T>) origin).connect(destination);  //casteo con adjListVertex
    }
  }
  
  @Override
  public void connect(Vertex<T> origin, Vertex<T> destination, int weight) {
	  if ((this.belongs(origin)) && this.belongs(destination)) {
	      ((AdjListVertex<T>) origin).connect(destination,weight);  //casteo con adjListVertex
	    }    
  }
  
  @Override
  public void disconnect(Vertex<T> origin, Vertex<T> destination) {
    if (this.belongs(origin)) {
      ((AdjListVertex<T>) origin).disconnect(destination);	
    }
  }
  
  private Edge<T> edge(Vertex<T> origin, Vertex<T> destination) {
    if (this.belongs(origin)) {
      return ((AdjListVertex<T>) origin).getEdge(destination);	
    }
    return null;
  }
  
  @Override
  public boolean existsEdge(Vertex<T> origin, Vertex<T> destination) {
    return (this.edge(origin, destination) != null);  	  
  }
  
  @Override
  public boolean isEmpty() {
    return (this.vertices.isEmpty());  	  
  }
  
  @Override
  public List<Vertex<T>> getVertices() {
    return (new ArrayList<>(this.vertices));
  }
  
  @Override
  public int weight(Vertex<T> origin, Vertex<T> destination) {
    Edge<T> edge = this.edge(origin, destination);
    int weight = 0;
    if (edge != null) {
      weight = edge.getWeight();	
    }
    return weight;
  }
  
  @Override
  public List<Edge<T>> getEdges(Vertex<T> vertex) {
    if (this.belongs(vertex)) {
      return ((AdjListVertex<T>) vertex).getEdges();	
    }
    return null;
  }
  
  @Override
  public Vertex<T> getVertex(int pos) {
	if ((pos >= 0) && (pos < this.vertices.size())) {
	  return this.vertices.get(pos);	
	}
	return null;
  }
  
  @Override
  public int getSize() {
    return this.vertices.size();	  
  }
  
}
